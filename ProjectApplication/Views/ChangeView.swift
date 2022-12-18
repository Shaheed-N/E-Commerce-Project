//
//  ChangeView.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI

struct ChangeView: View {


  @Binding var showTabBar: Bool
  @EnvironmentObject var router: Router

  var body: some View {
      switch router.current {
      case .page1:
        DetailCarouselView(showTabBar: $showTabBar)

      case .page2:
        CartView(showTabBar: $showTabBar)
              .transition(.scale)


      }
  }
}

struct ChangeView_Previews: PreviewProvider {
    static var previews: some View {
      ChangeView(showTabBar: .constant(true)).environmentObject(Router())

    }
}


