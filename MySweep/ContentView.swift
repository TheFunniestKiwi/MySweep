//
//  ContentView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = MinesweeperGame()

    var body: some View {
        switch game.gameState{
        case .start:
            StartView(viewModel: game)
        case .gameplay:
            GameBoardView(viewModel: game)
        case .gameOver:
            GameOverView(viewModel: game)
        }

    }
}

#Preview {
    ContentView()
}
