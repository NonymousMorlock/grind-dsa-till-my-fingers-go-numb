// https://leetcode.com/problems/3sum/description/?envType=problem-list-v2&envId=sorting
class Solution {
  List<List<int>> threeSum(List<int> nums) {
    final result = <List<int>>[];
    final cache = {};
    nums.sort();

    for (int firstPointer = 0; firstPointer < nums.length; firstPointer++) {
        if (firstPointer > 0 && nums[firstPointer] == nums[firstPointer - 1]) continue;
        final target = -(nums[firstPointer]);

        var secondPointer = firstPointer + 1;
        var thirdPointer = nums.length - 1;

        while (secondPointer < thirdPointer) {
            final twoSum = nums[secondPointer] + nums[thirdPointer];

            if (twoSum < target) {
                secondPointer++;
            } else if (twoSum > target) {
                thirdPointer--;
            } else {
                final threeSum = [nums[firstPointer], nums[secondPointer], nums[thirdPointer]];
                if (!cache.containsKey(threeSum.join())) {
                    result.add(threeSum);
                    cache[threeSum.join()] = true;
                }
                secondPointer++;
            }
        }
    }

    return result;
  }
}
