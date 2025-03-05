// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
  int removeDuplicates(List<int> nums) {
    var pointer1 = 0;
    for (int i = 1; i < nums.length; i++) {
        int num = nums[i];
        if (num != nums[pointer1]) {
            nums[pointer1 + 1] = num;
            pointer1++;
        }
    }
    return pointer1 + 1;
  }
}
