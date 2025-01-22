//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by 이정동 on 12/18/24.
//

import Foundation
import SwiftUI

protocol Navigatable {
  associatedtype AppPage: Hashable
  associatedtype AppPageView: View
  
  var path: [AppPage] { get set }
  
  func push(_ page: AppPage)
  func pop()
  func popToRoot()
  
  @ViewBuilder
  func buildPage(_ page: AppPage) -> AppPageView
}

protocol SheetPresentable {
  associatedtype Sheet: Identifiable
  associatedtype SheetView: View
  
  var sheet: Sheet? { get set }
  
  func presentSheet(_ sheet: Sheet)
  func dismissSheet()
  
  @ViewBuilder
  func buildSheet(_ sheet: Sheet) -> SheetView
}

protocol FullScreenCoverPresentable {
  associatedtype Cover: Identifiable
  associatedtype CoverView: View
  
  var cover: Cover? { get set }
  
  func presentCover(_ cover: Cover)
  func dismissCover()
  
  @ViewBuilder
  func buildCover(_ cover: Cover) -> CoverView
}
