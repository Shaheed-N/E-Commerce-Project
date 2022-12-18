//
//  DetailView.swift
//  ProjectApplication
//
//  Created by Shahid on 15.12.22.
//

import SwiftUI

struct ProductsView: View {

  @StateObject var viewRouter: NextView

    var body: some View {
      
      switch viewRouter.currentPage {
        case .page1:
            BestSellerView(viewRouter: viewRouter)
        case .page2:
            DetailView(viewRouter: viewRouter)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
      ProductsView(viewRouter: NextView())
    }
}
enum Pagess {
    case page1
    case page2
}
