# Definition for singly-linked list.
from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def reverse_list(self, head: Optional[ListNode]) -> Optional[ListNode]:
        return recursor(head, None)


def recursor(curr: Optional[ListNode], prev: Optional[ListNode] = None):
    if not curr: return prev

    cache = curr.next
    curr.next = prev

    return recursor(cache, curr)