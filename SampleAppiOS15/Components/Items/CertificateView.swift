//
//  CertificateView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 14/3/2022.
//

import SwiftUI

struct CertificateView: View {
  
  var body: some View {
    
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 8) {
        Text("SwiftUI for iOS 15")
          .font(.title3.weight(.semibold))
        
        Text("Certificate")
          .font(.subheadline.weight(.medium))
      }
      
      Spacer()
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Feb 25, 2022".uppercased())
          .font(.footnote.weight(.semibold))
        
        Text("Instrutor: Aybars Acar")
          .font(.footnote.weight(.medium))
      }
      .foregroundStyle(.secondary)
      
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .overlay {
      Image("Logo 2")
        .resizable()
        .scaledToFit()
        .frame(width: 26, height: 26)
        .cornerRadius(10)
        .padding(9)
        .background(Color(uiColor: UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .withStrokeStyle(cornerRadius: 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    .padding(20)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .withStrokeStyle(cornerRadius: 30)
  }
}

struct CertificateView_Previews: PreviewProvider {
  static var previews: some View {
    CertificateView()
      .previewLayout(.fixed(width: 500, height: 300))
      .padding()
  }
}
