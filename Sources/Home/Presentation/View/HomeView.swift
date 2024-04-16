// All rights reserved. Copyright © 2024 Adam Kramár.  

import Combine
import SwiftUI

struct HomeView<ViewModel: HomeVMType>: View {
    private let widgetHeight: CGFloat = 325

    @StateObject var viewModel: ViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                contentView(content: .mock)
                    .customRedacted()
            case let .loaded(content):
                contentView(content: content)
            case .error:
                // TODO: Error handling
                EmptyView()
            }
        }
        .task { await viewModel.getHomeScreenData() }
    }

    private func contentView(content: HomeUI) -> some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing: CustomPadding.size32.rawValue) {
                    storesPagingView(proxy: proxy, content: content.stores)
                    gameWidgetView(content: content.topGames)
                    gameWidgetView(content: content.anticipatedGames)
                }
                .customPadding(.bottom)
            }
        }
    }

    private func storesPagingView(proxy: GeometryProxy, content: StoresUI) -> some View {
        VStack(spacing: .zero) {
            titleView(title: content.name)

            PagingView(itemCount: content.stores.count) {
                HStack {
                    ForEach(content.stores.indices, id: \.self) { index in
                        StoreView(
                            content: content.stores[index],
                            width: proxy.size.width - 4 * StoreView.imagePadding.rawValue
                        )
                    }
                }
            }
        }
    }

    private func gameWidgetView(content: GamesUI) -> some View {
        VStack(spacing: .zero) {
            titleView(title: content.name)
            CustomHScrollView {
                VStack {
                    LazyHStack(spacing: CustomPadding.size16.rawValue) {
                        ForEach(content.games) { game in
                            GameView(content: game)
                        }
                    }
                }
            }
            .frame(height: widgetHeight)
        }
        .safeAreaPadding(.horizontal, CustomPadding.size16.rawValue)
    }

    private func titleView(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.white)
                .font(.title2)
                .bold()
                .lineLimit(1)
                .customPadding(.horizontal)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MockVM())
    }

    private final class MockVM: HomeVMType {
        var state: HomeState = .loaded(.mock)

        func getHomeScreenData() async {}
    }
}
