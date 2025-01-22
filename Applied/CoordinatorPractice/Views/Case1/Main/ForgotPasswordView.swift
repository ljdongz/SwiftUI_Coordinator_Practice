//
//  ForgotPasswordView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct ForgotPasswordView: View {
  @Environment(MainCoordinator.self) private var coordinator
  var id: String
  var body: some View {
    Text("Forgot password: \(id)")
    Button {
      coordinator.dismissSheet()
    } label: {
      Text("Dismiss")
    }

  }
}

#Preview {
  ForgotPasswordView(id: "123")
}
