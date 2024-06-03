//
//  NavigationViewStack.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 24.05.2024.
//

import Foundation
import SwiftUI

public struct NavigationViewStack<V>: View where V: View {

    @ViewBuilder private let content: () -> V

    public init(content: @escaping () -> V) {
        self.content = content
    }

    public var body: some View {
        if #available(iOS 16, *) {
            NavigationStack { content() }.navigationBarBackButtonHidden(true)
        } else {
            NavigationView { content() }.navigationBarBackButtonHidden(true)
        }
    }
}

public extension View {
    @ViewBuilder
    func navigationDestinationWrapper<V>(isPresented: Binding<Bool>, @ViewBuilder destination: () -> V) -> some View where V: View {
        if #available(iOS 16, *) {
            self.navigationDestination(isPresented: isPresented, destination: destination)
        } else {
            ZStack {
                NavigationLink(isActive: isPresented, destination: destination, label: {
                    EmptyView()
                })
                self
            }
        }
    }

    @ViewBuilder
    func navigationDestinationWrapper<D, C>(item: Binding<D?>, @ViewBuilder destination: @escaping (D) -> C) -> some View where D: Hashable, C: View {
        if #available(iOS 17, *) {
            self.navigationDestination(item: item, destination: destination)
        } else {
            ZStack {
                NavigationLink(
                    destination: generateDestination(item, destination),
                    isActive: Binding<Bool>(
                        get: { item.wrappedValue != nil },
                        set: { _ in
                            item.wrappedValue = nil
                        }
                    ),
                    label: { EmptyView() }
                )
                self
            }
        }
    }

    @ViewBuilder
    private func generateDestination<D, C>(_ item: Binding<D?>, @ViewBuilder _ destination: @escaping (D) -> C) -> some View where D: Hashable, C: View {
        if let unwrappedItem = item.wrappedValue {
            destination(unwrappedItem)
        } else {
            EmptyView()
        }
    }
}
