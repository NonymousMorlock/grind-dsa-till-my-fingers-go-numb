class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    if (obstacleGrid[0][0] == 1 || obstacleGrid[obstacleGrid.length - 1][obstacleGrid.first.length - 1] == 1) return 0;
    List<List<int>> dp = obstacleGrid.map((_) => obstacleGrid.first.map((_) => 0).toList()).toList();
    dp[0][0] = 1;

    for (int i = 1; i < dp.first.length; i++) {
        dp[0][i] = switch(obstacleGrid[0][i]) {
            1 => 0,
            _ => dp[0][i-1],
        };
    }

    for (int i = 1; i < dp.length; i++) {
        dp[i][0] = switch(obstacleGrid[i][0]) {
            1 => 0,
            _ => dp[i-1][0],
        };
    }

    for (int i = 1; i < obstacleGrid.length; i++) {
        for (int j = 1; j < obstacleGrid.first.length; j++) {
            dp[i][j] = switch(obstacleGrid[i][j]) {
                1 => 0,
                _ => dp[i][j - 1] + dp[i - 1][j],
            };
        }
    }

    return dp[dp.length - 1][dp.first.length - 1];
  }
}
