# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

# https://www.youtube.com/watch?v=n4zCTMh03_M&ab_channel=CodingNinja
# O(n) - Sliding window and hash set
def length_of_longest_substring(original_string: str) -> int:
    left_pointer = max_length = 0

    character_set = set()

    for right_pointer in range(len(original_string)):
        while original_string[right_pointer] in character_set:
            character_set.remove(original_string[left_pointer])

        character_set.add(original_string[right_pointer])
        max_length = max(max_length, right_pointer - left_pointer + 1)

    return max_length