//
//  ContentView.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import SwiftUI

struct CoordinatorView: View {
  @State private var coordinator = Coordinator()
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      Group {
        switch coordinator.root {
        case .onboarding:
          coordinator.buildPage(page: .onboarding)
        case .main:
          coordinator.buildPage(page: .main)
        }
      }
      .onOpenURL { url in
        coordinator.presentSheetFromWidget(.forgotPassword(id: "test"))
      }
      .navigationDestination(for: AppPage.self) { page in
        coordinator.buildPage(page: page)
      }
      .sheet(item: $coordinator.sheet) { sheet in
        coordinator.buildSheet(sheet: sheet)
      }
    }
    .environment(coordinator)
  }
}

#Preview {
  CoordinatorView()
}
