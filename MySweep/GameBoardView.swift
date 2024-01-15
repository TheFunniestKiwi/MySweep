//
//  GameBoardView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel: MinesweeperGame

    var body: some View {
        VStack {
            ForEach(0..<viewModel.rows, id: \.self) { row in
                HStack {
                    ForEach(0..<viewModel.columns, id: \.self) { column in
                        MineCellView(viewModel: viewModel, row: row, column: column)
                    }
                }
            }
        }
        .padding() // Add padding around the game board for better appearance
        .onAppear {
            viewModel.startNewGame()
        }
    }
}
