//
//  DunamicLinksApp.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 21.04.2022.
//

import SwiftUI
import Firebase

@main
struct DunamicLinksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
