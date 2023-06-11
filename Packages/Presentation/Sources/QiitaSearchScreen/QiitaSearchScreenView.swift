//
//  QiitaSearchScreenView.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import SwiftUI

protocol QiitaSearchScreenViewDelegate: AnyObject {
    func qiitaSearchScreenView(
        _ qiitaSearchScreenView: QiitaSearchScreenView,
        didSetTitle title: String
    )
}

struct QiitaSearchScreenView: View {

    weak var delegate: QiitaSearchScreenViewDelegate?
    var presenter: QiitaSearchPresenterInput
    @ObservedObject var viewData: QiitaSearchViewData

    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("Hello, World!")
        }
        .onAppear {
            Task {
                await self.presenter.onAppear()
            }
        }
        .onChange(of: self.viewData.title) {
            self.delegate?.qiitaSearchScreenView(self, didSetTitle: $0)
        }
        .onChange(of: self.viewData.dataList) {
            print($0)
        }
    }
}

//struct QiitaSearchScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        QiitaSearchScreenView(
//            presenter: QiitaSearchPresenter(
//                viewData: .init(),
//                searchItemsUseCase: 
//            ),
//            viewData: .init()
//        )
//    }
//}
