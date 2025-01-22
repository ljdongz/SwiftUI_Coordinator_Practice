//
//  GreenView.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

struct GreenView: View {
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      
      VStack {
        Button {
          coordinator.push(.yellowView)
        } label: {
          Text("Navigate : YellowView")
        }
        
        Button {
          coordinator.presentSheet(.blueSheet)
        } label: {
          Text("Sheet : BlueView")
        }

        Button {
          coordinator.presentCover(.redCover)
        } label: {
          Text("Cover : RedView")
        }
        
        Button {
          coordinator.pop()
        } label: {
          Text("Back")
        }
      }
      .foregroundStyle(.white)
      .font(.title2)
    }
  }
}

#Preview {
  GreenView()
    .environmentObject(Coordinator())
}
