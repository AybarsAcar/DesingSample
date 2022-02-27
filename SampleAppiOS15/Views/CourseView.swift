//
//  CourseView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct CourseView: View {
  
  @EnvironmentObject private var model: Model
  
  let course: Course
  
  // animation variables
  let namespace: Namespace.ID
  @Binding var show: Bool
  
  // used for chaining animations
  @State private var appear: [Bool] = [false, false, false]
  
  @State private var viewState: CGSize = .zero
  
  @State private var isDraggable: Bool = true
  
  var body: some View {
    
    ZStack {
      ScrollView(.vertical, showsIndicators: false) {
        cover
        
        content
          .offset(y: 120)
          .padding(.bottom, 200)
          .opacity(appear[2] ? 1 : 0)
      }
      .coordinateSpace(name: "scroll")
      .onAppear {
        model.showDetail = true
      }
      .onDisappear {
        model.showDetail = false
      }
      .background(Color.background)
      .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
      .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
      .scaleEffect(viewState.width / -500 + 1)
      .background(.black.opacity(viewState.width / 500))
      .background(.ultraThinMaterial)
      .gesture(isDraggable ? dragGesture : nil)
      
      closeButton
    }
    .statusBar(hidden: true)
    .ignoresSafeArea()
    .onAppear {
      fadeInSequentially()
    }
    .onChange(of: show) { newValue in
      fadeOut()
    }
  }
}

// MARK: - Components
extension CourseView {
  
  private var cover: some View {
    GeometryReader { proxy in
      
      let scrollY = proxy.frame(in: .named("scroll")).minY
      
      VStack {
        Spacer()
      }
      .frame(maxWidth: .infinity)
      .frame(height: scrollY > 0 ? 500 + scrollY : 500)
      .foregroundStyle(.black)
      .background(
        Image(course.image)
          .resizable()
          .scaledToFit()
          .padding(20)
          .frame(maxWidth: 500)
          .matchedGeometryEffect(id: AnimationID.configure(.imageID, for: course.id.uuidString), in: namespace)
          .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
      )
      .padding(20)
      .background(
        Image(course.background)
          .resizable()
          .scaledToFill()
          .matchedGeometryEffect(id: AnimationID.configure(.backgroundID, for: course.id.uuidString), in: namespace)
          .offset(y: scrollY > 0 ? -scrollY : 0)
          .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
          .blur(radius: scrollY > 0 ? scrollY / 20 : 0)
      )
      .mask(
        RoundedRectangle(cornerRadius: appear[0] ? 0 : 30, style: .continuous)
          .matchedGeometryEffect(id: AnimationID.configure(.maskID, for: course.id.uuidString), in: namespace)
          .offset(y: scrollY > 0 ? -scrollY : 0)
      )
      .overlay(
        overlayContent
          .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
      )
    }
    .frame(height: 500)
  }
  
  private var overlayContent: some View {
    VStack(alignment: .leading, spacing: 12) {
      
      Text(course.title)
        .font(.largeTitle.weight(.bold))
        .matchedGeometryEffect(id: AnimationID.configure(.titleID, for: course.id.uuidString), in: namespace)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(course.subtitle.uppercased())
        .font(.footnote.weight(.semibold))
        .matchedGeometryEffect(id: AnimationID.configure(.subtitleID, for: course.id.uuidString), in: namespace)
      
      Text(course.text)
        .font(.footnote)
        .matchedGeometryEffect(id: AnimationID.configure(.textID, for: course.id.uuidString), in: namespace)
      
      Divider()
        .opacity(appear[0] ? 1 : 0)
      
      HStack {
        Image("Avatar Default")
          .resizable()
          .frame(width: 26, height: 26)
          .cornerRadius(10)
          .padding(8)
          .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
          .withStrokeStyle(cornerRadius: 18)
        
        Text("Taught by Aybars Acar")
          .font(.footnote)
      }
      .opacity(appear[1] ? 1 : 0)
    }
      .padding(20)
      .background(
        Rectangle()
          .fill(.ultraThinMaterial)
          .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
          .matchedGeometryEffect(id: AnimationID.configure(.blurID, for: course.id.uuidString), in: namespace)
      )
      .offset(x: 0, y: 250)
      .padding(20)
    
  }
  
  private var closeButton: some View {
    
    Button {
      withAnimation(.closeCard) {
        show.toggle()
        model.showDetail.toggle()
      }
    } label: {
      Image(systemName: "xmark")
        .font(.body.weight(.bold))
        .foregroundColor(.secondary)
        .padding(8)
        .background(.ultraThinMaterial, in: Circle())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    .padding(20)
  }
  
  private var content: some View {
    
    VStack(alignment: .leading, spacing: 30) {
      Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
        .font(.title3).fontWeight(.medium)
      Text("This course")
        .font(.title).bold()
      Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
      Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
      Text("Multiplatform app")
        .font(.title).bold()
      Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
    }
    .padding(20)
  }
  
  private var dragGesture: some Gesture {
    DragGesture(minimumDistance: 30, coordinateSpace: .local)
      .onChanged { value in
        // only allow swipe from left to right
        // and only at the left edge
        guard
          value.translation.width > 0,
          value.startLocation.x < 60
        else { return }
        
        withAnimation(.closeCard) {
          viewState = value.translation
        }
        
        if viewState.width > 140 {
          close()
        }
      }
      .onEnded{ value in
        if viewState.width > 100 {
          // dismiss the view
          close()
        }
        else {
          withAnimation(.easeInOut) {
            viewState = .zero
          }
        }
      }
  }
}

// MARK: - member functions
extension CourseView {
  
  private func fadeInSequentially() {
    for i in 0..<appear.count {
      withAnimation(.easeOut.delay(0.3 + Double(i) / 10)) {
        appear[i] = true
      }
    }
  }
  
  private func fadeOut() {
    appear = appear.map { item in return false }
  }
  
  private func close() {
    // dismiss the view
    withAnimation(.closeCard.delay(0.3)) {
      show.toggle()
      model.showDetail.toggle()
    }
    
    withAnimation(.easeInOut) {
      viewState = .zero
    }
    
    isDraggable = false
  }
}

struct CourseView_Previews: PreviewProvider {
  @Namespace static var namespace
  static var previews: some View {
    CourseView(course: courses[0],namespace: namespace, show: .constant(true))
      .environmentObject(Model())
  }
}
