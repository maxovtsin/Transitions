//
//  LeaksDetector.swift
//  Transitions
//
//  Created by Max Ovtsin on 16/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

class LeaksDetector {

    typealias Node = LinkedList<Frame>.LinkedListNode<Frame>

    // MARK: - Interface
    @discardableResult
    func detect(from node: Node) -> [Frame] {
        var leaks = [Frame]()
        var last: Node? = node
        while let _last = last {
            leaks.append(_last.value)
            last = _last.next
        }
        if !leaks.isEmpty {
            print(description: "Possible leaks", frames: leaks)
        }
        return leaks.reversed()
    }

    @discardableResult
    func detect(in list: LinkedList<Frame>) -> (leaks: [Frame], dangling: [Frame]) {
        var leaks = [Frame]()
        var dangling = [Frame]()
        for current in list.reversed() {
            if let viewController = current.viewController,
                viewController.view.window == nil {
                leaks.append(current)
            }
            let mode = current.presentationMode
            if (mode == .custom || mode == .modal || mode == .push) && current.viewController == nil {
                dangling.append(current)
            }
        }

        leaks = leaks.reversed()
        dangling = dangling.reversed()

        if !leaks.isEmpty {
            print(description: "Possible leaks", frames: leaks)
        }
        if !dangling.isEmpty {
            print(description: "Dangling frames", frames: dangling)
        }

        return (leaks, dangling)
    }

    // MARK: - Private functions
    private func print(description: String, frames: [Frame]) {
        Swift.print("")
        Swift.print("\(description.uppercased()):")

        var description = ""
        for frame in frames {
            description += " - " + frame.description + "\n"
        }

        Swift.print(description)
        Swift.print("")
    }
}
