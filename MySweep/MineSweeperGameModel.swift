import Foundation

struct MineSweeperGameModel {
    var grid: [[MineCell]] = []
    var size : Int = 10
    var mines: Int = 10
    var flags: Int = 10
    
    init( size: Int) {
        self.size = size
        self.mines = Int(Double(size * size) * 0.15)
        startNewGame()
    }
    
    
    
    mutating func startNewGame() {
        grid = Array(repeating: Array(repeating: MineCell(), count: size), count: size)
        
        var placedMines = 0
        while placedMines < mines {
            let randomRow = Int.random(in: 0..<size)
            let randomColumn = Int.random(in: 0..<size)
            if !grid[randomRow][randomColumn].isMine {
                grid[randomRow][randomColumn].isMine = true
                placedMines += 1
            }
        }
        
        for row in 0..<size {
            for column in 0..<size {
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
                if (newRow >= 0 && newRow < size && newColumn >= 0 && newColumn < size) &&
                    grid[newRow][newColumn].isMine {
                    count += 1
                }
            }
        }
        return count
    }
    
    mutating func revealCell(at row: Int, column: Int) {
        if grid[row][column].isRevealed || grid[row][column].isFlagged {
            return
        }
        
        grid[row][column].isRevealed = true

        if grid[row][column].adjacentMines == 0 {
            for dx in -1...1 {
                for dy in -1...1 {
                    let newRow = row + dx
                    let newColumn = column + dy
                    if (newRow >= 0 && newRow < size && newColumn >= 0 && newColumn < size) &&
                        !grid[newRow][newColumn].isRevealed && !grid[newRow][newColumn].isMine {
                        revealCell(at: newRow, column: newColumn)
                    }
                }
            }
        }
    }
    
    
   mutating func revealMines() {
        for row in 0..<size {
            for column in 0..<size {
                if grid[row][column].isMine {
                    grid[row][column].isRevealed = true
                }
            }
        }

    }
    

    mutating func checkWinState() -> Bool {
        var win : Bool = true
            for row in 0..<size {
                    for column in 0..<size {
                        if !grid[row][column].isMine && !grid[row][column].isRevealed{
                            win = false
                        }
                    }
                }
        return win
    }
    
    
    func checkMine(row: Int, column: Int) -> Bool {
        return grid[row][column].isMine
        
    }
    
    mutating func toggleFlag(at row: Int, column: Int) {
         if !grid[row][column].isRevealed {
             if grid[row][column].isFlagged{
                 self.flags += 1
             }else{
                 self.flags -= 1
             }
             
            grid[row][column].isFlagged.toggle()
        }
    }
    
}

