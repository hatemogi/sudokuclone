//
//  Board.swift
//  SudokuClone
//
//  Created by Daehyun Kim on 2020/01/24.
//  Copyright © 2020 Daehyun Kim. All rights reserved.
//

import Foundation

/*
 Board class is responsible for...
 - maintain numbers
 - validation whether the numbers are ok and has no duplications
 - checking completeness of numbers on entire Board

 */
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
    
    func isValid(_ numbers: [Int]) -> Bool {
        let nonEmpty = numbers.filter { n in 1 <= n && n <= size }
        let numset = Set(nonEmpty)
        return numbers.count == rows.count    // valid size
            && numset.count == nonEmpty.count // no duplicates
    }
    
    func hasComplete(_ numbers: [Int]) -> Bool {
        return Set(numbers.filter { n in 1 <= n && n <= size }).count == size
    }
    
    /*
     checks if the [condition] is met for all...
     - rows
     - columns
     - sections (3x3 blocks)
     */
    func allSatisfy(_ condition: ([Int]) -> Bool) -> Bool {
        let rows = self.rows
        let cols = (0..<size).map { c in rows.map { row in row[c] } }
        let sectionSize: Int = size / 3
        var sections: Array<Array<Int>> = []
        for r in 0..<sectionSize {
            let sr = r * sectionSize
            for c in 0..<sectionSize {
                let sc = c * sectionSize
                sections.append(rows[sr..<sr+sectionSize].flatMap { row in row[sc..<sc+sectionSize]})
            }
        }
        return rows.allSatisfy(condition) &&
            cols.allSatisfy(condition) &&
            sections.allSatisfy(condition)
    }

    func isValid() -> Bool {
        return allSatisfy(isValid);
    }

    func hasComplete() -> Bool {
        return allSatisfy(hasComplete);
    }

    func description() -> String {
        rows.map { (row: Array<Int>) -> String in
            row.map { (n: Int) -> String in
                n.description
            }.joined(separator: "")
        }.joined(separator: "\n")
    }
    
    /*
     Parses string to make a Board object.
     */
    static func from(string: String) -> Board {
        let board = Board()
        let lines = string.split(separator: "\n")
        assert(lines.count == board.size, "line count mismatch")
        for r in 0..<board.size {
            let numbers: [Int] = lines[r].replacingOccurrences(of: " ", with: "")
                .map { c in c.wholeNumberValue! }
            board.setRow(row: r, numbers: numbers)
        }
        return board;
    }
}
