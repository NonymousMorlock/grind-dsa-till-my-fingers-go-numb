# https://neetcode.io/problems/merge-k-sorted-linked-lists

from typing import List, Optional


# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def merge_k_lists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        if not lists or len(lists) < 1: return None

        while len(lists) > 1:
            merged_lists = []

            for i in range(0, len(lists), 2):
                first_list = lists[i]
                second_list = lists[i + 1] if i + 1 < len(lists) else None

                merged_lists.append(self.merge_lists(first_list, second_list))

            lists = merged_lists

        return merged_lists[0]

    def merge_lists(self, first_list, second_list):

        result = ListNode()
        tail = result

        while first_list and second_list:
            if first_list.val < second_list.val:
                tail.next = first_list
                first_list = first_list.next
            else:
                tail.next = second_list
                second_list = second_list.next

            tail = tail.next

        if first_list: tail.next = first_list
        if second_list: tail.next = second_list

        return result.next

