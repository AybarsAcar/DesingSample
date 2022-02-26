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
  
  // transition animation variables
  @Namespace private var namespace
  @State var show: Bool = false
  
  
  var body: some View {
    ZStack {
      
      // background layer
      Color.background.ignoresSafeArea()
      
      // content
      if !show {
        ScrollView {
          scrollDetection
          
          featuredItemsSection
          
          Text("Courses".uppercased())
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
          
          CourseItem(namespace: namespace, show: $show)
            .onTapGesture {
              withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
              }
            }
        }
        .coordinateSpace(name: coordinateSpaceName)
        .safeAreaInset(edge: .top) {
          Color.clear.frame(height: 70)
        }
        .overlay(
          NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
        )
      }
      
      if show{
        CourseView(namespace: namespace, show: $show)
      }
    }
  }
}

// MARK: - components
extension HomeView {
  
  private var scrollDetection: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named(coordinateSpaceName)).minY)
      
    }
    .frame(height: 0)
    .onPreferenceChange(ScrollPreferenceKey.self, perform: { value  in
      withAnimation(.easeInOut) {
        hasScrolled = value < 0
      }
    })
  }
  
  private var featuredItemsSection: some View {
    TabView {
      ForEach(courses) { course in
        
        GeometryReader { proxy in
          
          let minX = proxy.frame(in: .global).minX
          
          FeaturedItem(course: course)
            .padding(.vertical, 40)
            .rotation3DEffect(.degrees(minX / -20), axis: (x: 0, y: 1, z: 0))
            .shadow(color: .shadow.opacity(0.3), radius: 10, x: 0, y: 10)
            .blur(radius: abs(minX / 60))
            .overlay(
              Image(course.image)
                .resizable()
                .scaledToFit()
                .frame(height: 230)
                .offset(x: 32, y: -80)
                .offset(x: minX / 3)
            )
        }
        
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
    .frame(height: 430)
    .background(
      Image("Blob 1").offset(x: 250, y: -100)
    )
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
