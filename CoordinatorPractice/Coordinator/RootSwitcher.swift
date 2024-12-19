//
//  RootSwitcher.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/20/24.
//

import Foundation

@Observable
final class RootSwitcher {
  enum Root {
    case onboarding
    case main
  }
  
  private(set) var root: Root
  
  init() {
    let isOnboarding = UserDefaults.standard.object(forKey: "isOnboarding") as? Bool ?? true
    self.root = isOnboarding ? .onboarding : .main
  }
  
  func switchRootView() {
    switch root {
    case .onboarding:
      root = .main
      UserDefaults.standard.set(false, forKey: "isOnboarding")
    case .main:
      root = .onboarding
      UserDefaults.standard.set(true, forKey: "isOnboarding")
    }
  }
}
