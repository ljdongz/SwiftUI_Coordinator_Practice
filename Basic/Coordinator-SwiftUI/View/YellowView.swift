//
//  YellowView.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

struct YellowView: View {
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    ZStack {
      Color.yellow.ignoresSafeArea()
      
      VStack {
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
        
        Button {
          coordinator.popToRoot()
        } label: {
          Text("Back to root")
        }
      }
      .font(.title2)
    }
    
  }
}

#Preview {
  YellowView()
    .environmentObject(Coordinator())
}

