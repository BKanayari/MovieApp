//
//  Extensions.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/04/24.
//

import Foundation

extension String {
  func capitalizeFirstLetter() -> String {
    return self.prefix(1).uppercased() + self.lowercased().dropFirst()
  }
}
