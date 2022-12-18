//
//  View1.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI

struct ContentViewA: View {

    @EnvironmentObject var viewRouter: ViewRouters

    var body: some View {
        VStack {
            GrumpyDog()
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = .page2
                }
            }) {
                NextButtonContent()
            }
        }
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA().environmentObject(ViewRouters())
    }
}



struct NextButtonContent : View {
    var body: some View {
        Text("Next")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

struct GrumpyDog : View {
    var body: some View {
        Image("bag")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}


