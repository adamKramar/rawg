// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct PagingView<Content: View>: View {
    @State var selectedItem: Int? = 0

    let itemSpacing = CustomPadding.size16.rawValue
    let content: Content
    let itemCount: Int

    init(
        itemCount: Int,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.itemCount = itemCount
    }

    var body: some View {
        VStack(spacing: .zero) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: itemSpacing) {
                    content
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $selectedItem)
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, CustomPadding.size16.rawValue)

            PageIndicator(pageCount: itemCount, currentPage: $selectedItem)
        }
    }
}
