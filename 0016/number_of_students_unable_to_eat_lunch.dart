// https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/
class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    while (sandwiches.isNotEmpty && students.isNotEmpty) {
        if (!students.contains(sandwiches.first)) break;
        final student = students.first;
        students.remove(student);
        if (student == sandwiches.first) {
            sandwiches.remove(sandwiches.first);
        } else {
            students.add(student);
        }
    }

    return students.length;
  }
}