// https://leetcode.com/problems/concatenation-of-array/

class Solution {
  List<int> getConcatenation(List<int> nums) {
    final n = nums.length;

    for (var i = 0; i < n; i++) nums.add(nums[i]);

    return nums;
  }
}