//
//  OnboardingCoordinator.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/20/24.
//

import Foundation
import SwiftUI

typealias OnboardingPage = OnboardingCoordinator.AppPage

@Observable
final class OnboardingCoordinator: Navigatable {
  
  enum AppPage {
    case onboarding
    case onboarding1
  }
  
  var path: [AppPage] = []
  
  func push(_ page: AppPage) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeAll()
  }
  
  func buildPage(_ page: AppPage) -> some View {
    switch page {
    case .onboarding:
      OnboardingView()
    case .onboarding1:
      OnboardingView1()
    }
  }
}
