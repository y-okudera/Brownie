//
//  UIViewController+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import SwiftUI
import UIKit

extension UIViewController {
    
    public func setHostingController<V: View>(swiftUIView: V) {
        let hostingController = UIHostingController(rootView: swiftUIView)
        self.addChild(hostingController)
        hostingController.didMove(toParent: self)
        self.view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.pinEdgesToSuperview()
    }
}
