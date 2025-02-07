// https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/
class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    for (final sandwich in sandwiches) {
        if (!students.contains(sandwich)) break;
        students.remove(sandwich);
    }

    return students.length;
  }
}