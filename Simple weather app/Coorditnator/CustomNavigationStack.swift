//
//  CustomNavigationStack.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

struct CustomNavigationStack<Screen, ScreenView: View>: View {
    
    @Binding var stack: [Screen]
    @ViewBuilder var buildView: (Screen) -> ScreenView
    
    var body: some View {
        stack
            .enumerated()
            .reversed()
            .reduce(NavigationNode<Screen, ScreenView>.end) { pushedNode, new in
                let (index, screen) = new
                return NavigationNode<Screen, ScreenView>.view(
                    buildView(screen),
                    pushing: pushedNode,
                    stack: $stack,
                    index: index
                )
            }
    }
}



indirect enum NavigationNode<Screen, ScreenView: View>: View {
    
    case view(ScreenView, pushing: NavigationNode<Screen, ScreenView>, stack: Binding<[Screen]>, index: Int)
    case end
    
    var body: some View {
        switch self {
        case .view(let view, let pushedNode, let stack, let index):
            view.background {
                NavigationLink(
                    destination: pushedNode,
                    isActive: Binding(
                        get: {
                            if case .end = pushedNode {
                                return false
                            }
                            return stack.wrappedValue.count > index + 1
                        },
                        set: { isPushed in
                            guard !isPushed else { return }
                            stack.wrappedValue = Array(stack.wrappedValue.prefix(index + 1))
                        }),
                    label: {
                        EmptyView()
                    }
                ).hidden()
            }
        case .end:
            EmptyView()
        }
    }
    
}
