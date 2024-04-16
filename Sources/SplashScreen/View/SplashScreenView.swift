// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct SplashScreenView<ViewModel: SplashScreenVMType>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        switch viewModel.state {
        case .loading:
            loadingView
        case .failed:
            EmptyView()
        }
    }

    private var loadingView: some View {
        ZStack {
            Color(.dark)
            Text("RAWG")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
        .ignoresSafeArea()
        .task {
            await viewModel.getConfig()
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    private final class MockVM: SplashScreenVMType {
        let state: SplashScreenState = .loading

        func getConfig() async {}
    }

    static var previews: some View {
        SplashScreenView(viewModel: MockVM())
    }
}
