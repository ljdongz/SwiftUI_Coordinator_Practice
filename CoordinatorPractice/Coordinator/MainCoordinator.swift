//
//  MainCoordinator.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/20/24.
//

import Foundation
import SwiftUI

typealias MainCoordinatorProtocol = Navigatable & SheetPresentable
typealias MainPage = MainCoordinator.AppPage

@Observable
final class MainCoordinator: MainCoordinatorProtocol {
  enum AppPage: Hashable {
    case main
    case login(date: Date)
  }
  
  enum Sheet: Identifiable {
    case forgotPassword(id: String)
    var id: String { UUID().uuidString }
  }
  
  var path: [AppPage] = []
  var sheet: Sheet?
  
  func push(_ page: AppPage) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeAll()
  }
  
  func presentSheet(_ sheet: Sheet) {
    self.sheet = sheet
  }
  
  func dismissSheet() {
    self.sheet = nil
  }
  
  func buildPage(_ page: AppPage) -> some View {
    switch page {
    case .main:
      MainView()
    case .login(let date):
      LoginView(date: date)
    }
  }
  
  func buildSheet(_ sheet: Sheet) -> some View {
    switch sheet {
    case .forgotPassword(let id):
      ForgotPasswordView(id: id)
    }
  }
}
