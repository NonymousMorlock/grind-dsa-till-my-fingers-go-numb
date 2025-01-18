class Solution:
    def climb_stairs(self, n: int) -> int:
        left_pointer = right_pointer = 1

        for _ in range(n - 1):
            cache = left_pointer
            left_pointer = left_pointer + right_pointer
            right_pointer = cache

        return left_pointer
