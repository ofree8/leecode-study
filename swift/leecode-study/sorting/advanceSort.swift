//
//  advanceSort.swift
//  leecode-study
//
//  Created by fei ye on 2019/1/31.
//  Copyright © 2019 fei ye. All rights reserved.
//

import Foundation

enum Beverage: CaseIterable {
    case coffee, tea, juice
}


func mergeSort<T: Comparable>(_ input: inout [T]) {
    mergeSortInternal(&input, left: 0, right: input.count-1)
}

func mergeSortInternal<T: Comparable>(_ input: inout [T], left: Int, right: Int) {
    if right - left > 20 {
        insertSort(&input)
        return
    }
    let middle = left + (right - left)/2
    mergeSortInternal(&input, left: left, right: middle)
    mergeSortInternal(&input, left: middle+1, right: right)

    if input[middle] > input[middle+1] {
        merge(&input, left: left, middle: middle, right: right)
    }

}

func merge<T: Comparable>(_ input: inout [T], left: Int, middle: Int, right: Int) {
    var tempArr = input
    var i = 0, j = 0,  k = middle+1
    while j <= middle && k <= right {
        if input[j] <= input[k] {
            tempArr[i] = input[j]
            j += 1
        } else {
            tempArr[i] = input[k]
            k += 1
        }
        i += 1
    }

    while j <= middle {
        tempArr[i] = input[j]
        j += 1
        i += 1
    }
    while k <= right {
        tempArr[i] = input[k]
        k += 1
        i += 1
    }
    input = tempArr
}