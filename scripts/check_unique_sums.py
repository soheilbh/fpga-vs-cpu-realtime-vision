import json
from collections import defaultdict

def check_unique_sums():
    # Load calibration data
    with open('output/calibration/calibration_data_with_noise.json', 'r') as f:
        letter_map = json.load(f)
    
    # Create a reverse mapping of prefix sums to letters
    sum_to_letters = defaultdict(list)
    for letter, prefix_sum in letter_map.items():
        sum_to_letters[prefix_sum].append(letter)
    
    # Find duplicates
    duplicates = {sum_val: letters for sum_val, letters in sum_to_letters.items() if len(letters) > 1}
    
    if duplicates:
        print("\nDuplicate prefix sums found:")
        for sum_val, letters in duplicates.items():
            print(f"  Sum {sum_val}: {', '.join(letters)}")
    else:
        print("\nAll prefix sums are unique!")
    
    # Print all prefix sums
    print("\nAll prefix sums:")
    for letter, prefix_sum in sorted(letter_map.items()):
        print(f"  {letter}: {prefix_sum}")

if __name__ == "__main__":
    check_unique_sums() 