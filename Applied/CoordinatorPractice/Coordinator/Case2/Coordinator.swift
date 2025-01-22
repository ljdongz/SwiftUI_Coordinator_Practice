//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 1/20/25.
//

import Foundation
import SwiftUI

typealias CoordinatorProtocol = Navigatable & SheetPresentable & FullScreenCoverPresentable

@Observable
final class Coordinator: CoordinatorProtocol {
  enum AppPage: Hashable {
    case home
    case profile
    case message
  }
  
  enum Sheet: Identifiable {
    case like
    case comment
    
    // 모든 유형의 인스턴스를 String 표현으로 변환
    var id: String { String(describing: self) }
  }
  
  enum Cover: Identifiable {
    case like
    case comment
    
    var id: String { String(describing: self) }
  }
  
  var path: [AppPage] = []
  var sheet: Sheet?
  var cover: Cover?
  
  func push(_ page: AppPage) {
    self.path.append(page)
  }
  
  func pop() {
    self.path.removeLast()
  }
  
  func popToRoot() {
    self.path.removeAll()
  }
  
  func presentSheet(_ sheet: Sheet) {
    self.sheet = sheet
  }
  
  func dismissSheet() {
    self.sheet = nil
  }
  
  func presentCover(_ cover: Cover) {
    self.cover = cover
  }
  
  func dismissCover() {
    self.cover = nil
  }
  
  func buildPage(_ page: AppPage) -> some View {
    switch page {
    case .home:
      HomeView()
    case .profile:
      ProfileView()
    case .message:
      MessageView()
    }
  }
  
  func buildSheet(_ sheet: Sheet) -> some View {
    switch sheet {
    case .like:
      LikeView()
    case .comment:
      CommentView()
    }
  }
  
  func buildCover(_ cover: Cover) -> some View {
    switch cover {
    case .like:
      LikeView()
    case .comment:
      CommentView()
    }
  }
}

