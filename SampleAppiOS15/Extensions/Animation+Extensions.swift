//
//  Animation+Extensions.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import Foundation
import SwiftUI

extension Animation {
  static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
  static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.8)
}
