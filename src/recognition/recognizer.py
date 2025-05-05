"""
Recognition Module

This module handles the recognition of characters from detected blobs.
It implements the second stage of the processing pipeline for both FPGA and CPU implementations.
"""

from typing import List, Dict
import json
from pathlib import Path
import os

class Recognizer:
    """
    Recognizes characters from detected blobs by summing pixel intensities
    and mapping them to ASCII characters using binary search in sorted mapping table.
    """
    
    def __init__(self, verbose: bool = False):
        """
        Initialize the recognizer.
        
        Args:
            verbose (bool): If True, print debug information. If False, stay silent.
        """
        self.verbose = verbose
        
        # Load mapping table from combination_batch_plan.json
        try:
            mapping_file = Path(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))) / "output/combination_batch_plan.json"
            with open(mapping_file, 'r') as f:
                mapping_data = json.load(f)
            
            # Extract prefix sums and characters, sort by prefix sum
            self.PREFIX_SUMS = []
            self.CHARS = []
            for char, data in mapping_data.items():
                self.PREFIX_SUMS.append(data['total_prefix_sum'])
                self.CHARS.append(char)
            
            # Sort both lists by prefix sum
            sorted_pairs = sorted(zip(self.PREFIX_SUMS, self.CHARS))
            self.PREFIX_SUMS, self.CHARS = zip(*sorted_pairs)
            
            if self.verbose:
                print(f"Loaded mapping table with {len(self.PREFIX_SUMS)} entries")
                print("Prefix sums and characters:")
                for sum_val, char in zip(self.PREFIX_SUMS, self.CHARS):
                    print(f"  {char}: {sum_val}")
        except Exception as e:
            raise RuntimeError(f"Failed to load mapping table: {e}")

    def _find_exact_match(self, total_sum: int) -> str:
        """
        Find exact match using binary search.
        Matches HLS implementation with similar binary search logic.
        
        Args:
            total_sum (int): Total prefix sum to match
            
        Returns:
            str: Matched character or '?' if not found
        """
        left = 0
        right = len(self.PREFIX_SUMS) - 1
        
        while left <= right:
            mid = (left + right) // 2
            
            if self.PREFIX_SUMS[mid] == total_sum:
                return self.CHARS[mid]
            elif self.PREFIX_SUMS[mid] < total_sum:
                left = mid + 1
            else:
                right = mid - 1
        
        return '?'

    def recognize(self, blobs: List[Dict]) -> str:
        """
        Recognize a character from a list of blobs by summing their prefix sums
        and mapping the result to a character using binary search in sorted mapping table.
        Matches HLS implementation by handling single blob case.
        
        Args:
            blobs (List[Dict]): List of detected blobs, each containing 'final_prefix_sum'
            
        Returns:
            str: Recognized character (A-Z, *) or '_' if no blobs detected, '?' if not found in mapping
        """
        # Special case: no blobs detected
        if not blobs:
            return '_'
            
        # Use regular Python int for sum
        total_sum = 0
        
        # Sum up all blob prefix sums
        for blob in blobs:
            total_sum += blob['final_prefix_sum']
        
        # Debug output if verbose
        if self.verbose:
            print(f"Total sum: {total_sum}")
        
        # Find exact match using binary search
        char = self._find_exact_match(total_sum)
        
        if self.verbose:
            if char == '?':
                print(f"No mapping found for prefix sum {total_sum}")
            else:
                print(f"Found character '{char}' for prefix sum {total_sum}")
        
        return char 