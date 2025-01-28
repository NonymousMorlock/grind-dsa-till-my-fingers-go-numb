// https://leetcode.com/problems/count-unguarded-cells-in-the-grid/description/
class Solution {
  int countUnguarded(int m, int n, List<List<int>> guards, List<List<int>> walls) {
    final grid = List<List<int>>.generate(m, (i) => List<int>.generate(n, (j) => 0));



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
      // scan north
      for (int i = guard.first - 1; i >= 0; i--) {
        if (grid[i][guard.last] == 2) break;

        if (grid[i][guard.last] == -1) continue;
        grid[i][guard.last] = -1;
      }

      // scan south
      for (int i = guard.first + 1; i < m; i ++) {
        if (grid[i][guard.last] == 2) break;

        if (grid[i][guard.last] == -1) continue;

        grid[i][guard.last] = -1;
      }

      // scan east
      for (int i = guard.last + 1; i < n; i++) {
        if (grid[guard.first][i] == 2) break;

        if (grid[guard.first][i] == -1) continue;
        grid[guard.first][i] = -1;
      }

      // scan west
      for (int i = guard.last - 1; i >= 0; i --) {
        if (grid[guard.first][i] == 2) break;

        if (grid[guard.first][i] == -1) continue;
        grid[guard.first][i] = -1;
      }
    }
    return grid.fold<int>(0, (previousValue, row) {
      return previousValue + row.fold<int>(0, (previousValue, value) {
        return previousValue + switch(value) {0 => 1, _ => 0};
      });
    });
  }
}