// https://leetcode.com/problems/longest-substring-without-repeating-characters/description
import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    final dataSet = <String>{};
    for (final charCode in s.runes) {
        final char = String.fromCharCode(charCode);
        while (dataSet.contains(char) && dataSet.isNotEmpty) {
            dataSet.remove(dataSet.first);
        }
        dataSet.add(char);
        maxLength = max(maxLength, dataSet.length);
    }
    return maxLength;
  }
}