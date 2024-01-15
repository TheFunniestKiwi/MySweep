//
//  MineCellView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

struct MineCellView: View {
    @ObservedObject var viewModel: MinesweeperGame
    var row: Int
    var column: Int
    @State var isLongPressed: Bool = false

    var body: some View {
        cellContent
        .buttonStyle(PlainButtonStyle()) // To remove default button styling
        .frame(width: 30, height: 30, alignment: .center) // Set the size of the cell
        .border(Color.gray, width: 1) // Border to distinguish cells
        .background(viewModel.grid[row][column].isRevealed ? Color.white : Color.gray) // Background color
        .scaleEffect(isLongPressed ? 1.5 : 1.0)
        .onTapGesture {
            viewModel.revealCell(at: row, column: column)
        }
        .onLongPressGesture(minimumDuration:0.8, pressing: { isPressing in
            isLongPressed = isPressing
            
            
        }, perform: {viewModel.toggleFlag(at: row, column: column)})
    }

    @ViewBuilder
    private var cellContent: some View {
        if viewModel.grid[row][column].isRevealed {
            if viewModel.grid[row][column].isMine {
                Image(systemName: "star.fill") // Replace with your mine image or emoji
                    .foregroundColor(.red)
            } else {
                Text(viewModel.grid[row][column].adjacentMines > 0 ? "\(viewModel.grid[row][column].adjacentMines)" : "")
                    .foregroundColor(colorForMinesCount(viewModel.grid[row][column].adjacentMines))
            }
        } else if viewModel.grid[row][column].isFlagged {
            Image(systemName: "flag.fill") // Replace with your flag image or emoji
                .foregroundColor(.blue)
        } else {
            Text("") // Empty string for unrevealed and unflagged cells
        }
    }

    private func colorForMinesCount(_ count: Int) -> Color {
        switch count {
        case 1: return .blue
        case 2: return .green
        case 3: return .orange
        case 4...: return .red
        default: return .black
        }
    }
}


