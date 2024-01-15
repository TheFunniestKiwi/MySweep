//
//  GameOverView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel : MinesweeperGame
    var body: some View {
        VStack{
            GIFView()
            Text("Better luck next time!")
                .fontDesign(.rounded)
                .font(.largeTitle)
                .padding()
            Text("Give it another spin?")
                .font(.title) 
            Text("Choose dificulty:")
                .font(.title)
            HStack{
                DifficultyButtonView(action: {viewModel.changeDifficulty(dificulty: "easy")})
                DifficultyButtonView(action: {viewModel.changeDifficulty(dificulty: "medium")}, difficulty: "Medium", size: "15x15", color: .orange)
                DifficultyButtonView(action: {viewModel.changeDifficulty(dificulty: "hard")}, difficulty: "Hard", size: "20x20", color: .red)
               
                }.padding()
            }
        }
}

#Preview {
    GameOverView(viewModel: MinesweeperGame())
}
