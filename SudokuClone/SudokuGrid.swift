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
    private var board : Board = Board()
    public var status : Board.Status {
        get {
            return board.status
        }
    }
    
    public init(board: Board) {
        super.init()
        let baseX = -w * 4
        let baseY = h * 4
        self.board = board
        for r in 0..<9 {
            for c in 0..<9 {
                let cell = SudokuCell(rect: CGRect(x: -w / 2, y: -h / 2, width: w, height: h))
                cell.position = CGPoint(x: baseX + c * w, y: baseY - r * h)
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
        let frame = self.calculateAccumulatedFrame()
        let row = 8 - Int(point.y - frame.minY) / w
        let col = Int(point.x - frame.minX) / w
        board.rotate(row: row, col: col)
        board.traverse(with: self.setNumber)
        cells[row * 9 + col].run(SKAction.init(named: "cellRotate")!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
