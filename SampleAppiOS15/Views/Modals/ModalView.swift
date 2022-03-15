//
//  ModalView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 28/2/2022.
//

import SwiftUI

struct ModalView: View {
  
  @EnvironmentObject private var model: Model
  @AppStorage("showModal") private var showModal: Bool = false
  @AppStorage("isLogged") private var isLogged: Bool = false

  @State private var viewTranslation: CGSize = .zero
  
  @State private var isViewDismissed: Bool = false
  
  @State private var appear: [Bool] = [false, false, false]

  var body: some View {
    ZStack {
      
      Color.clear
        .background(.regularMaterial)
        .onTapGesture {
          dismissViewWithAnimation()
        }
        .ignoresSafeArea()

      
      Group {
        switch model.selectedModal {
        case .signUp: SignUpView()
        case .signIn: SignInView()
        }
      }
      .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .offset(x: viewTranslation.width, y: viewTranslation.height)
      .offset(y: isViewDismissed ? 1000 : 0)
      .rotationEffect(.degrees(viewTranslation.width / 40))
      .rotation3DEffect(.degrees(viewTranslation.height / 40), axis: (x: 1, y: 0, z: 0))
      .hueRotation(.degrees(viewTranslation.width / 5))
      .gesture(drag)
      .shadow(color: .shadow.opacity(0.2), radius: 30, x: 0, y: 30)
      .opacity(appear[0] ? 1 : 0)
      .offset(y: appear[0] ? 0 : 200)
      .padding(20)
      .background(
        Image("Blob 1")
          .offset(x: 200, y: -100)
          .opacity(appear[2] ? 1 : 0)
          .offset(y: appear[2] ? 0 : 10)
          .blur(radius: appear[2] ? 0 : 40)
          .allowsHitTesting(false)
          .accessibility(hidden: true)
      )
      
      Button {
        withAnimation {
          showModal = false
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
      .opacity(appear[1] ? 1 : 0)
      .offset(y: appear[1] ? 0 : -200)

    }
    .onAppear {
      withAnimation(.easeOut) {
        appear[0] = true
      }
      withAnimation(.easeOut.delay(0.1)) {
        appear[1] = true
      }
      withAnimation(.easeOut(duration: 1).delay(0.2)) {
        appear[2] = true
      }
    }
    .onChange(of: isLogged) { value in
      if value {
        dismissViewWithAnimation()
      }
    }
  }
}

extension ModalView {
  
  var drag: some Gesture {
    DragGesture()
      .onChanged { value in
        viewTranslation = value.translation
      }
      .onEnded { value in
        
        if value.translation.height > 200 {
         dismissViewWithAnimation()
        }
        else {
          withAnimation(.openCard) {
            viewTranslation = .zero
          }
        }
      }
  }
  
  // MARK: - member functions
  private func dismissViewWithAnimation() {
    withAnimation {
      isViewDismissed = true
    }
    withAnimation(.linear.delay(0.3)) {
      showModal = false
    }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView()
      .environmentObject(Model())
  }
}
