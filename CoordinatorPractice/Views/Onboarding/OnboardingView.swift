//
//  OnboardingView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct OnboardingView: View {
  @Environment(Coordinator.self) var coordinator
  var body: some View {
    Text("Onboarding")
    
    Button {
      coordinator.changeRoot()
    } label: {
      Text("Change Root to Main")
    }
    
    Button {
      coordinator.push(page: .onboarding1)
    } label: {
      Text("Push")
    }
    
    Button {
      coordinator.push(page: .login(date: .now))
    } label: {
      Text("Push")
    }
  }
}

#Preview {
  OnboardingView()
    .environment(Coordinator())
}
