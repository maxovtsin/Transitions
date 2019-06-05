// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linked%20List

public final class LinkedList<T> {

    public class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?
        weak var previous: LinkedListNode?

        public init(value: T) {
            self.value = value
        }
    }

    public typealias Node = LinkedListNode<T>

    private(set) var head: Node?

    public var last: Node? {
        guard var node = head else {
            return nil
        }

        while let next = node.next {
            node = next
        }
        return node
    }

    public var isEmpty: Bool {
        return head == nil
    }

    public var count: Int {
        guard var node = head else {
            return 0
        }

        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }

    public func append(_ value: T) {
        let newNode = Node(value: value)
        append(newNode)
    }

    public func append(_ node: Node) {
        let newNode = node
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }

    public func append(_ list: LinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            append(node.value)
            nodeToCopy = node.next
        }
    }

    public func removeAll() {
        head = nil
    }

    @discardableResult
    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        node.previous = nil
        node.next = nil
        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while let nd = node {
            s += "\(nd.value)"
            node = nd.next
            if node != nil { s += ", \n" }
        }
        return s + "]"
    }
}

// MARK: - Collection
extension LinkedList: Collection {

    public typealias Index = LinkedListIndex<T>

    /// - Complexity: O(1)
    public var startIndex: Index {
        get {
            return LinkedListIndex<T>(node: head, tag: 0)
        }
    }

    /// - Complexity: O(n), where n is the number of elements in the list. This can be improved by keeping a reference
    ///   to the last node in the collection.
    public var endIndex: Index {
        get {
            if let h = self.head {
                return LinkedListIndex<T>(node: h, tag: count)
            } else {
                return LinkedListIndex<T>(node: nil, tag: startIndex.tag)
            }
        }
    }

    public subscript(position: Index) -> T {
        get {
            return position.node!.value
        }
    }

    public func index(after idx: Index) -> Index {
        return LinkedListIndex<T>(node: idx.node?.next, tag: idx.tag + 1)
    }
}

public struct LinkedListIndex<T>: Comparable {
    fileprivate let node: LinkedList<T>.LinkedListNode<T>?
    fileprivate let tag: Int

    public static func==<T>(lhs: LinkedListIndex<T>, rhs: LinkedListIndex<T>) -> Bool {
        return (lhs.tag == rhs.tag)
    }

    public static func< <T>(lhs: LinkedListIndex<T>, rhs: LinkedListIndex<T>) -> Bool {
        return (lhs.tag < rhs.tag)
    }
}
