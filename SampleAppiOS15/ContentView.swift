//
//  ContentView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 24/2/2022.
//

import SwiftUI

struct ContentView: View {
  
  @State private var selectedTab: Tab = .home
  
  var body: some View {
    ZStack(alignment: .bottom) {
      
      Group {
        switch selectedTab {
        case .home:
          HomeView()
          
        case .explore:
          AccountView()
          
        case .notifications:
          Text("NOTIFICATIONS")
          
        case .library:
          Text("LIBRARY")
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      TabBar(selectedTab: $selectedTab)
    }
    .safeAreaInset(edge: .bottom) {
      Color.clear.frame(height: 44)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
      ContentView()
        .preferredColorScheme(.dark)
    }
  }
}
