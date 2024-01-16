//
//  DifficultyButtonView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI


struct DifficultyButtonView : View {
    var action: () -> Void
    var difficulty: String = "Easy"
    var size: String = "10x10"
    var color: Color = .green
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:20)
                .foregroundStyle(color)
                .scaledToFit()
            VStack{
                Text(difficulty)
                    .font(.title)
                Text(size)
            }.foregroundStyle(Color.white)
                .background(Color.clear)
        }
        .onTapGesture {
            action()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .scaledToFit()
    }
}

#Preview {
    DifficultyButtonView(action: {})
}
