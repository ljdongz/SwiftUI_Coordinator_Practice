//
//  CoordinatorView.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

struct CoordinatorView: View {
  @StateObject private var coordinator = Coordinator()
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.buildPage(.whiteView)
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
    .environmentObject(coordinator)
    
  }
}

#Preview {
  CoordinatorView()
}
