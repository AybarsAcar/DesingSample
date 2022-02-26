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
  @State private var show: Bool = false
  
  @State private var selectedID: UUID = UUID()
  
  
  var body: some View {
    ZStack {
      
      // background layer
      Color.background.ignoresSafeArea()
      
      // content
      
      ScrollView(.vertical, showsIndicators: false) {
        scrollDetection
        
        featuredItemsSection
        
        Text("Courses".uppercased())
          .font(.footnote.weight(.semibold))
          .foregroundColor(.secondary)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 20)
        
        if !show {
          cards
        }
        else {
          // replaces the card as we go onto the detail view
          // this is like a placeholder view - so the scrollview stays in its place
          cardPlaceholders
        }
      }
      .coordinateSpace(name: coordinateSpaceName)
      .safeAreaInset(edge: .top) {
        Color.clear.frame(height: 70)
      }
      .overlay(
        NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
      )
      
      if show{
        courseDetails
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
      ForEach(featuredCourses) { course in
        
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
  
  private var cards: some View {
    ForEach(courses) { item in
      CourseItem(course: item, namespace: namespace, show: $show)
        .onTapGesture {
          withAnimation(.openCard) {
            show.toggle()
            selectedID = item.id
          }
        }
    }
  }
  
  private var cardPlaceholders: some View {
    ForEach(courses) { _ in
      Rectangle()
        .fill(.white)
        .frame(height: 300)
        .cornerRadius(30)
        .shadow(color: .shadow, radius: 20, x: 0, y: 10)
        .opacity(0.3)
        .padding(.horizontal, 30)
    }
  }
  
  private var courseDetails: some View {
    ForEach(courses) { item in
      if item.id == selectedID {
        CourseView(course: item, namespace: namespace, show: $show)
          .zIndex(1)
          .transition(
            .asymmetric(
              insertion: .opacity.animation(.easeInOut(duration: 0.1)),
              removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
            )
          )
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
