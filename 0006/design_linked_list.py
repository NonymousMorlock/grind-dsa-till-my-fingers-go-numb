class MyLinkedList:

    def __init__(self):
        self.head: Node | None = None
        self.tail: Node | None = None
        self.__length = 0

    def get(self, index: int) -> int:
        if index > self.__length - 1 or index < 0: return -1
        if index == 0 and self.head:
            return self.head.val
        elif (index == 0 and not self.head) or (index == self.__length - 1):
            return self.tail.val

        current_node = self.head

        for i in range(index):
            current_node = current_node.next

        return current_node.val

    def add_at_head(self, val: int) -> None:
        node = Node(val)
        if not self.head:
            self.head = node
        else:
            self.head.prev = node
            node.next = self.head

            self.head = node
            if self.__length == 1:
                self.tail = self.head.next

        self.__length += 1

        print('addAtHead complete...')
        print(f'Length: {self.__length}')
        self.print()

    def add_at_tail(self, val: int) -> None:
        node = Node(val)
        if not self.tail:
            self.tail = node
            if self.head:
                self.head.next = self.tail
                self.tail.prev = self.head
        else:
            node.prev = self.tail
            self.tail.next = node
            self.tail = node

        self.__length += 1

        print('addAtTail complete...')
        print(f'Length: {self.__length}')
        self.print()

    def add_at_index(self, index: int, val: int) -> None:
        if index > self.__length or index < 0:
            return
        elif index == self.__length:
            self.add_at_tail(val)
        elif index == 0:
            self.add_at_head(val)
        else:
            node = Node(val)
            current_node = self.head
            for i in range(index):
                current_node = current_node.next

            cached_prev = current_node.prev
            current_node.prev = node
            cached_prev.next = node
            node.prev = cached_prev
            node.next = current_node

            self.__length += 1

        print('addAtIndex complete...')
        print(f'Length: {self.__length}')
        self.print()

    def delete_at_index(self, index: int) -> None:
        if index > self.__length or index < 0:
            return
        elif index == self.__length - 1:
            self.tail = self.tail.prev
            self.tail.next = None
        elif index == 0:
            self.head = self.head.next
            self.head.prev = None
        else:
            current_node = self.head
            for i in range(index):
                current_node = current_node.next

            current_node.prev.next = current_node.next
            current_node.next.prev = current_node.prev
        self.__length -= 1

        print('deleteAtIndex complete...')
        print(f'Length: {self.__length}')
        self.print()

    def print(self) -> None:
        curr = self.head
        while curr:
            print(curr.val, end='->' if curr.next else '\n')
            curr = curr.next


class Node:
    def __init__(self, val):
        self.val: int = val
        self.next = None
        self.prev = None

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList()
# param_1 = obj.get(index)
# obj.addAtHead(val)
# obj.addAtTail(val)
# obj.addAtIndex(index,val)
# obj.deleteAtIndex(index)