//
//  DeepLinkHandler.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import Foundation

class DeepLinkHandler {
    enum DeepLink: Equatable {
        case home
        case details(audioBoxID: String)
    }

    func parseComponents(from url: URL) -> DeepLink? {
      guard url.scheme == "https" else {
        return nil
      }

      guard let query = url.query else {
        return nil
      }

      let components = query.split(separator: ",").flatMap {
        $0.split(separator: "=")
      }

      guard let idIndex = components.firstIndex(of: Substring("audioBoxID")) else {
        return nil
      }

      guard idIndex + 1 < components.count else {
        return nil
      }

        return .details(audioBoxID: String(components[idIndex + 1]))
    }
}
