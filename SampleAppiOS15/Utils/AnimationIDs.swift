//
//  AnimationIDs.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import Foundation

struct AnimationID {
  private init() { }
  
  enum AnimationComponent: String {
    case titleID = "title_id"
    case subtitleID = "subtitle_id"
    case backgroundID = "background_id"
    case textID = "text_id"
    case maskID = "mask_id"
    case imageID = "image_id"
    case blurID = "blur_id"
  }
  
  static func configure(_ component: AnimationComponent, for id: String) -> String {
    return "\(component.rawValue)\(id)"
  }
}


