// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct GameView: View {
    private let imageSize = CGSize(width: 175, height: 94)
    private let plaformIconSize: CGFloat = 12
    private let detailHeight: CGFloat = 177
    let content: GameUI

    var body: some View {
        VStack(spacing: .zero) {
            imageView
                .frame(width: imageSize.width, height: imageSize.height)
                .clipped()
            gameInfoView
                .customPadding(.top, .size8)
                .customPadding([.horizontal, .bottom])
                .frame(height: detailHeight)
        }
        .contentShape(RoundedRectangle(cornerRadius: CustomRadius.size10.rawValue))
        .background(.graphite)
        .customRadius(.size10)
        .customPadding(.vertical, .size20)
        .customShadow()
        .frame(width: imageSize.width)
    }

    private var imageView: some View {
        NetworkImageView(
            urlString: content.imageUrl,
            size: imageSize,
            contentMode: .fill
        ) {
            imagePlaceholder
                .customRedacted()
        }
    }

    private var imagePlaceholder: some View {
        Rectangle()
            .fill(.cultured)
    }

    private var gameInfoView: some View {
        VStack(alignment: .leading, spacing: CustomPadding.size6.rawValue) {
            HStack(alignment: .top) {
                gamePlatformsView
                Spacer()
                metacriticView
            }
            gameTitle
            Spacer()
            ForEach(content.gameInfo.indices, id: \.self) { index in
                getGameInfoRow(
                    for: content.gameInfo[index],
                    isLast: index == content.gameInfo.count - 1
                )
            }
        }
    }

    @ViewBuilder private var gamePlatformsView: some View {
        if let images = content.plafromsImages {
            HStack {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .frame(width: plaformIconSize, height: plaformIconSize)
                }
            }
        }
    }

    private var gameTitle: some View {
        Text(content.name)
            .bold()
            .font(.subheadline)
            .foregroundColor(.white)
            .lineLimit(2)
    }

    @ViewBuilder private var metacriticView: some View {
        if let text = content.metacriticRatingText {
            Text(text)
                .bold()
                .customPadding(.size2)
                .overlay(
                    RoundedRectangle(cornerRadius: CustomRadius.size4.rawValue)
                        .stroke(.green)
                )
                .font(.footnote)
                .foregroundColor(.green)
                .lineLimit(1)

        }
    }

    private func getGameInfoRow(for row: GameInfoUI, isLast: Bool) -> some View {
        VStack(spacing: CustomPadding.size8.rawValue) {
            HStack {
                Text(row.key)
                    .foregroundColor(.darkSilver)
                Spacer()
                Text(row.value)
                    .foregroundColor(.white)
            }
            .lineLimit(1)
            .font(.caption2)
            if !isLast {
                Divider()
                    .background(.darkSilver)
            }
        }
    }
}

#Preview {
    GameView(content: GamesUI.mock(id: 0))
}
