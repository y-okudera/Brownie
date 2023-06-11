//
//  QiitaSearchViewController.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import PresentationInterface
import UIKit

final class QiitaSearchViewController: UIViewController {

    var presenter: QiitaSearchPresenterInput!
    var viewData: QiitaSearchViewData!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setHostingController(
            swiftUIView: QiitaSearchScreenView(
                delegate: self,
                presenter: presenter,
                viewData: viewData
            )
        )
    }
}

extension QiitaSearchViewController: QiitaSearchScreenViewDelegate {

    func qiitaSearchScreenView(_ qiitaSearchScreenView: QiitaSearchScreenView, didSetTitle title: String) {
        self.navigationItem.title = self.viewData.title
    }
}
