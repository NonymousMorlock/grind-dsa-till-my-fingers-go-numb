# https://leetcode.com/problems/add-two-numbers/description/
from typing import Optional, List


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def add_two_numbers(l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:

    reversed_first_list = reverse_linked_list(l1)
    reversed_second_list = reverse_linked_list(l2)

    num1 = 0
    num2 = 0

    # First Pass - Extract first number
    current = reversed_first_list

    while current:
        num1 = (num1 * 10) + int(current.val)
        current = current.next

    # Second Pass - Extract second number
    current = reversed_second_list

    while current:
        num2 = (num2 * 10) + int(current.val)
        current = current.next

    total = num1 + num2

    result = ListNode()
    tail = result

    for char in str(total):
        tail.next = ListNode(int(char))
        tail = tail.next

    return reverse_linked_list(result.next)





def reverse_linked_list(linked_list: Optional[ListNode]) -> Optional[ListNode]:
    if not linked_list:
        return

    prev = None
    current = linked_list

    while current:
        temp = current.next
        current.next = prev
        prev = current
        current = temp
    return prev

