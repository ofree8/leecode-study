//
// Created by fei ye on 2019-01-31.
// Copyright (c) 2019 fei ye. All rights reserved.
//

import Foundation

indirect enum Tree<T: Comparable> {
    case Empty
    case Node(left:Tree<T>, value:T, right:Tree<T>)

    var isEmpty: Bool {
        switch self {
        case .Empty: return true
        default: return false
        }
    }
    var left: Tree {
        get {
            switch self {
            case .Empty: return .Empty
            case .Node(let left, _, _):
                return left
            }
        }

    }

    var right: Tree {
        get {
            switch self {
            case .Empty: return .Empty
            case .Node(_, _, let right):
                return right
            }
        }
    }
    var value: T? {
        get {
            switch self {
            case .Empty: return nil
            case .Node(_, let value, _):
                return value
            }
        }
    }
}


class BST<T: Comparable>: CustomStringConvertible {
    var size: Int
    var root: Tree<T>
    init() {
        root = Tree.Empty
        size = 0
    }
    typealias Executor<T> = (_ node:T, _ level:Int) -> Void

    public func add(_ value: T) {
        root = addTree(root, value: value)
    }

    public func traverseDFT(_ executor: Executor<T>) {
        guard !root.isEmpty else {
            return
        }
        traverseTreeDFT(root, executor: executor, level:0)
    }

    public func traverseBFT(_ executor: Executor<T>) {
        guard  !root.isEmpty else {
            return
        }
        var tempElements = [root]
        while tempElements.count > 0 {
            let current = tempElements.remove(at: 0)
            executor(current.value!, 0)
            if case let Tree.Node(left: _, value: _, right: _) = current.left {
                tempElements.append(current.left)
            }
            if case let Tree.Node(left: _, value: _, right: _) = current.right {
                tempElements.append(current.right)
            }
        }
    }

    private func addTree(_ tree: Tree<T>, value: T) -> Tree<T> {
        guard case var Tree.Node(left: rootLeft, value: rootValue, right: rootRight) = tree else {
            size += 1
            return Tree.Node(left: .Empty, value: value, right: .Empty)
        }
        if value > rootValue {
            return Tree.Node(left: tree.left, value: tree.value!, right: addTree(tree.right, value: value))
        } else {
            return Tree.Node(left: addTree(tree.left, value: value), value: tree.value!, right: tree.right)
        }
        return tree
    }

    // 递归深度遍历二叉搜索树
    private func traverseTreeDFT<T>(_ tree: Tree<T>, executor: Executor<T>, level: Int) {
        guard let value = tree.value  else {
            return
        }
        if case  let Tree.Node(_, _, _) = tree.left {
            traverseTreeDFT(tree.left, executor: executor, level: level+1)
        }
        if case  let Tree.Node(_, _, _) = tree.right {
            traverseTreeDFT(tree.right, executor: executor, level: level+1)
        }
        executor(value, level)
    }


    var description: String  {
        get {
            var output = ""
//            self.traverseBFT { (value: T, lever: Int) in
//                print("current lever \(lever) of value \(value)", to: &output)
//            }
            self.traverseDFT { (value: T, lever: Int) in
                print("current lever \(lever) of value \(value)", to: &output)
            }
            return output
        }
    }
}

