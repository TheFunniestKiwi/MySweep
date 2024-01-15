//
//  MineCell.swift
//  MySweep
//
//  Created by Bartłomiej Lachowski on 14/01/2024.
//

import Foundation

struct MineCell {
    var isMine: Bool = false
    var isRevealed: Bool = false
    var isFlagged: Bool = false
    var adjacentMines: Int = 0
}
