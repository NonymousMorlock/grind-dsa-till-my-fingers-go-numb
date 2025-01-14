# https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/
from typing import List


class Solution:
    def count_students(self, students: List[int], sandwiches: List[int]) -> int:
        for sandwich in sandwiches:
            if sandwich not in students:
                break
            else:
                students.remove(sandwich)
        return len(students)

# I initially thought to loop through students and dequeue - enqueue when they don't like it then dequeue the student
# and pop the sandwich when they like it, but the problem actually involves the edge-case where there might be an
# unbalanced sandwich:student ration, so with that approach I would've hit an infinite loop when I got to a sandwich
# that none of the remaining students wanted to eat.

# Then it hit me, I could just loop through the sandwiches and remove "any" student that likes the sandwich from the
# students list, because the order of the students actually doesn't matter, I mean if we followed the order and
# dequeue - enqueue'd the students, we would still loop back to one of the students who likes it anyways, so why not
# just check if such a student exists and remove him without having to go through the loop. ANYONE LIKE CIRCLES? If
# we get a yes, we pull that person from the queue, we're bloody tyrants hehe... this way when we get to a sandwich and
# ask but no one likes it, then we know we're done, since the question doesn't let us throw the sandwich away and
# carry on, so we break and return the length of the remaining students.
