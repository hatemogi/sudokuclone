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
    let size = 9
    
    init() {
        rows = Array<Array<Int>>()
        for _ in 0..<size {
            rows.append(Array<Int>(repeating: 0, count: size))
        }
    }
    
    mutating func setRow(row: Int, numbers: [Int]) {
        assert(numbers.count == size, "numbers must have \(size) elements")
        assert(!numbers.contains(where: {$0 < 0 || $0 > size}))
        rows[row] = numbers
    }
    
    func isValid(numbers: [Int]) -> Bool {
        let nonEmpty = numbers.filter { n in 1 <= n && n <= size }
        let numset = Set(nonEmpty)
        return numbers.count == rows.count   // valid size
            && numset.count == nonEmpty.count // no duplicates
    }
    
    func hasComplete(numbers: [Int]) -> Bool {
        return Set(numbers.filter { n in 1 <= n && n <= size }).count == size
    }
    
    func description() -> String {
        rows.map { (row: Array<Int>) -> String in
            row.map { (n: Int) -> String in
                n.description
            }.joined(separator: "")
        }.joined(separator: "\n")
    }
    
}
