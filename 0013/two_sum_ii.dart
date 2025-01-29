// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/

class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    var firstPointer = 0;
    var secondPointer = numbers.length - 1;

    while (firstPointer < secondPointer) {
        final twoSum = numbers[firstPointer] + numbers[secondPointer];

        if (twoSum < target) {
            firstPointer++;
        } else if (twoSum > target) {
            secondPointer--;
        } else {
            return [firstPointer + 1, secondPointer + 1];
        }
    }

    return [];
  }
}
