//
//  randData.swift
//  leecode-study
//
//  Created by fei ye on 2019/1/31.
//  Copyright © 2019 fei ye. All rights reserved.
//

import Foundation

func generateData(_ count: Int, min:Int, max:Int) -> [Int] {
    var outputArr = [Int]()
    for _ in 0..<count {
        outputArr.append(Int.random(in: min...max))
    }
    return outputArr
}

func generateNearlyOrderedData(_ count: Int, swap times: Int) -> [Int] {
    var outputArr = [Int]()
    for index in 0..<count {
        outputArr.append(index)
    }
    for _ in 0..<times {
        let i = Int.random(in: 0..<count)
        let j = Int.random(in: 0..<count)
        (outputArr[i], outputArr[j]) = (outputArr[j], outputArr[i])
    }
    return outputArr
}

func isSorted(_ input: [Int], comparer: (Int, Int)->Bool ) -> Bool {
    for (index, _) in input.enumerated() {
        if index+1 < input.count {
            if !comparer(input[index], input[index+1]) {
                return false
            }
        }
    }
    return true
}
