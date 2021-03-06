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
    @State private var deepLinker = DeepLinkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(deepLinker)
                .onOpenURL { url in
                    print(url)
                    
                    let linkHandled = DynamicLinks.dynamicLinks().handleUniversalLink(url) { dynamicLink, error in
                        guard error == nil else {
                            fatalError("Error handling the incoming dynamic link")
                        }
                        
                        if let dynamicLink = dynamicLink {
                            self.handleDynamicLink(dynamicLink: dynamicLink)
                        }
                    }
                    
                    if linkHandled {
                        print("Link Handled")
                    } else {
                        print("No Link")
                    }
                }
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
    
    private func handleDynamicLink(dynamicLink: DynamicLink) {
        guard let url = dynamicLink.url else { return }

        print("Your incoming link parameter is \(url.absoluteString)")

        guard
          dynamicLink.matchType == .unique ||
          dynamicLink.matchType == .default
        else {
          return
        }

        let deepLinkHandler = DeepLinkManager()
        guard let deepLink = deepLinkHandler.parseComponents(from: url) else {
          return
        }
        deepLinker.currentView = .audioList
        deepLinker.deepLink = deepLink
        print("Deep link: \(deepLink)")
    }
}
