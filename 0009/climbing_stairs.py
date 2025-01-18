class Solution:
    def climb_stairs(self, n: int) -> int:
        memo = {}
        def recursor(current_value: int):
            # since we are always going -2 at most, 2-2 will land us at 0, when we get to 1 we return 1 so the max depth
            # when it's a binary tree will be 2, otherwise we'll have to consider negatives
            if current_value < 2: return 1

            if current_value in memo:
                return memo[current_value]

            memo[current_value] = recursor(current_value - 1) + recursor(current_value - 2)

            return memo[current_value]

        return recursor(n)