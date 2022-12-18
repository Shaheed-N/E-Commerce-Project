//
//  ContentViewModel.swift
//  ProjectApplication
//
//  Created by Shahid on 14.12.22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var location: String = "location"
  @Published var place: String = "Zihuatanejo, Gro"
  @Published var new: Bool = true
  @Published var newScreen: Bool = false

  }
