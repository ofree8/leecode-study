//
//  sort.swift
//  leecode-study
//
//  Created by fei ye on 2019/1/31.
//  Copyright © 2019 fei ye. All rights reserved.
//

import Foundation

func bubbleSort<T: Comparable>(_ input: inout [T]) {
    var i = input.count - 1
    var j = 0
    repeat {
        while j < i {
            if input[i] < input[j] {
                (input[i], input[j]) = (input[j], input[i])
            }
            j += 1
        }
        i -= 1
        j = 0
    } while i > 0
}

func selectionSort<T:Comparable>(_ input: inout [T]) {
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
}

func insertSort<T: Comparable>(_ input: inout [T]) {
    var i = 1
    var j: Int
    var tempElem: T
    while i < input.count {
        tempElem = input[i]
        j = i-1
        while j >= 0 && tempElem < input[j] {
            input[j+1] = input[j]
            j -= 1
        }
        input[j+1] = tempElem
        i += 1
    }
}
