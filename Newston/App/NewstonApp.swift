//
//  NewstonApp.swift
//  Newston
//
//  Created by test on 20.07.2022.
//

import SwiftUI

@main
struct Newston: App {
    var body: some Scene {
        WindowGroup {

            Navigator.navigate(to: .startInbox, content: { EmptyView() })
        }
    }
}
