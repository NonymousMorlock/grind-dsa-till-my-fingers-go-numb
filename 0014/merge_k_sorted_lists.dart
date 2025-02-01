void main() {
  final lists = [
    ListNode.fromArray([1, 2, 4]),
    ListNode.fromArray([1, 3, 5]),
    ListNode.fromArray([3, 6]),
  ];

  final result = mergeKLists(lists);
  print(result?.toList());
}

class ListNode<T> {
  ListNode({required this.val, this.next});

  final T val;
  ListNode<T>? next;

  factory ListNode.fromArray(List<T> array) {
    if (array.isEmpty) throw Exception('Array cannot be empty');
    final head = ListNode(val: array.first);
    ListNode<T>? tail = head;

    for (int i = 1; i < array.length; i++) {
      tail?.next = ListNode(val: array[i]);
      tail = tail?.next;
    }
    return head;
  }

  List<T> toList() {
    final result = [val];

    var curr = next;
    while (curr != null) {
      result.add(curr.val);
      curr = curr.next;
    }
    return result;
  }

  @override
  String toString() => toList().toString();
}

ListNode<int>? mergeKLists(List<ListNode<int>>? nodes) {
  if (nodes == null || nodes.isEmpty) return null;

  while (nodes!.length > 1) {
    final mergedLists = <ListNode<int>>[];

    for (int i = 0; i < nodes.length; i += 2) {
      final firstNode = nodes[i];
      final secondNode = i + 1 < nodes.length ? nodes[i + 1] : null;

      mergedLists.add(mergeLists(firstNode, secondNode));
    }

    nodes = mergedLists;
  }

  return nodes.first;
}

ListNode<int> mergeLists(ListNode<int>? firstNode, ListNode<int>? secondNode) {
  final dummy = ListNode(val: 0);
  ListNode<int>? tail = dummy;

  while (firstNode != null && secondNode != null) {
    if (firstNode.val < secondNode.val) {
      tail!.next = firstNode;
      firstNode = firstNode.next;
    } else {
      tail!.next = secondNode;
      secondNode = secondNode.next;
    }
    tail = tail.next;
  }

  if (firstNode != null) tail!.next = firstNode;
  if (secondNode != null) tail!.next = secondNode;

  return dummy.next!;
}
