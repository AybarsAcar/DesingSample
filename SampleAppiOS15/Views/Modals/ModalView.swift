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
  
  @State private var viewTranslation: CGSize = .zero

  var body: some View {
    ZStack {
      
      Color.clear
        .background(.regularMaterial)
        .ignoresSafeArea()

      
      Group {
        switch model.selectedModal {
        case .signUp: SignUpView()
        case .signIn: SignInView()
        }
      }
      .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .offset(x: viewTranslation.width, y: viewTranslation.height)
      .rotationEffect(.degrees(viewTranslation.width / 40))
      .rotation3DEffect(.degrees(viewTranslation.height / 40), axis: (x: 1, y: 0, z: 0))
      .hueRotation(.degrees(viewTranslation.width / 5))
      .gesture(drag)
      .shadow(color: .shadow.opacity(0.2), radius: 30, x: 0, y: 30)
      .padding(20)
      .background(
        Image("Blob 1")
          .offset(x: 200, y: -100)
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
        withAnimation(.openCard) {
          viewTranslation = .zero
        }
      }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView()
      .environmentObject(Model())
  }
}
