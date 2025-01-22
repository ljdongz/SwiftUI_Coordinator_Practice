//
//  AppCoordinatorView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 1/20/25.
//

import SwiftUI

struct AppCoordinatorView: View {
  @State private var coordinator = Coordinator()
  
  private let root: Coordinator.AppPage
  
  init(view: Coordinator.AppPage = .home) {
    self.root = view
  }
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.buildPage(root)
        .navigationDestination(for: Coordinator.AppPage.self) { page in
          coordinator.buildPage(page)
        }
        .sheet(item: $coordinator.sheet) { sheet in
          coordinator.buildSheet(sheet)
        }
        .fullScreenCover(item: $coordinator.cover) { cover in
          coordinator.buildCover(cover)
        }
    }
    .environment(coordinator)
  }
}

#Preview {
  AppCoordinatorView()
}
