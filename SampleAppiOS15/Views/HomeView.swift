//
//  HomeView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct HomeView: View {
  
  private let coordinateSpaceName: String = "scroll"
  
  @State private var hasScrolled: Bool = false
  
  var body: some View {
    ScrollView {
      
      GeometryReader { proxy in
        Color.clear
          .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named(coordinateSpaceName)).minY)
      }
      .frame(height: 0)
      
      FeaturedItem()
      
    }
    .coordinateSpace(name: coordinateSpaceName)
    .onPreferenceChange(ScrollPreferenceKey.self, perform: { value  in
      withAnimation(.easeInOut) {
        hasScrolled = value < 0
      }
    })
    .safeAreaInset(edge: .top) {
      Color.clear.frame(height: 70)
    }
    .overlay(
      NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
    )
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
