//
//  MySweepGame.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

class MinesweeperGame: ObservableObject {
    @Published var grid: [[MineCell]] = []
    @Published var gameState: GameState = .start
    var rows: Int = 10
    var columns: Int = 10
    var mines: Int = 10
    
    init(){
        gameState = .start
        startNewGame()
    }
    
   func changeDifficulty(dificulty: String){
       withAnimation{
           var size: Int
           switch dificulty {
           case "medium":
               size = 15
           case "hard":
               size = 20
           default:
               size = 10
           }
           let mineAmount: Int  = Int(Double(size * size) * 0.15)
           self.rows = size
           self.columns = size
           self.mines = mineAmount
          gameState = .gameplay
          startNewGame()
       }
        
    }
    
    
    func startNewGame() {
        // Create a grid with default cells
        grid = Array(repeating: Array(repeating: MineCell(), count: columns), count: rows)
        
        // Randomly place mines
        var placedMines = 0
        while placedMines < mines {
            let randomRow = Int.random(in: 0..<rows)
            let randomColumn = Int.random(in: 0..<columns)
            if !grid[randomRow][randomColumn].isMine {
                grid[randomRow][randomColumn].isMine = true
                placedMines += 1
            }
        }
        
        // Calculate adjacent mines for each cell
        for row in 0..<rows {
            for column in 0..<columns {
                grid[row][column].adjacentMines = countAdjacentMines(row: row, column: column)
            }
        }
    }
    
    func countAdjacentMines(row: Int, column: Int) -> Int {
        var count = 0
        for dx in -1...1 {
            for dy in -1...1 {
                if dx == 0 && dy == 0 { continue }
                let newRow = row + dx
                let newColumn = column + dy
                if (newRow >= 0 && newRow < rows && newColumn >= 0 && newColumn < columns) &&
                    grid[newRow][newColumn].isMine {
                    count += 1
                }
            }
        }
        return count
    }
    
    func revealCell(at row: Int, column: Int) {
        withAnimation{
            if grid[row][column].isRevealed || grid[row][column].isFlagged {
                return
            }
            
            grid[row][column].isRevealed = true
            print("Wejszle")
            // If the cell is a mine, game over logic could be triggered here
            if grid[row][column].isMine == true{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.gameState = .gameOver
                            }
            }
            // If the cell has no adjacent mines, reveal surrounding cells recursively
            if grid[row][column].adjacentMines == 0 {
                for dx in -1...1 {
                    for dy in -1...1 {
                        let newRow = row + dx
                        let newColumn = column + dy
                        if (newRow >= 0 && newRow < rows && newColumn >= 0 && newColumn < columns) &&
                            !grid[newRow][newColumn].isRevealed && !grid[newRow][newColumn].isMine {
                            revealCell(at: newRow, column: newColumn)
                        }
                    }
                }
            }
        }
    }
    func toggleFlag(at row: Int, column: Int) {
        withAnimation{
            if !grid[row][column].isRevealed {
                print("flagu")
                grid[row][column].isFlagged.toggle()
            }
        }
    }
}

enum GameState {
    case start
    case gameplay
    case gameOver
}
