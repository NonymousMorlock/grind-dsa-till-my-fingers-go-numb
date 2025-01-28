import 'dart:collection';

class Solution {
  int countUnguarded(int m, int n, List<List<int>> guards, List<List<int>> walls) {
    // Directions for cardinal movement: [rowDelta, colDelta]
    final directions = [
      [0, 1],   // East
      [1, 0],   // South
      [0, -1],  // West
      [-1, 0]   // North
    ];
    
    // Initialize grid with default unguarded state (-1)
    List<List<int>> grid = List.generate(m, (_) => List.filled(n, -1));
    
    // Place guards (1) and walls (2) on the grid
    for (var guard in guards) {
      grid[guard[0]][guard[1]] = 1;
    }
    for (var wall in walls) {
      grid[wall[0]][wall[1]] = 2;
    }
    
    // Perform BFS for each guard to propagate guarded cells
    for (var guard in guards) {
      for (var direction in directions) {
        int rowIndex = guard[0];
        int columnIndex = guard[1];
        
        while (true) {
          rowIndex += direction[0];
          columnIndex += direction[1];
          
          // Stop if out of bounds or hits a wall/guard
          if (
            rowIndex < 0 || rowIndex >= m || 
            columnIndex < 0 || columnIndex >= n || 
            grid[rowIndex][columnIndex] > 0
            ) {
            break;
          }
          
          // Mark as guarded (0) if unoccupied
          if (grid[rowIndex][columnIndex] == -1) {
            grid[rowIndex][columnIndex] = 0;
          }
        }
      }
    }
    
    // Count unguarded cells (-1)
    int unguardedCount = 0;
    for (var row in grid) {
      for (var cell in row) {
        if (cell == -1) {
          unguardedCount++;
        }
      }
    }
    
    return unguardedCount;
  }
}