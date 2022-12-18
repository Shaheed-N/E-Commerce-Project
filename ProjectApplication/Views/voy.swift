//
//  voy.swift
//  ProjectApplication
//
//  Created by Shahid on 16.12.22.
//

import SwiftUI
class BadMode: ObservableObject {

  @Published var number = 1

  }
struct voy: View {

  @EnvironmentObject var share: BadMode

    var body: some View {
        Text("Hello, World!")
      if share.number != 0 {
        Text("0")

      }
      else {
        Text("a")
      }
    }
}

struct voy_Previews: PreviewProvider {
    static var previews: some View {
        voy()
    }
}
