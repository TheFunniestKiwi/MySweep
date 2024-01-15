//
//  StartView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var  viewModel: MinesweeperGame
    var body: some View {
        VStack{
            Text("Welcome to MySweeper!")
                .fontDesign(.rounded)
                .font(.largeTitle)
                .padding()
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
    StartView(viewModel: MinesweeperGame())
}
