// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

enum CustomRadius: CGFloat {
    case zero = 0
    case size2 = 2
    case size4 = 4
    case size6 = 6
    case size8 = 8
    case size10 = 10
    case size12 = 12
    case size16 = 16
}

extension View {
    func customRadius(_ size: CustomRadius) -> some View {
        cornerRadius(size.rawValue)
    }

    func customRadius(_ size: CustomRadius, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(
                radius: size.rawValue,
                corners: corners
            )
        )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            .cgPath
        )
    }
}
