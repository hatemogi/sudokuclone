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
    private var _number : Int = 0
    public var number : Int {
        get {
            return _number
        }
        set {
            label?.text = newValue > 0 ? String(newValue) : ""
            _number = newValue
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
