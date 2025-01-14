from typing import List


class Solution:
    def count_students(self, students: List[int], sandwiches: List[int]) -> int:
        for sandwich in sandwiches:
            if sandwich not in students:
                break
            else:
                students.remove(sandwich)
        return len(students)

