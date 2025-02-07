// https://leetcode.com/problems/longest-palindromic-substring/description/

class Solution {
  String longestPalindrome(String s) {
    int resultStart = 0, resultEnd = 0;

    void checkPalindrome({
      required int leftPointer,
      required int rightPointer,
    }) {
      while (leftPointer >= 0 &&
          rightPointer < s.length &&
          s[leftPointer] == s[rightPointer]) {
        if ((rightPointer - leftPointer + 1) > (resultEnd - resultStart + 1)) {
          resultStart = leftPointer;
          resultEnd = rightPointer;
        }
        leftPointer--;
        rightPointer++;
      }
    }

    for (int i = 0; i < s.length; i++) {
      // odd check
      checkPalindrome(leftPointer: i, rightPointer: i);

      // even check
      checkPalindrome(leftPointer: i, rightPointer: i + 1);
    }

    return s.substring(resultStart, resultEnd + 1);
  }
}
