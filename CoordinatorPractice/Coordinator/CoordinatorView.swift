//
//  ContentView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct CoordinatorView: View {
  @State private var onboardingCoordinator = OnboardingCoordinator()
  @State private var mainCoordinator = MainCoordinator()
  @State private var rootSwitcher = RootSwitcher()
  
  var body: some View {
    Group {
      switch rootSwitcher.root {
      case .onboarding:
        onboardingView
      case .main:
        mainView
      }
    }
    .environment(rootSwitcher)
    .onChange(of: rootSwitcher.root) { oldValue, _ in
      switch oldValue {
      case .onboarding:
        onboardingCoordinator.popToRoot()
      case .main:
        mainCoordinator.popToRoot()
      }
    }
  }
  
  @ViewBuilder
  private var onboardingView: some View {
    NavigationStack(path: $onboardingCoordinator.path) {
      onboardingCoordinator.buildPage(.onboarding)
        .navigationDestination(for: OnboardingPage.self) { page in
          onboardingCoordinator.buildPage(page)
        }
    }
    .environment(onboardingCoordinator)
  }
  
  @ViewBuilder
  private var mainView: some View {
    NavigationStack(path: $mainCoordinator.path) {
      mainCoordinator.buildPage(.main)
        .navigationDestination(for: MainPage.self) { page in
          mainCoordinator.buildPage(page)
        }
        .sheet(item: $mainCoordinator.sheet) { sheet in
          mainCoordinator.buildSheet(sheet)
        }
        .onOpenURL { url in
          if rootSwitcher.root == .main {
            mainCoordinator.popToRoot()
            mainCoordinator.sheet = .forgotPassword(id: "Widget")
          }
        }
    }
    .environment(mainCoordinator)
  }
}

#Preview {
  CoordinatorView()
}
