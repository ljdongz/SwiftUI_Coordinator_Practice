//
//  MainView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct MainView: View {
  @Environment(Coordinator.self) var coordinator
  var body: some View {
    ZStack {
      Color.yellow.ignoresSafeArea()
      
      VStack {
        Button {
          coordinator.push(page: .login(date: .now))
        } label: {
          Text("Login")
        }
        Button {
          coordinator.presentSheet(.forgotPassword(id: "Test"))
        } label: {
          Text("Forgot")
        }

        Button {
          coordinator.changeRoot()
        } label: {
          Text("Change Root to Onboarding")
        }
      }
      
    }
    
  }
}

#Preview {
  MainView()
    .environment(Coordinator())
}
