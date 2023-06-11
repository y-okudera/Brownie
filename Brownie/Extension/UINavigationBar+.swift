//
//  UINavigationBar+.swift
//  Brownie
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ExtensionCompatible
import UIKit

extension Extension where Base: UINavigationBar {

    /// Disable UINavigation bar transparent
    static func disableTransparent() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}
