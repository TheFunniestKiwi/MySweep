//
//  StartView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var  viewModel: MineSweeperGameViewModel
    var body: some View {
        VStack{
            Text("Welcome to MySweeper!")
                .fontDesign(.rounded)
                .font(.largeTitle)
                .padding()
            Text("Choose dificulty:")
                .font(.title)
           
            ChooseDifficultyView(viewModel: viewModel)
            }
        }
        
    }

#Preview {
    StartView(viewModel: MineSweeperGameViewModel())
}
