// https://leetcode.com/problems/valid-parentheses/

class Solution {
  bool isValid(String s) {
    const brackets = {'}': '{', ']': '[', ')': '('};

    if (brackets[s[0]] != null || brackets[s[s.length - 1]] == null) return false;

    final stack = [];

    for (var i = 0; i < s.length; i++) {
      final char = s[i];
      if (brackets[char] == null) {
        stack.add(char);
      } else if (stack.isEmpty || stack.removeLast() != brackets[char]) {
        return false;
      }
    }

    return stack.isEmpty;
  }
}