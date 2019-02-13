//
//  sort.swift
//  leecode-study
//
//  Created by fei ye on 2019/1/31.
//  Copyright © 2019 fei ye. All rights reserved.
//

import Foundation

// 冒泡排序，用范型以后，性能下降接近十来倍，所以这种算法，最好避免范型
func bubbleSort(_ input: inout [Int]) {
    var i = input.count - 1, j = 0
    while i >= 0 {
        while j < i {
            if input[j] > input[j+1] {
                (input[j], input[j+1]) = (input[j+1], input[j])
            }
            j += 1
        }
        j = 0
        i -= 1
    }
}

// 选择排序(避免范型)
func selectionSort(_ input: inout [Int]) {
    var i = 0, j = 0
    let count = input.count
    while i < count {
        j = i+1
        while j < count {
            if input[j] < input[i] {
                (input[i], input[j]) = (input[j], input[i])
            }
            j += 1
        }
        i += 1
    }
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
