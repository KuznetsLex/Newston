//
//  NewstonApp.swift
//  Newston
//
//  Created by test on 20.07.2022.
//

import SwiftUI

@main
struct Newston: App {
    let splashViewModel = SplashViewModel()
    var body: some Scene {
        WindowGroup {
            SplachScreenView(splashViewModel: splashViewModel)
        }
    }
}
