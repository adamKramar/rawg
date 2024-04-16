// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

enum CustomPadding: CGFloat {
    case zero = 0
    case size2 = 2
    case size4 = 4
    case size6 = 6
    case size8 = 8
    case size10 = 10
    case size12 = 12
    case size16 = 16
    case size20 = 20
    case size22 = 22
    case size24 = 24
    case size32 = 32
}

extension View {
    func customPadding(_ size: CustomPadding = .size16, isNegative: Bool = false) -> some View {
        customPadding(.all, size, isNegative: isNegative)
    }

    func customPadding(_ edges: Edge.Set = .all, _ size: CustomPadding = .size16, isNegative: Bool = false) -> some View {
        let sizeValue = isNegative ? -size.rawValue : size.rawValue
        return padding(edges, sizeValue)
    }
}
