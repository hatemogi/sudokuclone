//
//  Board.swift
//  SudokuClone
//
//  Created by Daehyun Kim on 2020/01/24.
//  Copyright © 2020 Daehyun Kim. All rights reserved.
//

import Foundation

struct Board {
    var rows: Array<Array<Int>> = []
    
    init(size: Int) {
        rows = Array<Array<Int>>()
        for _ in 1..<size {
            rows.append(Array<Int>(repeating: 0, count: size))
        }
    }
    
    mutating func setRow(row: Int, numbers: [Int]) {
        rows[row] = numbers
    }
    
    func description() -> String {
        rows.map { (row: Array<Int>) -> String in
            row.map { (n: Int) -> String in
                n.description
            }.joined(separator: "")
        }.joined(separator: "\n")
    }
    
}
