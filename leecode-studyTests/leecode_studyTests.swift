//
//  leecode_studyTests.swift
//  leecode-studyTests
//
//  Created by fei ye on 2019/1/31.
//  Copyright © 2019 fei ye. All rights reserved.
//

import XCTest
@testable import leecode_study

class leecode_studyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPerformanceSorts() {
        var inputs = generateData(5000, min: 0, max: 10000)
        var copyedInputs = inputs
        let start = DispatchTime.now()
        selectionSort(&inputs)
        let stamp = DispatchTime.now()
        bubbleSort(&copyedInputs)
        let stamp1 = DispatchTime.now()
        print("~~~Select sort", Double(stamp.uptimeNanoseconds-start.uptimeNanoseconds) / 1000000.0)
        print("~~~bubble sort", Double(stamp1.uptimeNanoseconds-stamp.uptimeNanoseconds) / 1000000.0)
    }

}
