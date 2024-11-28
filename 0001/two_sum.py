# https://leetcode.com/problems/two-sum/description/
from typing import List

from expect import expect


def two_sum_hash_map(nums: List[int], target: int) -> List[int]:
    state = {}

    for i in range(len(nums)):
        complement = target - nums[i]
        if complement in state:
            return [i, state[complement]]
        state[nums[i]] = i
    return []

def two_sum_two_pointer(nums: List[int], target: int) -> List[int]:
    # assume_sorted
    pointer1, pointer2 = 0, len(nums) - 1

    while pointer1 < pointer2:
        total = nums[pointer1] + nums[pointer2]

        if total == target:
            return [pointer1, pointer2]
        elif target < total:
            pointer2 -= 1
        else:
            pointer1 += 1

    return []

if __name__ == '__main__':
    nums = [2, 7, 11, 15]
    target = 9
    result = sorted(two_sum_hash_map(nums, target))
    expect(result, [0, 1])

    result = sorted(two_sum_two_pointer(nums, target))
    expect(result, [0, 1])

    nums = [3, 2, 4]
    target = 6

    result = sorted(two_sum_hash_map(nums, target))
    expect(result, [1, 2])

    nums = sorted(nums)
    result = sorted(two_sum_two_pointer(nums, target))
    expect(result, [0, 2])

    nums = [3, 3]
    target = 6

    result = sorted(two_sum_hash_map(nums, target))
    expect(result, [0, 1])

    result = sorted(two_sum_two_pointer(nums, target))
    expect(result, [0, 1])