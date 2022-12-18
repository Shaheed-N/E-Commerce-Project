import SwiftUI

struct NavigateView: View {
    @State private var push = false

    var body: some View {
        ZStack {
            if !push {
              HomeView(push: $push, showTabBar: .constant(true))
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }

            if push {
              DetailCarouselView(showTabBar: .constant(true), push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

struct NavigateView_Previews: PreviewProvider {
  static var previews: some View {
    NavigateView()
  }
}
