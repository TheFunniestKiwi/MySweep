//
//  WinGameVIew.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 15/01/2024.
//

import SwiftUI

struct WinGameVIew: View {
    @ObservedObject var viewModel : MineSweeperGameViewModel
    var body: some View {
        VStack{
            GIFView(url: "https://media1.tenor.com/m/nE7CE32ElmMAAAAC/leonardo-di-caprio-cheers.gif")
            Text("Congratulations!!")
                .fontDesign(.rounded)
                .font(.largeTitle)
                .padding()
            Text("Your time: \(viewModel.gameTime)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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
    WinGameVIew(viewModel: MineSweeperGameViewModel())
}
