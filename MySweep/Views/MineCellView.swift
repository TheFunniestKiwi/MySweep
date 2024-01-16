import SwiftUI

struct MineCellView: View {
    @ObservedObject var viewModel: MineSweeperGameViewModel
    var row: Int
    var column: Int
    @State var isLongPressed: Bool = false

    var body: some View {
        cellContent
        .buttonStyle(PlainButtonStyle())
        .frame(minWidth: 10, idealWidth: 15, maxWidth: 30, minHeight: 10, idealHeight: 15, maxHeight: 30, alignment: .center)
        .border(Color.gray, width: 1)
        .background(viewModel.grid[row][column].isRevealed ? Color.white : Color.gray)
        .scaleEffect(isLongPressed ? 1.5 : 1.0)
        .onTapGesture {
            viewModel.revealCell(at: row, column: column)
        }
        .onLongPressGesture(minimumDuration:0.8, pressing: { isPressing in
            withAnimation{
                isLongPressed = isPressing
            }
        }, perform: {viewModel.toggleFlag(at: row, column: column)})
    }

    @ViewBuilder
    private var cellContent: some View {
        if viewModel.grid[row][column].isRevealed {
            if viewModel.grid[row][column].isMine {
                Image(systemName: "star.fill")
                    .foregroundColor(.red)
            } else {
                Text(viewModel.grid[row][column].adjacentMines > 0 ? "\(viewModel.grid[row][column].adjacentMines)" : "")
                    .foregroundColor(colorForMinesCount(viewModel.grid[row][column].adjacentMines))
            }
        } else if viewModel.grid[row][column].isFlagged {
            Image(systemName: "flag.fill")
                .foregroundColor(.blue)
        } else {
            Text("")
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


