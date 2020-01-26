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
    private let w = 56
    private let h = 56
    private var board : Board?
    
    public init(board: Board) {
        super.init()
        self.board = board
        let x = -w * 4 - w / 2
        let y = h * 3 + h / 2
        for r in 0..<9 {
            for c in 0..<9 {
                let cell = SudokuCell(rect: CGRect(x: 0, y: 0, width: w, height: h))
                cell.position = CGPoint(x: x + c * w, y: y - r * h)
                cell.number = c
                cells.append(cell)
                addChild(cell)
            }
        }
        board.traverse(with: self.setNumber)
    }
    
    public func setNumber(row: Int, col: Int, number: Int) {
        cells[row * 9 + col].number = number
    }
   
    public func touch(point: CGPoint) {
        
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
