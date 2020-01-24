//
//  Board.swift
//  SudokuClone
//
//  Created by Daehyun Kim on 2020/01/24.
//  Copyright © 2020 Daehyun Kim. All rights reserved.
//

import Foundation

class Board {
    var rows: Array<Array<Int>> = []
    let size = 9
    
    init() {
        rows = Array<Array<Int>>()
        for _ in 0..<size {
            rows.append(Array<Int>(repeating: 0, count: size))
        }
    }
    
    func setRow(row: Int, numbers: [Int]) {
        assert(numbers.count == size, "numbers must have \(size) elements")
        assert(!numbers.contains(where: {$0 < 0 || $0 > size}), "each number must be in range 0..<\(size)")
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
    
    static func from(string: String) -> Board {
        let board = Board()
        let lines = string.split(separator: "\n")
        assert(lines.count == board.size, "line count mismatch")
        for r in 0..<board.size {
            let numbers: [Int] = lines[r].replacingOccurrences(of: " ", with: "")
                .map { c in Int(c.description)! }
            board.setRow(row: r, numbers: numbers)
        }
        return board;
    }
}
