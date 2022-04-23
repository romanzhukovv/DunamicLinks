//
//  DeepLinkHandler.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import Foundation

class DeepLinkManager: ObservableObject {
    @Published var currentView: ViewType? = .home
    @Published var currentDetail: String?
    @Published var deepLink: String?
    
    func parseComponents(from url: URL) -> String? {
        guard url.scheme == "https" else { return nil }
        
        guard let query = url.query else { return nil}
        
        let components = query.split(separator: ",").flatMap {
            $0.split(separator: "=")
        }
        
        guard let idIndex = components.firstIndex(of: Substring("audioBoxID")) else { return nil }
        
        guard idIndex + 1 < components.count else { return nil }
        
        return String(components[idIndex + 1])
    }
}

enum ViewType {
    case home
    case audioList
}
