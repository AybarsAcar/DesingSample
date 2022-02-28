//
//  SignInView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 28/2/2022.
//

import SwiftUI

struct SignInView: View {
  
  @EnvironmentObject private var model: Model
  
  @State private var email: String = ""
  @State private var password: String = ""
  
  @FocusState private var focusField: Field?
  @State private var circleY: CGFloat = 120
  
  @State private var emailY: CGFloat = 0
  @State private var passwordY: CGFloat = 0
  
  @State private var circleColor: Color = .blue
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Sign in")
        .font(.largeTitle.bold())
      
      Text("Access 120+ hours of courses, tutorials and livestreams")
        .font(.headline)
      
      TextField("Email", text: $email)
        .withInputStyle(systemIcon: "mail")
        .textContentType(.emailAddress)
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .focused($focusField, equals: .email)
        .shadow(color: focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
        .overlay(geometry)
        .onPreferenceChange(CirclePreferenceKey.self) { value in
          emailY = value
          circleY = value
        }
      
      SecureField("Password", text: $password)
        .withInputStyle(systemIcon: "lock")
        .textContentType(.password)
        .focused($focusField, equals: .password)
        .shadow(color: focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
        .overlay(geometry)
        .onPreferenceChange(CirclePreferenceKey.self) { value in
          passwordY = value
        }
      
      Button {
        
      } label: {
        Text("Sign in")
          .frame(maxWidth: .infinity)
          .font(.headline)
      }
      .buttonStyle(.angular)
      .tint(.accentColor)
      .controlSize(.large)
      .shadow(color: .shadow.opacity(0.2), radius: 30, x: 0, y: 30)

      
      Divider()
      
      HStack {
        Text("Don't have an account?")
          .font(.footnote)
          .foregroundColor(.secondary)
        
        Button {
          model.selectedModal = .signUp
        } label: {
          Text("Sign up!")
            .bold()
        }
        .font(.footnote)
        
      }
      
    }
    .padding(20)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .background(
      Circle()
        .fill(circleColor)
        .frame(width: 68, height: 68)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .offset(y: circleY)
    )
    .coordinateSpace(name: "container")
    .withStrokeStyle(cornerRadius: 30)
    .onChange(of: focusField) { value in
      withAnimation(.spring()) {
        circleY = value == .email ? emailY : passwordY
        circleColor = value == .email ? .blue : .purple
      }
    }
  }
}

// MARK: - Components
extension SignInView {
  private var geometry: some View {
    GeometryReader { proxy in
      Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
    }
  }
}

extension SignInView {
  enum Field: Hashable {
    case email, password
  }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        SignInView()
          .environmentObject(Model())
      }
    }
}
