import SwiftUI

struct DiscoverView: View {
    @ObservedObject var discoverViewModel: DiscoverViewModel
    var body: some View {
        Text("Discover")// todo
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        let discoverViewModel = DiscoverViewModel()
        DiscoverView(discoverViewModel: discoverViewModel)
    }
}
