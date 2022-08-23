import SwiftUI
import WebKit

struct IssueWebView: View {
    var url: String
    var body: some View {
        IssueWebViewModel(url: url)
    }
}

struct IssueWebViewModel: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView

    var url: String
    init(url: String) {
        self.url = url
        webView = WKWebView(frame: .zero)
        webView.load(URLRequest(url: URL(string: url) ?? URL(string: "http://51.250.88.170:4567/icons/3.png")!))
        // заменить на дефолтную ссылку ошибки
    }

    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
