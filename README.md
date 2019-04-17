# Transitions

This is a proof of concept for Navigation layer which encapsulates all logic related to navigation.

The idea is pretty simple: 
A Flow represents some user story that can be reused across an application.
It has a single function `start` which is required by `Flow` protocol.

To launch a flow you have to call `show` function and pass the type of a flow alongside with an injection that is required by the start function of the flow.
`MainCoordinator` will instantiate the flow and call `start` function.

`MainCoordinator` is responsible for the life cycle of flow and calling `start` function.

If you need to keep talking with a flow you can return a `FlowInput` from the `start` function. Receiving flow can store it and use it in the future.

Once a flow is done, you must notify `MainCoordinator` about it by calling `didFinish` function.
If you don't do that, the coordinator is gonna treat such flows as dangling flows and will let you know about the bug.
The coordinator also can track leaks which can happen if a view is not deallocated and `window` field is equal to nil.

The example project contains some code to demonstrate the key idea. 
It contains a few pieces of commented code which break the logic for demonstrating purposes.
The leak detector will let you know that something goes wrong.
Just uncomment them to fix the problems.

Also, you can create your own transitions. How to do it? Just check `EmbeddedViewTransition` in the example project.

The current implementation of MainCoordinator has a limitation which requires you to invoke `didFinish` function in the order in which they were started.
