// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct NetworkImageView<Placeholder: View>: View {
    private let size: CGSize
    private let contentMode: ContentMode
    private let placeholder: Placeholder
    private let urlString: String
    private let resolvedImageURL: URL?

    init(
        urlString: String,
        size: CGSize,
        contentMode: ContentMode = .fit,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.urlString = urlString
        self.size = size
        self.contentMode = contentMode
        self.placeholder = placeholder()
        self.resolvedImageURL = urlString.getResolvedImageURL(for: size)
    }

    var body: some View {
        if let url = resolvedImageURL, let image = AsyncImageCache[url] {
            makeContent(image)
                .frame(idealWidth: size.width, idealHeight: size.height)
        } else {
            AsyncImage(url: resolvedImageURL) { phase in
                switch phase {
                case .success(let image):
                    cacheAndRender(image: image)
                case .failure:
                    // Download one more time because of cancelled error phase
                    AsyncImage(url: resolvedImageURL) { phase in
                        if let image = phase.image {
                            cacheAndRender(image: image)
                        } else {
                            // TODO: error
                            EmptyView()
                        }
                    }
                default:
                    placeholder
                }
            }
        }
    }

    func cacheAndRender(image: Image) -> some View {
        if let url = resolvedImageURL {
            AsyncImageCache[url] = image
        }
        return makeContent(image)
            .frame(idealWidth: size.width, idealHeight: size.height)
    }

    @ViewBuilder
    private func makeContent(_ image: Image) -> some View {
        switch contentMode {
        case .fit:
            getImage(image)
                .scaledToFit()
        case .fill:
            getImage(image)
                .scaledToFill()
        }
    }

    private func getImage(_ image: Image) -> some View {
        image
            .resizable()
    }
}

#Preview {
    NetworkImageView(
        urlString: "https://media.rawg.io/media/games/679/679d7a18e220025bdd83dff484d6ea64.jpg",
        size: CGSize(width: 100, height: 100),
        placeholder: {
            Text("Loading...")
        }
    )
}
