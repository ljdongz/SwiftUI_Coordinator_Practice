//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import Foundation
import SwiftUI

enum Root {
  case onboarding
  case main
}

enum AppPage: Hashable {
  case onboarding
  case onboarding1
  
  case main
  case login(date: Date?)
  
}

enum Sheet: Identifiable {
  case forgotPassword(id: String)
  
  var id: String { UUID().uuidString }
}

@Observable
final class Coordinator {
  private(set) var root: Root
  
  var path: [AppPage] = []
  var sheet: Sheet?
  
  init() {
    let isOnboarding = UserDefaults.standard.object(forKey: "isOnboarding") as? Bool ?? true
    self.root = isOnboarding ? .onboarding : .main
  }
}

// MARK: - Navigation Method
extension Coordinator {
  
  func push(page: AppPage) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
  
  func presentSheet(_ sheet: Sheet) {
    self.sheet = sheet
  }
  
  func presentSheetFromWidget(_ sheet: Sheet) {
    switch root {
    case .onboarding: return
    case .main:
      path.removeAll()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        self.sheet = sheet
      }
    }
  }
  
  func dismissSheet() {
    self.sheet = nil
  }
  
  func changeRoot() {
    switch root {
    case .onboarding:
      root = .main
      UserDefaults.standard.set(false, forKey: "isOnboarding")
    case .main:
      root = .onboarding
      UserDefaults.standard.set(true, forKey: "isOnboarding")
    }
    
    path.removeAll()
  }

}

// MARK: - Build Method
extension Coordinator {
  
  @ViewBuilder
  func buildPage(page: AppPage) -> some View {
    switch page {
    case .main: MainView()
    case .login(let date): LoginView(date: date!)
    case .onboarding: OnboardingView()
    case .onboarding1: OnboardingView1()
    }
  }
  
  @ViewBuilder
  func buildSheet(sheet: Sheet) -> some View {
    switch sheet {
    case .forgotPassword(let id): ForgotPasswordView(id: id)
        
    }
  }
}
