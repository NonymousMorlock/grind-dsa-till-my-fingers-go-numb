class MyStack:

    def __init__(self):
        self.__container = []

    def push(self, x: int) -> None:
        self.__container.append(x)

    def pop(self) -> int:
        return self.__container.pop()

    def top(self) -> int:
        return self.__container[-1]

    def empty(self) -> bool:
        return len(self.__container) < 1

# Your MyStack object will be instantiated and called as such:
# obj = MyStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()