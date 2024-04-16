// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct GradientOverlay: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0), color.opacity(0.66), color]), startPoint: .top, endPoint: .bottom)
            }
    }
}

extension View {
    @ViewBuilder
    func gradientOverlay(color: Color = .graphite) -> some View {
        modifier(GradientOverlay(color: color))
    }
}
