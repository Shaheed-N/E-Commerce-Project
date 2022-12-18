//
//  Any.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI


struct MotherView: View {


  @Binding var showTabBar: Bool
  @EnvironmentObject var viewRouter: ViewRouters

  var body: some View {
      switch viewRouter.currentPage {
      case .page1:
        BagView(showTabBar: $showTabBar)

          .navigationBarBackButtonHidden(true)

      case .page2:
        Main(showTabBar: $showTabBar)
              .transition(.scale)
     

      }
  }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
      MotherView(showTabBar: .constant(true)).environmentObject(ViewRouters())
      
    }
}


