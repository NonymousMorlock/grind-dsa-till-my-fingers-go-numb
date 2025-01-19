# https://leetcode.com/problems/longest-substring-without-repeating-characters/?source=submission-ac
# Two Pointer - O(n)
class Solution:
    def length_of_longest_substring(self, s: str) -> int:
        max_count = 0

        if len(s) == 1:
            return 1
        elif len(s) < 1:
            return max_count

        left_pointer = right_pointer = 0
        visited = set()

        while right_pointer < len(s):
            while s[right_pointer] in visited:
                visited.remove(s[left_pointer])
                left_pointer += 1

            visited.add(s[right_pointer])
            max_count = max(max_count, (right_pointer - left_pointer) + 1)
            right_pointer += 1

        return max_count
