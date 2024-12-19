//
//  LoginView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct LoginView: View {
  @Environment(Coordinator.self) var coordinator
  
  var date: Date
  var body: some View {
    Text("Login")
    Text("\(date.description)")
    
    Button {
      coordinator.popToRoot()
    } label: {
      Text("Pop to root")
    }
    
  }
}

#Preview {
  LoginView(date: Date())
    .environment(Coordinator())
}
