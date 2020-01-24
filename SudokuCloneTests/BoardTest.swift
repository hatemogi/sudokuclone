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

    func testDescription() {
        let board = Board()
        board.setRow(row: 0, numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9])
        print(board.description())
    }

    func testValid() {
        let board = Board()
        XCTAssert(board.isValid(numbers: [1,2,3,4,5,6,7,8,9]))
        XCTAssert(board.isValid(numbers: [0,2,3,4,5,6,7,8,0]))
        XCTAssert(!board.isValid(numbers: [0,2,2,4,5,6,7,8,0]))
        XCTAssert(!board.isValid(numbers: [2,2,4,5,6,7,8,0]))
    }

    func testComplete() {
        let board = Board()
        XCTAssert(board.hasComplete(numbers: [1,2,3,4,5,6,7,8,9]))
        XCTAssert(!board.hasComplete(numbers: [0,2,3,4,5,6,7,8,0]))
    }

    func testParse() {
        let game = """
            123 456 789
            456 789 123
            089 123 456

            234 567 891
            567 801 234
            891 234 567

            345 678 912
            678 912 345
            912 345 678
        """
        XCTAssert(Board.from(string: game).description() == """
            123456789
            456789123
            089123456
            234567891
            567801234
            891234567
            345678912
            678912345
            912345678
            """
        )
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
