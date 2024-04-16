// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct CustomScrollIndicator: View {
    @Binding private var value: CGFloat
    private let scrollIndicatorWidth: CGFloat = 60

    init(value: Binding<CGFloat>) {
        self._value = value
    }

    var body: some View {
        GeometryReader { geometryReader in
            HStack(spacing: .zero) {
                Capsule()
                    .frame(
                        width: progress(
                            value: value,
                            maxValue: 1,
                            width: geometryReader.size.width - scrollIndicatorWidth
                        )
                    )
                    .foregroundColor(.dark)
                Capsule()
                    .frame(width: scrollIndicatorWidth)
                    .foregroundColor(.red)

                Capsule()
                    .foregroundColor(.graphite)
            }
            .animation(.interactiveSpring(), value: value)
        }
    }
}

// MARK: - CustomScrollIndicator + progress
private extension CustomScrollIndicator {
    func progress(value: Double, maxValue: Double, width: CGFloat) -> CGFloat {
        let adjustedValue = min(maxValue, max(0, value))
        let percentage = adjustedValue / maxValue
        let calculatedWidth = width * CGFloat(percentage)

        if calculatedWidth >= 0 {
            return calculatedWidth
        } else {
            return .zero
        }
    }
}
