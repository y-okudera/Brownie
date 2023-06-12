//
//  QiitaSearchViewController.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Entity
import Extensions
import PresentationInterface
import UIKit

final class QiitaSearchViewController: UIViewController {

    var presenter: QiitaSearchPresenterInput!
    var viewData: QiitaSearchViewData!
    var component: QiitaSearchScreenComponent!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ex.setHostingController(
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

    func qiitaSearchScreenView(_ qiitaSearchScreenView: QiitaSearchScreenView, didSelectItem item: Item) {
        self.navigationController?.pushViewController(component.qiitaSearchScreenBuilder().makeViewController(), animated: true)
    }
}
