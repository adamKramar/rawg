// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct CustomHScrollView<Content: View>: View {
    @State private var scrollPosition: CGFloat = .zero
    @State private var offsetStep: CGFloat = .zero

    private let scrollIndicatorHeight: CGFloat = 2
    private let coordinateSpace = "customHScroll"
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: .zero) {
            GeometryReader { reader in
                ScrollView(.horizontal, showsIndicators: false) {
                    content
                        .background(
                            GeometryReader { proxy in
                                Color.clear
                                    .onAppear {
                                        let maxOffset = proxy.size.width - reader.size.width
                                        offsetStep = 1 / maxOffset
                                    }
                                    .onChange(of: -proxy.frame(in: .named(coordinateSpace)).origin.x) { _, newOffset in
                                        scrollPosition = newOffset * offsetStep
                                    }
                            }
                        )
                }
            }
            CustomScrollIndicator(value: $scrollPosition)
                .frame(height: scrollIndicatorHeight)
        }
        .coordinateSpace(name: coordinateSpace)
    }
}
