//
//  ForgotPasswordView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct ForgotPasswordView: View {
  var id: String
  var body: some View {
    Text("Forgot password: \(id)")
  }
}

#Preview {
  ForgotPasswordView(id: "123")
}
