//
//  BoardTest.swift
//  SudokuCloneTests
//
//  Created by Daehyun Kim on 2020/01/24.
//  Copyright © 2020 Daehyun Kim. All rights reserved.
//

import XCTest
@testable import SudokuClone

class BoardTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        var board = Board(size: 9)
        board.setRow(row: 0, numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9])
        print(board.description())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
