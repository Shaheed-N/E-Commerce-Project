//File: ContentViewA.swift
//Project: NavigatinInSwiftUIStarter
//Created on 24.08.20
//Visit www.BLCKBIRDS.com for more tutorials.

import SwiftUI

struct ContentViewA: View {
    
    @StateObject var viewRouter: NextView
    
    var body: some View {
      
            Button(action: {
                viewRouter.currentPage = .page2
            }) {
                NextButtonContent()
            }

    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA(viewRouter: NextView())
    }
}
struct Glummy : View {
    var body: some View {
        return Image("person")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
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



