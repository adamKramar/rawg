// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct PageIndicator: View {
    private let spacing: CGFloat = CustomPadding.size10.rawValue
    private let dotDiameter: CGFloat = 6

    let pageCount: Int
    @Binding var selectedIndex: Int?

    init(pageCount: Int, currentPage: Binding<Int?>) {
        self.pageCount = pageCount
        self._selectedIndex = currentPage
    }

    var body: some View {
       HStack(alignment: .center, spacing: spacing) {
           ForEach(0..<pageCount, id: \.self) { index in
               DotIndicator(
                   pageIndex: index,
                   slectedPage: $selectedIndex
               ).frame(
                   width: dotDiameter,
                   height: dotDiameter
               )
           }
       }
    }
}

struct DotIndicator: View {
    let dafaultScale: CGFloat = 1
    let selectedScale: CGFloat = 1.2
    let dafaultOpacity: Double = 0.6

    let pageIndex: Int
    @Binding var slectedPage: Int?

    var body: some View {
        Button(
            action: {
                slectedPage = pageIndex
            },
            label: {
                Circle()
                    .scaleEffect(
                        slectedPage == pageIndex
                            ? selectedScale
                            : dafaultScale
                    )
                    .foregroundColor(
                        slectedPage == pageIndex
                            ? Color.red
                            : Color.graphite

                    )
                    .animation(.spring, value: slectedPage)
            }
        )
    }
}
