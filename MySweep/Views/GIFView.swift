//
//  GIFView.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct GIFView: View {
    var url: String = "https://media1.tenor.com/m/oncTrVdxTDYAAAAC/nuke.gif"
    var body: some View {
        AnimatedImage(url: URL(string: url))
            .resizable()
            .scaledToFit()
            .padding()
    }
}
#Preview {
    GIFView()
}
