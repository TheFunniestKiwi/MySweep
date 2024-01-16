//
//  MineSweeperGameViewModel.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 16/01/2024.
//

import SwiftUI


class MineSweeperGameViewModel: ObservableObject {
    @Published private var model = MineSweeperGameViewModel.createGame(difficulty: MineSweeperGameViewModel.difficulty)
    public static var difficulty: String = "easy"
    @Published var gameState: GameState = .start
    @Published var gameTime = 0
    var timer: Timer?

    var grid: [[MineCell]] {
        model.grid
    }

    
    var size: Int {
        model.size  
    }
    
    var mines: Int {
        model.mines
    }
    
    var flags: Int {
        model.flags
    }
    
    func startTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            [weak self] _ in
            DispatchQueue.main.async{
                self?.gameTime += 1
            }
        }
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func startNewGame() {
        gameTime = 0
        startTimer()
        model.startNewGame()
     
    }
    
    static func createGame(difficulty: String) -> MineSweeperGameModel {
        var size: Int
        switch difficulty {
        case "medium":
            size = 15
        case "hard":
            size = 20
        default:
            size = 10
        }
        return MineSweeperGameModel(size: size)
    }
    
    func revealCell(at row: Int, column: Int) {
        withAnimation(.easeIn(duration: 0.5)){
            if model.checkMine(row: row, column: column){
                stopTimer()
                model.revealMines()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation(.spring(duration: 3)){
                        self.gameState = .gameOver

                    }
                }
            }else{
                model.revealCell(at: row, column: column)
                if model.checkWinState(){
                    stopTimer()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        withAnimation(.spring(duration: 4)){
                            self.gameState = .win
                        }
                    }
                }
            }
        }
    }
    
    func toggleFlag(at row: Int, column: Int) {
        withAnimation{
            model.toggleFlag(at: row, column: column)
        }
    }
    
    func changeDifficulty(to difficulty: String){
        MineSweeperGameViewModel.difficulty = difficulty
        gameState = .gameplay
        model = MineSweeperGameViewModel.createGame(difficulty: difficulty)
    }
    
}
