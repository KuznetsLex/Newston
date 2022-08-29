import SwiftUI

struct IssueWebView: View {
    var url: String
    var body: some View {
        IssueWebViewModel(url: url)
    }
}
