//
//  TabBar.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct TabBar: View {
  
  @State private var selectedTab: Tab = .home
  @State private var tabBarBgColor: Color = .teal
  
  @State private var tabItemWidth: CGFloat = 0
  
  var body: some View {
    
    ZStack(alignment: .bottom) {
      
      Group {
        switch selectedTab {
        case .home:
          ContentView()
          
        case .explore:
          AccountView()

        case .notifications:
          Text("NOTIFICATIONS")

        case .library:
          Text("LIBRARY")
        }
      }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

     

      HStack {
        tabButtons
      }
      .padding(.horizontal, 8)
      .padding(.top, 14)
      .frame(height: 88, alignment: .top)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
      .background(tabBarBg)
      .overlay(tabBarOverlay)
      .withStrokeStyle()
      .frame(maxHeight: .infinity, alignment: .bottom)
      .ignoresSafeArea()
    }
  }
}

// MARK: - components
extension TabBar {
  
  private var tabButtons: some View {
    ForEach(tabItems) { item in
      
      Button(action: {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
          selectedTab = item.tab
          tabBarBgColor = item.color
        }
      }) {
        VStack(spacing: 0) {
          Image(systemName: item.icon)
            .symbolVariant(.fill)
            .font(.body.bold())
            .frame(width: 80, height: 29)
          
          
          Text(item.text)
            .font(.caption2)
            .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
      }
      .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
      .blendMode(selectedTab == item.tab ? .overlay : .normal)
      .overlay(
        // publish the size of the tab bar item
        GeometryReader { proxy in
          Color.clear
            .preference(key: TabPreferenceKey.self, value: proxy.size.width)
        }
      )
      // listen to the tab size changes and store the updated value
      .onPreferenceChange(TabPreferenceKey.self) { value in
        tabItemWidth = value
      }
      
    }
  }
  
  private var tabBarBg: some View {
    HStack {
      
      if selectedTab == .library { Spacer() }
      if selectedTab == .explore { Spacer() }
      if selectedTab == .notifications {
        Spacer()
        Spacer()
      }
      
      Circle()
        .fill(tabBarBgColor)
        .frame(width: tabItemWidth)
      
      if selectedTab == .home { Spacer() }
      if selectedTab == .notifications { Spacer() }
      if selectedTab == .explore {
        Spacer()
        Spacer()
      }
    }
      .padding(.horizontal, 8)
  }
  
  private var tabBarOverlay: some View {
    HStack {
      
      if selectedTab == .library { Spacer() }
      if selectedTab == .explore { Spacer() }
      if selectedTab == .notifications {
        Spacer()
        Spacer()
      }
      
      Rectangle()
        .fill(tabBarBgColor)
        .frame(width: 28, height: 5)
        .cornerRadius(3)
        .frame(width: tabItemWidth)
        .frame(maxHeight: .infinity, alignment: .top)
      
      if selectedTab == .home { Spacer() }
      if selectedTab == .explore {
        Spacer()
        Spacer()
      }
      if selectedTab == .notifications { Spacer() }
      
    }
      .padding(.horizontal, 8)
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}
