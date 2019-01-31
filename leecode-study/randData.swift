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
