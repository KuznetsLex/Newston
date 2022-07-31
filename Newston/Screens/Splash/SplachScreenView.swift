import SwiftUI

struct SplachScreenView: View {
    @ObservedObject var splashViewModel: SplashViewModel

    var body: some View {
        if splashViewModel.isShowing {
            ContentView(inboxViewModel: splashViewModel.inboxViewModel)
        } else {
            Image("splashImage")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                        withAnimation {
                            splashViewModel.isShowing = true
                        }
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.size.width/2)
                .padding(.vertical, UIScreen.main.bounds.size.height/2)
                .background(Color("Gray_background"))
        }
    }
}

struct SplachScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let splashViewModel = SplashViewModel()
        SplachScreenView(splashViewModel: splashViewModel)
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
    }
}
