import json
from pathlib import Path

def load_combination_plan():
    with open('../output/combination_batch_plan.json', 'r') as f:
        return json.load(f)

def generate_tables(plan):
    # Create a list of tuples (char, total_prefix_sum)
    char_sums = []
    for char, data in plan.items():
        char_sums.append((char, data['total_prefix_sum']))
    
    # Sort by total_prefix_sum
    char_sums.sort(key=lambda x: x[1])
    
    # Generate the arrays with comments
    prefix_sums_lines = []
    for char, sum_val in char_sums:
        prefix_sums_lines.append(f"    {sum_val},   // {char}")
    
    # Format as C++ arrays with comments
    prefix_sums_str = '\n'.join(prefix_sums_lines)
    
    # Generate character array in groups of 10
    chars = [f"'{char}'" for char, _ in char_sums]
    chars_groups = [chars[i:i + 10] for i in range(0, len(chars), 10)]
    chars_str = ',\n    '.join([', '.join(group) for group in chars_groups])
    
    return prefix_sums_str, chars_str

def update_recognizer_files(prefix_sums_str, chars_str):
    # Update recognizer.hpp
    recognizer_path = '../src/fpga_sw/recognizer.hpp'
    with open(recognizer_path, 'r') as f:
        content = f.read()
    
    # Replace the arrays
    content = content.replace(
        'const uint16_t char_prefix_sums[27] = {\n    80,   // I\n    125,  // J\n    127,  // L\n    144,  // T\n    155,  // *\n    156,  // Y\n    158,  // F\n    159,  // V\n    171,  // C\n    186,  // U\n    187,  // K\n    188,  // S\n    190,  // A\n    194,  // P\n    196,  // Z\n    198,  // X\n    199,  // H\n    205,  // E\n    211,  // O\n    213,  // D\n    218,  // G\n    237,  // R\n    239,  // N\n    241,  // Q\n    274,  // B\n    281,  // W\n    289   // M\n};',
        f'const uint16_t char_prefix_sums[27] = {{\n{prefix_sums_str}\n}};'
    )
    content = content.replace(
        'const char prefix_sum_to_char[27] = {\n    \'I\', \'J\', \'L\', \'T\', \'*\', \'Y\', \'F\', \'V\', \'C\', \'U\',\n    \'K\', \'S\', \'A\', \'P\', \'Z\', \'X\', \'H\', \'E\', \'O\', \'D\',\n    \'G\', \'R\', \'N\', \'Q\', \'B\', \'W\', \'M\'\n};',
        f'const char prefix_sum_to_char[27] = {{\n    {chars_str}\n}};'
    )
    
    with open(recognizer_path, 'w') as f:
        f.write(content)
    
    # Update hls_recognizer.hpp
    hls_recognizer_path = '../hls_syn/src/hls_recognizer.hpp'
    with open(hls_recognizer_path, 'r') as f:
        content = f.read()
    
    # Replace the arrays
    content = content.replace(
        'const int char_prefix_sums[27] = {\n    80,   // I\n    125,  // J\n    127,  // L\n    144,  // T\n    155,  // *\n    156,  // Y\n    158,  // F\n    159,  // V\n    171,  // C\n    186,  // U\n    187,  // K\n    188,  // S\n    190,  // A\n    194,  // P\n    196,  // Z\n    198,  // X\n    199,  // H\n    205,  // E\n    211,  // O\n    213,  // D\n    218,  // G\n    237,  // R\n    239,  // N\n    241,  // Q\n    274,  // B\n    281,  // W\n    289   // M\n};',
        f'const int char_prefix_sums[27] = {{\n{prefix_sums_str}\n}};'
    )
    content = content.replace(
        'const char prefix_sum_to_char[27] = {\n    \'I\', \'J\', \'L\', \'T\', \'*\', \'Y\', \'F\', \'V\', \'C\', \'U\',\n    \'K\', \'S\', \'A\', \'P\', \'Z\', \'X\', \'H\', \'E\', \'O\', \'D\',\n    \'G\', \'R\', \'N\', \'Q\', \'B\', \'W\', \'M\'\n};',
        f'const char prefix_sum_to_char[27] = {{\n    {chars_str}\n}};'
    )
    
    with open(hls_recognizer_path, 'w') as f:
        f.write(content)

def main():
    plan = load_combination_plan()
    prefix_sums_str, chars_str = generate_tables(plan)
    update_recognizer_files(prefix_sums_str, chars_str)
    print("Successfully updated recognizer tables in both files!")

if __name__ == '__main__':
    main() 