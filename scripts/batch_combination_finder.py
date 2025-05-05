import json
import random
from typing import List, Dict, Set
from pathlib import Path
import string
import argparse
import sys

# Global configuration
DEFAULT_COMBINATION_LENGTH = 1  # Default number of characters in each combination

class BatchCombinationFinder:
    """
    Generates combinations of letters that match target characters through their prefix sums.
    """
    
    def __init__(self, calibration_file: str, combination_length: int = DEFAULT_COMBINATION_LENGTH):
        """
        Initialize the finder with calibration data.
        
        Args:
            calibration_file (str): Path to calibration JSON file
            combination_length (int): Number of characters in each combination
        """
        self.letter_prefix_sums = self._load_calibration_data(calibration_file)
        self.letters = list(self.letter_prefix_sums.keys())
        self.used_prefix_sums: Set[int] = set()
        self.combination_length = combination_length
    
    def _load_calibration_data(self, calibration_file: str) -> Dict[str, int]:
        """
        Load letter prefix sums from calibration file.
        
        Args:
            calibration_file (str): Path to calibration JSON file
            
        Returns:
            Dict[str, int]: Mapping of letters to their prefix sums
        """
        with open(calibration_file, 'r') as f:
            return json.load(f)
    
    def _generate_combination(self, max_attempts: int = 1000) -> List[str]:
        """
        Generate a random combination of letters with a unique prefix sum.
        
        Args:
            max_attempts (int): Maximum number of attempts to find a unique combination
            
        Returns:
            List[str]: Random combination of letters with unique prefix sum
        """
        for _ in range(max_attempts):
            combination = random.choices(self.letters, k=self.combination_length)
            total_sum = self._calculate_total_sum(combination)
            
            if total_sum not in self.used_prefix_sums:
                self.used_prefix_sums.add(total_sum)
                return combination
        
        raise ValueError(f"Could not find a unique combination after {max_attempts} attempts")
    
    def _calculate_total_sum(self, combination: List[str]) -> int:
        """
        Calculate total prefix sum for a combination of letters.
        
        Args:
            combination (List[str]): List of letters
            
        Returns:
            int: Total prefix sum
        """
        return sum(self.letter_prefix_sums[letter] for letter in combination)
    
    def find_combination(self, target_char: str) -> Dict:
        """
        Generate a combination for a target character with unique prefix sum.
        If combination_length is 1, use the character's own prefix sum.
        
        Args:
            target_char (str): Target character to match
            
        Returns:
            Dict: Combination details
        """
        if self.combination_length == 1:
            # For single character, use its own prefix sum
            total_sum = self.letter_prefix_sums[target_char]
            combination = [target_char]
        else:
            # Generate random combination with unique prefix sum
            combination = self._generate_combination()
            total_sum = self._calculate_total_sum(combination)
        
        print(f"'{target_char}': {combination} (sum: {total_sum})")
        
        return {
            "combination": combination,
            "total_prefix_sum": total_sum
        }
    
    def find_combinations_for_targets(self, target_chars: List[str]) -> Dict[str, Dict]:
        """
        Find combinations for all target characters.
        
        Args:
            target_chars (List[str]): List of target characters
            
        Returns:
            Dict[str, Dict]: Mapping of target characters to their combinations
        """
        results = {}
        
        # First identify unique characters and their positions
        unique_chars = {}
        for i, char in enumerate(target_chars):
            if char not in unique_chars:
                unique_chars[char] = []
            unique_chars[char].append(i)
        
        print("\nGenerating combinations for unique characters:")
        # Generate combinations only for unique characters
        for char in unique_chars:
            results[char] = self.find_combination(char)
        
        return results
    
    def save_results(self, results: Dict[str, Dict], output_file: str) -> None:
        """
        Save results to JSON file.
        
        Args:
            results (Dict[str, Dict]): Results to save
            output_file (str): Path to output JSON file
        """
        with open(output_file, 'w') as f:
            json.dump(results, f, indent=2)

def main():
    """Main function to run the batch combination finder."""
    # Parse command line arguments
    parser = argparse.ArgumentParser(description='Generate letter combinations for target characters')
    parser.add_argument('--combination-length', type=int, default=DEFAULT_COMBINATION_LENGTH,
                      help=f'Number of characters in each combination (default: {DEFAULT_COMBINATION_LENGTH})')
    args = parser.parse_args()
    
    # Configuration
    calibration_file = Path("output/calibration/calibration_data_with_noise.json")
    # Generate combinations for all letters A-Z and asterisk
    target_chars = list(string.ascii_uppercase) + ['*']
    output_file = Path("output/combination_batch_plan.json")
    
    print(f"\nUsing combination length: {args.combination_length}")
    if args.combination_length == 1:
        print("Single character mode: Using actual prefix sums")
    
    # Initialize finder
    finder = BatchCombinationFinder(calibration_file, args.combination_length)
    
    # Find combinations
    results = finder.find_combinations_for_targets(target_chars)
    
    # Save results
    finder.save_results(results, output_file)
    print(f"\nResults saved to {output_file}")

if __name__ == "__main__":
    main() 