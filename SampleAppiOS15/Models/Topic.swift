//
//  Topic.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 11/3/2022.
//

import SwiftUI

struct Topic: Identifiable {
  let id: UUID = .init()
  let title: String
  let icon: String
}

var topics = [
  Topic(title: "iOS Development", icon: "iphone"),
  Topic(title: "UI Design", icon: "eyedropper"),
  Topic(title: "Web Development", icon: "laptopcomputer")
]
