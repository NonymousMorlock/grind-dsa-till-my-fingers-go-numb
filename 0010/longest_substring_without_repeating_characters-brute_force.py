# https://leetcode.com/problems/longest-substring-without-repeating-characters/?source=submission-ac
# Brute Force -- Quadratic Time
class Solution:
    def length_of_longest_substring(self, s: str) -> int:
        max_count = 0
        if len(s) == 1: return 1
        for i in range(len(s)):
            visited = [s[i]]
            for char in s[i + 1:]:
                if char in visited:
                    break
                else:
                    visited.append(char)
            max_count = max(len(visited), max_count)

        return max_count
