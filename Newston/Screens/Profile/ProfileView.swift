import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    var body: some View {
        Text("Profile") // todo
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let profileViewModel = ProfileViewModel()
        ProfileView(profileViewModel: profileViewModel)
    }
}
