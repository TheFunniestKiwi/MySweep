import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel: MineSweeperGameViewModel

    var body: some View {
        VStack{
            Text("MySweeper")
                .font(.largeTitle)
            HStack{
                VStack{
                    Text("Bombs")
                    Text("\(viewModel.flags)")
                }.padding()
                Spacer()
                VStack{
                    Text("Time")
                    Text(String(Int(viewModel.gameTime)))
                }.padding()
            }
            GeometryReader { geometry in
               let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: viewModel.size)

                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(0..<viewModel.size, id: \.self) { row in
                            ForEach(0..<viewModel.size, id: \.self) { column in
                                MineCellView(viewModel: viewModel, row: row, column: column)
                                    .scaledToFit()
                            }
                   }
               }
               
           }
            .padding()
            .onAppear {
               viewModel.startNewGame()
            }
        }
        

   }
}
