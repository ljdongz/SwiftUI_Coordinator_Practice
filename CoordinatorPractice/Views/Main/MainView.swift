//
//  MainView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct MainView: View {
  @Environment(MainCoordinator.self) var coordinator
  @Environment(RootSwitcher.self) var rootSwitcher
  
  var body: some View {
    ZStack {
      Color.yellow.ignoresSafeArea()
      
      VStack {
        Button {
          coordinator.push(.login(date: .now))
        } label: {
          Text("Login")
        }
        Button {
          coordinator.presentSheet(.forgotPassword(id: "Test"))
        } label: {
          Text("Forgot")
        }

        Button {
          rootSwitcher.switchRootView()
        } label: {
          Text("Change Root to Onboarding")
        }
      }
      
    }
    
  }
}

#Preview {
  MainView()
    .environment(MainCoordinator())
}
