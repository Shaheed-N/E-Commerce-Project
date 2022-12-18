//
//  Change.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI

struct Change: View {
  @State private var push = false
  @Binding var showTabBar: Bool

  @State var selectedIndex = 0

    var body: some View {
      
      ZStack {
                if !push {
                  CartView(push: $push, showTabBar: $showTabBar)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                }

                if push {
                  Main(selectedIndex: 3, push: $push)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                }
            }

    }
}

struct Change_Previews: PreviewProvider {
    static var previews: some View {
      Change(showTabBar: .constant(true))
    }
}
