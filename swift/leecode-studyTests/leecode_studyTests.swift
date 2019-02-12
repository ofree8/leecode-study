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
        print(generateNearlyOrderedData(100, swap:3))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPerformanceSorts() {
//        var inputs = generateData(5000, min: 0, max: 100)
        var inputs = generateNearlyOrderedData(5000, swap: 10)
        var inputs1 = inputs
        var inputs2 = inputs
        var inputs3 = inputs
        let start = DispatchTime.now()
        selectionSort(&inputs)
        let stamp = DispatchTime.now()
        bubbleSort(&inputs1)
        let stamp1 = DispatchTime.now()
        insertSort(&inputs2)
        let stamp2 = DispatchTime.now()
        mergeSort(&inputs3)
        let stamp3 = DispatchTime.now()
        print("~~~Select sort", Double(stamp.uptimeNanoseconds-start.uptimeNanoseconds) / 1000000.0, "ms")
        print("~~~bubble sort", Double(stamp1.uptimeNanoseconds-stamp.uptimeNanoseconds) / 1000000.0, "ms")
        print("~~~insert sort", Double(stamp2.uptimeNanoseconds-stamp1.uptimeNanoseconds) / 1000000.0, "ms")
        print("~~~merge sort", Double(stamp3.uptimeNanoseconds-stamp2.uptimeNanoseconds) / 1000000.0, "ms")
    }

    func testBST() {
        let bst = BST<Int>()
        bst.add(7)
        bst.add(5)
        bst.add(10)
        bst.add(4)
        bst.add(2)
        bst.add(8)
        bst.add(9)
        print(bst)
    }

    func testMinHeap() {
        let mheap = MinHeap<Int>()
        let elementsToAdd = [2, 10 ,8, 9, 7, 3, 4]
        for element in elementsToAdd {
            mheap.add(element)
        }
        print(mheap)
        mheap.getMin()
        print(mheap)
        mheap.getMin()
        print(mheap)
    }

    func testAdvanceSorts() {
        var inputs = [1,3,5,2,4,6]
        merge(&inputs, left:0, middle: 2, right: 5)
        print(inputs)
    }

    func testCompute() {
        print((1 - 1) / 2 )
    }

}
