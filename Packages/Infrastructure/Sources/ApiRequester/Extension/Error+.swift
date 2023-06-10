//
//  Error+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

extension Error {
    var reflectedString: String {
        String(reflecting: self)
    }

    func isEqual(to: Self) -> Bool {
        self.reflectedString == to.reflectedString
    }
}
