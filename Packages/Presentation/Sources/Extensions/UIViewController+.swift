//
//  UIViewController+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ExtensionCompatible
import SwiftUI
import UIKit

extension UIViewController: ExtensionCompatible {}

extension Extension where Base: UIViewController {
    
    public func setHostingController<V: View>(swiftUIView: V) {
        let hostingController = UIHostingController(rootView: swiftUIView)
        base.addChild(hostingController)
        hostingController.didMove(toParent: base)
        base.view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.ex.pinEdgesToSuperview()
    }
}
