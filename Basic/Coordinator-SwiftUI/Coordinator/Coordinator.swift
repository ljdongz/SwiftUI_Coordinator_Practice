//
//  Coordinator.swift
//  Coordinator-SwiftUI
//
//  Created by 이정동 on 1/21/25.
//

import SwiftUI

final class Coordinator: ObservableObject {
  enum AppPage: Hashable {
    case whiteView
    case yellowView
    case greenView
  }
  
  enum Sheet: Identifiable {
    case blueSheet
    
    var id: String {
      String(describing: self)
    }
  }
  
  enum Cover: Identifiable {
    case redCover
    
    var id: String {
      String(describing: self)
    }
  }
  
  @Published var path: [AppPage] = []
  @Published var sheet: Sheet?
  @Published var cover: Cover?
}

extension Coordinator {
  // MARK: - Navigation Method
  func push(_ page: AppPage) {
    self.path.append(page)
  }
  
  func pop() {
    self.path.removeLast()
  }
  
  func popToRoot() {
    self.path.removeAll()
  }
  
  // MARK: - Sheet Method
  func presentSheet(_ sheet: Sheet) {
    self.sheet = sheet
  }
  
  func dismissSheet() {
    self.sheet = nil
  }
  
  // MARK: - FullScreenCover Method
  func presentCover(_ cover: Cover) {
    self.cover = cover
  }
  
  func dismissCover() {
    self.cover = nil
  }
}

extension Coordinator {
  @ViewBuilder
  func buildPage(_ page: AppPage) -> some View {
    switch page {
    case .whiteView:
      WhiteView()
    case .yellowView:
      YellowView()
    case .greenView:
      GreenView()
    }
  }
  
  @ViewBuilder
  func buildSheet(_ sheet: Sheet) -> some View {
    switch sheet {
    case .blueSheet:
      BlueView()
    }
  }
  
  @ViewBuilder
  func buildCover(_ cover: Cover) -> some View {
    switch cover {
    case .redCover:
      RedView()
    }
  }
}
