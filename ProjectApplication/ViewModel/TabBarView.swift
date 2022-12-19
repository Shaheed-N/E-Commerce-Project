//
//  Tabbar.swift
//  ProjectApplication
//
//  Created by Shahid on 14.12.22.
//

import SwiftUI

class ViewRouter: ObservableObject {

    @Published var currentPage: Page = .home

}
enum Page {
    case home
    case bag
    case favorite
    case user
}

enum Pagee {
    case page1
    case page2
}


