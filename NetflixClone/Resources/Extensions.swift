//
//  Extensions.swift
//  NetflixClone
//
//  Created by Sharmaji on 19/11/24.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
