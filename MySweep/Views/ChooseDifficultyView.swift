//
//  ChooseDifficultyView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 16/01/2024.
//

import SwiftUI

struct ChooseDifficultyView: View {
    @ObservedObject var viewModel: MineSweeperGameViewModel
    var body: some View {
        HStack{
            DifficultyButtonView(action: {viewModel.changeDifficulty(to: "easy")})
            DifficultyButtonView(action: {viewModel.changeDifficulty(to: "medium")},
                                 difficulty: "Medium", size: "15x15", color: .orange)
            DifficultyButtonView(action: {viewModel.changeDifficulty(to:"hard")},
                                 difficulty: "Hard", size: "20x20", color: .red)
           
            }.padding()
    }
}

#Preview {
    ChooseDifficultyView(viewModel: MineSweeperGameViewModel())
}
