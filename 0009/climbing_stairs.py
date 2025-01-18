class Solution:
    def climb_stairs(self, n: int) -> int:
        memo = {}
        def recursor(target: int, current_value: int = 0):
            if current_value == target: return 1
            elif current_value > target: return 0

            if current_value in memo:
                return memo[current_value]

            memo[current_value] = recursor(target, current_value + 1) + recursor(target, current_value + 2)

            return memo[current_value]

        return recursor(n)