//
//  SudokuGrid.swift
//  SudokuClone
//
//  Created by Daehyun Kim on 2020/01/25.
//  Copyright © 2020 Daehyun Kim. All rights reserved.
//

import SpriteKit

class SudokuGrid : SKNode {
    private var cells : [SudokuCell] = []
    private let w = 52
    private let h = 52

    public override init() {
        super.init()
        let x = -w * 2 - w / 2
        let y = h * 5 + h / 2
        for r in 0..<9 {
            for c in 0..<9 {
                let cell = SudokuCell(rect: CGRect(x: 0, y: 0, width: w, height: h))
                cell.position = CGPoint(x: x + c * w, y: y - r * h)
                cell.number = c
                cells.append(cell)
                addChild(cell)
            }
        }
    }
    
    public func setNumber(row: Int, col: Int, number: Int) {
        cells[row * 9 + col].number = number
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var frame: CGRect {
        get {
            CGRect.init(x: 0, y: 0, width: w * 9, height: h * 9)
        }
    }
}
