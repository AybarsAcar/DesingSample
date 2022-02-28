//
//  Model.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

final class Model: ObservableObject {

  @Published var showDetail: Bool = false
  @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
  case signUp, signIn
}
