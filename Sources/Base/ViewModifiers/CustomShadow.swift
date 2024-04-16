// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct CustomShadow: ViewModifier {
    let color: Color
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: 6, y: 3)
    }
}

extension View {
    @ViewBuilder
    func customShadow(color: Color = .black, radius: CGFloat = CustomRadius.size10.rawValue) -> some View {
        modifier(
            CustomShadow(
                color: color,
                radius: radius
            )
        )
    }
}
