//
// Created by fei ye on 2019-02-01.
// Copyright (c) 2019 fei ye. All rights reserved.
//

import Foundation

class MinHeap<T: Comparable>: CustomStringConvertible {
    var data: [T]
    var size: Int

    init() {
        data = Array<T>()
        size = 0
    }

    public func add(_ element: T) {
        data.append(element)
        size += 1
        siftUp(&data, index: data.count-1)
    }

    public func getMin() -> T {
        (data[0], data[data.count-1]) = (data[data.count-1], data[0])
        let element = data.remove(at: data.count-1)
        size -= 1
        siftDown(&data, index: 0)
        return element
    }

    // Replace min value of min heap with the element passed in
    public func replace(_ element: T) -> T {
        let retElement = data[0]
        data[0] = element
        siftDown(&data, index: 0)
        return retElement
    }

    private func siftUp(_ data: inout [T], index: Int) {
        var i = index
        while (i > 0 && data[parent(i)] > data[i]){
            (data[i], data[parent(i)]) = (data[parent(i)], data[i])
            i = parent(i)
        }
    }

    private func siftDown(_ data: inout [T], index: Int) {
        var i = index
        var lIndex, rIndex, mIndex : Int
        while (i < size && leftChild(i) < size) {
            lIndex = leftChild(i)
            rIndex = rightChild(i)
            mIndex = rIndex >= size || data[lIndex] < data[rIndex] ? lIndex : rIndex
            if data[i] < data[mIndex] {break}
            (data[i], data[mIndex]) = (data[mIndex], data[i])
            data.swapAt(i, mIndex)
            i = mIndex
        }
    }

    private func parent(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChild(_ index: Int) -> Int {
        return index  * 2 + 1
    }

    private func rightChild(_ index: Int) -> Int {
        return index * 2 + 2
    }

    var description: String  {
        get {
            var output: String = ""
            print(data, to: &output)
            return output
        }
    }
}
