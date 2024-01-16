import SwiftUI

struct MainView: View {
    @StateObject var game = MineSweeperGameViewModel()

    var body: some View {
            switch game.gameState{
            case .start:
                StartView(viewModel: game)
            case .gameplay:
                GameBoardView(viewModel: game)
            case .gameOver:      
                GameOverView(viewModel: game)
            case .win:
                WinGameVIew(viewModel: game)
            }
    }
}

#Preview {
    MainView()
}
