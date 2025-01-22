//
//  MainView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 1/20/25.
//

import SwiftUI

struct HomeView: View {
  @Environment(Coordinator.self) private var coordinator
  var body: some View {
    Text("Home View")
      .font(.title)
    
    Button {
      coordinator.push(.profile)
    } label: {
      Text("프로필")
    }
    
    Button {
      coordinator.push(.profile)
    } label: {
      Text("DM")
    }
    
    Button {
      coordinator.presentCover(.comment)
    } label: {
      Text("댓글")
    }
    
    Button {
      coordinator.presentSheet(.like)
    } label: {
      Text("좋아요")
    }
  }
}

#Preview {
  AppCoordinatorView(view: .message)
}
