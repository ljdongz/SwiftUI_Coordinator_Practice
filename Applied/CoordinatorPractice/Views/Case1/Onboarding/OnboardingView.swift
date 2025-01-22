//
//  OnboardingView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct OnboardingView: View {
  @Environment(OnboardingCoordinator.self) var coordinator
  @Environment(RootSwitcher.self) var rootSwitcher
  
  var body: some View {
    Text("Onboarding")
    
    Button {
      rootSwitcher.switchRootView()
    } label: {
      Text("Change Root to Main")
    }
    
    Button {
      coordinator.push(.onboarding1)
    } label: {
      Text("Push")
    }
  }
}

#Preview {
  OnboardingView()
    .environment(OnboardingCoordinator())
}
