import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel : MineSweeperGameViewModel
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
           ChooseDifficultyView(viewModel: viewModel)
            }
        }
}

#Preview {
    GameOverView(viewModel: MineSweeperGameViewModel())
}
