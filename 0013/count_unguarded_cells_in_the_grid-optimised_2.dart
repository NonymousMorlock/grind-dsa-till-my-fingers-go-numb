class Solution {
  int countUnguarded(int m, int n, List<List<int>> guards, List<List<int>> walls) {
    final grid = List<List<int>>.generate(m, (i) => List<int>.generate(n, (j) => 0));

    final directions = [
        [1, 0],
        [-1, 0],
        [0, -1],
        [0, 1]
    ];


    // -1 -> guarded
    // 0 -> empty && unguarded
    // 1 -> guard
    // 2 -> wall
    for (final guard in guards) {
      grid[guard.first][guard.last] = 1;
    }

    for (final wall in walls) {
      grid[wall.first][wall.last] = 2;
    }

    for (final guard in guards) {
     for (final direction in directions) {
        var rowIndex = guard.first;
        var columnIndex = guard.last;
        while (true) {
            rowIndex += direction.first;
            columnIndex += direction.last;

            if (rowIndex < 0 || rowIndex >= m || columnIndex < 0 || columnIndex >= n || grid[rowIndex][columnIndex] > 0) {
                break;
            }

            grid[rowIndex][columnIndex] = -1;
        }
     }
    }
    return grid.fold<int>(0, (previousValue, row) {
      return previousValue + row.fold<int>(0, (previousValue, value) {
        return previousValue + switch(value) {0 => 1, _ => 0};
      });
    });
  }
}