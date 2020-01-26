//
//  SudokuCell.swift
//  SudokuClone
//
//  Created by Daehyun Kim on 2020/01/26.
//  Copyright © 2020 Daehyun Kim. All rights reserved.
//

import SpriteKit

class SudokuCell : SKNode {
    private var box : SKShapeNode?
    private var label : SKLabelNode?
    public var number : Int {
        get {
            return Int(label?.text ?? "0")!
        }
        set {
            label?.text = String(newValue)
        }
    }
    
    public init(rect: CGRect) {
        super.init()
        self.box = SKShapeNode.init(rect: rect)
        if let box = self.box {
            box.position = CGPoint(x: 0, y: 0)
            box.fillColor = UIColor.blue
            box.lineWidth = 2
            self.label = SKLabelNode.init(fontNamed: "Menlo")
            if let label = self.label {
                label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
                label.position = CGPoint(x: rect.width / 2, y: rect.height / 2)
                label.fontSize = 32
                label.text = "9"
                box.addChild(label)
            }
            addChild(box)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
