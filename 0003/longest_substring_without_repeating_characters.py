# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

#  O(n²)
def length_of_longest_substring(original_string: str) -> int:
    length = 0
    # Edge-cases: Empty string - Taken care of by the loop since the loop won't run at all if the string is empty

    visited = None

    for firstPointer in range(len(original_string)):
        visited = set()
        for secondPointer in range(firstPointer, len(original_string)):
            if original_string[secondPointer] in visited:
                if len(visited) > length:
                    length = len(visited)
                break
            visited.add(original_string[secondPointer])
        if len(visited) > length:
            length = len(visited)

    return length
