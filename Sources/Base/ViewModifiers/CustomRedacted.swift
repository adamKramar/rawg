// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct CustomRedacted: ViewModifier {
    let animated: Bool
    @State private var alpha: CGFloat = 0.8

    func body(content: Content) -> some View {
        content
            .redacted(reason: .placeholder)
            .disabled(true)
            .opacity(alpha)
            .animation(
                animated ? .easeOut(duration: 0.8).repeatForever(autoreverses: true) : .none,
                value: alpha
            )
            .task {
                alpha = 0.3
            }
    }
}

extension View {
    @ViewBuilder
    func customRedacted(animated: Bool = true) -> some View {
        modifier(CustomRedacted(animated: animated))
    }
}
