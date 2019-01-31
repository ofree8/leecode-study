//
//  sort.swift
//  leecode-study
//
//  Created by fei ye on 2019/1/31.
//  Copyright © 2019 fei ye. All rights reserved.
//

import Foundation

func selectionSort<T:Comparable>(_ input: inout [T]) -> [T] {
    var tempMin: T
    var i = 0, j = 0
    
    repeat {
        tempMin = input[i]
        j = i + 1
        repeat {
            if tempMin > input[j] {
                tempMin = input[j]
                (input[i], input[j]) = (input[j], input[i])
            }
            j += 1
        } while j < input.count
        i += 1
    } while i < input.count-1
    return input
}
