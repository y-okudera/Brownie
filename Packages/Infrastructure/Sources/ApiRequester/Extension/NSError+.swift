//
//  NSError+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

extension NSError {
    func isEqual(to: NSError) -> Bool {
        let lhs = self as Error
        let rhs = to as Error
        return self.isEqual(to) && lhs.reflectedString == rhs.reflectedString
    }
}
