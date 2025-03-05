// https://leetcode.com/problems/remove-element/

class Solution {
  int removeElement(List<int> nums, int val) {
    var leftPointer = 0;
    for (int rightPointer = 0; rightPointer < nums.length; rightPointer++) {
        if (nums[rightPointer] != val) {
            nums[leftPointer] = nums[rightPointer];
            leftPointer++;
        }
    }
    return leftPointer;
  }
}
