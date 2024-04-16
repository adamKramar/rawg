// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct StoreView: View {
    static let imagePadding = CustomPadding.size8
    private let userIconSize: CGFloat = 12
    private let imageRatio = 0.55

    let content: StoreUI
    let width: CGFloat

    var imageSize: CGSize {
        .init(width: width, height: width * imageRatio)
    }

    var body: some View {
        VStack(spacing: .zero) {
            imageView
                .frame(width: imageSize.width, height: imageSize.height)
                .clipped()
            VStack {
                ForEach(content.games) { game in
                    getGameRow(for: game)
                }
            }
            .customPadding()
        }
        .contentShape(RoundedRectangle(cornerRadius: CustomRadius.size10.rawValue))
        .background(.graphite)
        .customRadius(.size10)
        .customPadding(.vertical, .size20)
        .customShadow()
        .frame(width: width)
    }

    private var imageView: some View {
        ZStack {
            NetworkImageView(
                urlString: content.imageUrl,
                size: imageSize,
                contentMode: .fill
            ) {
                imagePlaceholder
                    .customRedacted()
            }
            .gradientOverlay()

            overlayView
                .customPadding(.horizontal)
                .customPadding(.bottom, .size10)
                .customPadding(.top, .size24)
        }
    }

    private var imagePlaceholder: some View {
        Rectangle()
            .fill(.cultured)
    }

    private var overlayView: some View {
        VStack {
            Spacer()
            Text(content.title)
                .foregroundColor(.white)
                .font(.title)
                .bold()
                .underline()
                .lineLimit(1)
            Spacer()
            HStack {
                Text("Games count:")
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
                Text(content.gamesCountString)
                    .foregroundColor(.darkSilver)
            }
            Rectangle()
                .foregroundColor(.darkSilver)
                .frame(height: 1)
        }
    }

    private func getGameRow(for row: StoreGameUI) -> some View {
        HStack {
            Text(row.name)
                .foregroundStyle(.white)
            Spacer()
            HStack(alignment: .lastTextBaseline) {
                Text(row.added)
                    .foregroundColor(.darkSilver)
                Image(.user)
                    .resizable()
                    .frame(width: userIconSize, height: userIconSize)
            }
        }
        .lineLimit(1)
        .font(.callout)
    }
}

#Preview {
    StoreView(
        content: .init(
            id: 1,
            title: "Steam",
            imageUrl: "https://media.rawg.io/media/games/679/679d7a18e220025bdd83dff484d6ea64.jpg",
            gamesCount: 21_048,
            games: StoresUI.storeGamesMock
        ),
        width: 330
    )
}
