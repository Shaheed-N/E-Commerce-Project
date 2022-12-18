//
//  View2.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI

struct ContentViewB: View {

    @EnvironmentObject var viewRouter: ViewRouters

    var body: some View {
        VStack {
            HappyDog()
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = .page1
                }
            }) {
                BackButtonContent()
            }
        }
    }
}

struct ContentViewB_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewB().environmentObject(ViewRouters())
    }
}


struct HappyDog : View {
    var body: some View {
        return Image("happyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}

struct BackButtonContent : View {
    var body: some View {
        return Text("Book")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}
