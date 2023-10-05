//
//  UINavigationController.swift
//  Movies
//
//  Created by Polina Tolstenkova on 02.10.2023.
//

import Foundation
import UIKit

extension UINavigationController {
    func setUpAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
        self.navigationBar.tintColor = .black
        UIBarButtonItem.appearance().tintColor = .black
    }
}
