import SwiftUI

struct SplashView: View {
    @ObservedObject var splashViewModel: SplashViewModel
    var body: some View {
        if splashViewModel.isShowing {
            Navigator.navigate(to: .startInbox, content: { AnyView(_fromValue: (Any).self) })
        } else {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("splashImage")
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
            .background(Color("Gray_background"))
        }
    }
}
