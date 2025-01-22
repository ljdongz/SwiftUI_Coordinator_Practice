//
//  ContentView.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

struct WhiteView: View {
  @EnvironmentObject private var coordinator: Coordinator
  
  var body: some View {
    VStack {
      Text("White View")
        .font(.largeTitle)
      
      Button {
        coordinator.push(.greenView)
      } label: {
        Text("Navigate : GreenView")
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
    }
    .font(.title2)
    .padding()
  }
}

#Preview {
  WhiteView()
    .environmentObject(Coordinator())
}
