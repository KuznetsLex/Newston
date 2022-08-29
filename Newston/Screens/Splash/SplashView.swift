import SwiftUI

struct SplashView: View {
    @ObservedObject var splashViewModel: SplashViewModel
    var body: some View {
        if splashViewModel.isShowing {
            splashViewModel.toInbox
        } else {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    splashViewModel.splashImage
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                withAnimation {
                                    splashViewModel.isShowing = true
                                }
                            }
                        }
                    Spacer()
                }
                Spacer()
            }
            .background(Color("Splash"))
        }
    }
}
