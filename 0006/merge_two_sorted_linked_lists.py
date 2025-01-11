class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
from typing import Optional


class Solution:
    def merge_two_lists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        if not list1:
            return list2
        elif not list2:
            return list1

        first_pointer, second_pointer = list1, list2

        merged_list = ListNode()
        tail = merged_list

        while first_pointer or second_pointer:
            if not first_pointer:
                tail.next = ListNode(second_pointer.val)
                second_pointer = second_pointer.next
                tail = tail.next
                continue
            elif not second_pointer:
                tail.next = ListNode(first_pointer.val)
                first_pointer = first_pointer.next
                tail = tail.next
                continue

            if first_pointer.val <= second_pointer.val:
                tail.next = ListNode(first_pointer.val)
                first_pointer = first_pointer.next
            else:
                tail.next = ListNode(second_pointer.val)
                second_pointer = second_pointer.next

            tail = tail.next

        return merged_list.next
