// https://neetcode.io/problems/merge-k-sorted-linked-lists
List<int> mergeKLists(List<List<int>> lists) {
  while (lists.length > 1) {
    final mergedLists = <List<int>>[];
    for (int i = 0; i < lists.length; i += 2) {
      final firstList = lists[i];
      final secondList = i + 1 < lists.length ? lists[i + 1] : null;
      mergedLists.add(merge(firstList, secondList));
    }

    lists = mergedLists;
  }

  return lists.isEmpty ? [] : lists.first;
}

List<int> merge(List<int> firstList, [List<int>? secondList]) {
  final result = <int>[];
  while (firstList.isNotEmpty && secondList != null && secondList.isNotEmpty) {
    if (firstList.first < secondList.first) {
      result.add(firstList.first);
      firstList = firstList.sublist(1);
    } else {
      result.add(secondList.first);
      secondList = secondList.sublist(1);
    }
  }

  if (firstList.isNotEmpty) result.addAll(firstList);
  if (secondList != null && secondList.isNotEmpty) result.addAll(secondList);

  return result;
}