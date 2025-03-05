// https://leetcode.com/problems/concatenation-of-array/

class Solution {
  List<int> getConcatenation(List<int> nums) {
    final ans = <int>[];

    for (final number in nums) ans.add(number);
    for (final number in nums) ans.add(number);

    return ans;
  }
}
