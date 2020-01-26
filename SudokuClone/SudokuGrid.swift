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
    public var board : Board?
    
    public override init() {
        super.init()
        let w = 52
        let h = 52
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override var frame: CGRect {
        get {
            CGRect.init(x: 0, y: 0, width: 500, height: 500)
        }
    }
}
