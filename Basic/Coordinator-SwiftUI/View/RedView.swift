//
//  RedView.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

struct RedView: View {
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    ZStack {
      Color.red.ignoresSafeArea()
      
      Button {
        coordinator.dismissCover()
      } label: {
        Text("Dismiss")
          .font(.largeTitle)
          .foregroundStyle(.white)
      }
    }
  }
}

#Preview {
  RedView()
    .environmentObject(Coordinator())
}
