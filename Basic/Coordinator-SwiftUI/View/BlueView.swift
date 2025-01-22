//
//  BlueView.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

struct BlueView: View {
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    ZStack {
      Color.blue.ignoresSafeArea()
      
      VStack {
        Button {
          coordinator.dismissSheet()
        } label: {
          Text("Dismiss")
            .font(.largeTitle)
            .foregroundStyle(.white)
        }
      }
    }
  }
}

#Preview {
  BlueView()
    .environmentObject(Coordinator())
}
