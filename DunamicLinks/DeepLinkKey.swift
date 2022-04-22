//
//  DeepLinkKey.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import SwiftUI

struct DeepLinkKey: EnvironmentKey {
  static var defaultValue: DeepLinkHandler.DeepLink? {
    return nil
  }
}

extension EnvironmentValues {
  var deepLink: DeepLinkHandler.DeepLink? {
    get {
        self[DeepLinkKey.self]
    }
    set {
        self[DeepLinkKey.self] = newValue
    }
  }
}
