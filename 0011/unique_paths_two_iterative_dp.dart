class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    final numberOfRows = obstacleGrid.length;
    final numberOfColumns = obstacleGrid.first.length;

    final dp = List.generate(numberOfColumns, (_) => 0);

    dp.last = 1;

    for (int rowIndex = numberOfRows - 1; rowIndex >= 0; rowIndex--) {
      for (int columnIndex = numberOfColumns - 1; columnIndex >= 0; columnIndex--) {
        if (obstacleGrid[rowIndex][columnIndex] == 1) {
          dp[columnIndex] = 0;
        } else if (columnIndex + 1 < numberOfColumns) {
          dp[columnIndex] +=  dp[columnIndex + 1];
        }
      }
    }

    return dp.first;
  }
}
