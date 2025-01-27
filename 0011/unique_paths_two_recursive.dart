class Solution {
  final memo = {};
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    return recursor(grid: obstacleGrid);
  }

  int recursor({required List<List<int>> grid, int currentRow = 0, int currentColumn = 0}) {
    if (currentRow >= grid.length || currentColumn >= grid.first.length || grid[currentRow][currentColumn] == 1) {
        return 0;
    } else if (currentRow == grid.length - 1 && currentColumn == grid.first.length - 1) {
        return 1;
    } else {
        final cellKey = '${currentRow}, ${currentColumn}';
        if (memo.containsKey(cellKey)) return memo[cellKey];
        memo[cellKey] = recursor(grid: grid, currentRow: currentRow + 1, currentColumn: currentColumn) +
        recursor(grid: grid, currentRow: currentRow, currentColumn: currentColumn + 1);

        return memo[cellKey];
    }
  }
}
