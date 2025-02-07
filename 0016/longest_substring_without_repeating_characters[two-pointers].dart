// https://leetcode.com/problems/longest-substring-without-repeating-characters/description
import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    final dataSet = <String>{};
    var firstPointer = 0, secondPointer = 0;
    while (secondPointer < s.length) {
        while (dataSet.contains(s[secondPointer])) {
            dataSet.remove(s[firstPointer]);
            firstPointer++;
        }
        dataSet.add(s[secondPointer]);
        maxLength = max(maxLength, (secondPointer - firstPointer) + 1);
        secondPointer++;
    }
    return maxLength;
  }
}