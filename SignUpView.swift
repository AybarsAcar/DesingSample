//
//  SignUpView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 27/2/2022.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 16) {
        Text("Sign up")
          .font(.largeTitle.bold())
        
        Text("Access 120+ hours of courses, tutorials and livestreams")
          .font(.headline)
        
        Button {
          
        } label: {
          Text("Create an account")
            .frame(maxWidth: .infinity)
            .font(.headline)
        }
        .buttonStyle(.angular)
        .tint(.accentColor)
        .controlSize(.large)
        
        Text("by clicking on *Create an account*, you agree to our **Terms of Service** and **[Privacy Policy](https://google.com)**")
          .font(.footnote)
          .foregroundColor(.secondary)
          .tint(.primary.opacity(0.8))
        
        Divider()
        
        HStack {
          Text("Already have an acccount?")
            .font(.footnote)
            .foregroundColor(.secondary)

          Button {
            
          } label: {
            Text("Sign in")
              .bold()
          }
          .font(.footnote)

        }

      }
      .padding(20)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
      .withStrokeStyle(cornerRadius: 30)
      .shadow(color: .shadow.opacity(0.2), radius: 30, x: 0, y: 30)
      .padding(20)
      .background(
        Image("Blob 1")
          .offset(x: 200, y: -100)
      )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
