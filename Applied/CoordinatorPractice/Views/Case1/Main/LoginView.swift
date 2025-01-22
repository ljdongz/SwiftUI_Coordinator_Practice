//
//  LoginView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct LoginView: View {
  @Environment(MainCoordinator.self) var coordinator
  @Environment(RootSwitcher.self) var rootSwitcher
  
  var date: Date
  
  var body: some View {
    Text("Login")
    Text("\(date.description)")
    
    Button {
      coordinator.popToRoot()
    } label: {
      Text("Pop to root")
    }
    
    Button {
      rootSwitcher.switchRootView()
    } label: {
      Text("Change Root to Onboarding")
    }
  }
}

#Preview {
  LoginView(date: Date())
    .environment(MainCoordinator())
}
