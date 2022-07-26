//
//  NewstonApp.swift
//  Newston
//
//  Created by test on 20.07.2022.
//

import SwiftUI

@main
struct Newston: App {
    let inboxViewModel = InboxViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(inboxViewModel: inboxViewModel)
        }
    }
}
