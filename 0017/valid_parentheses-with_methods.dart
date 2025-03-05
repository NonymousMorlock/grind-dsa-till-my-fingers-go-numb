// https://leetcode.com/problems/valid-parentheses/

class Solution {
  bool isValid(String s) {
    const brackets = {'}': '{', ']': '[', ')': '('};

    if (brackets.containsKey(s[0]) || brackets.containsValue(s[s.length - 1])) return false;

    final stack = [];

    for (var i = 0; i < s.length; i++) {
      final char = s[i];
      if (brackets.containsValue(char)) {
        stack.add(char);
      } else if (stack.isEmpty || stack.removeLast() != brackets[char]) {
        return false;
      }
    }

    return stack.isEmpty;
  }
}