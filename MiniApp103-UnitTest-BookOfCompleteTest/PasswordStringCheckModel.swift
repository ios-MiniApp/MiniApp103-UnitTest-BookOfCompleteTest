//
//  PasswordStringCheckModel.swift
//  MiniApp103-UnitTest-BookOfCompleteTest
//
//  Created by 前田航汰 on 2022/09/30.
//

import Foundation

struct PasswordStringCheckModel {

    // ８文字以下であること
    // 数字が2文字以上含まれていること
    static func validate(password: String) -> Bool {
        if password.count <= 7 {
            return false
        }

        let numString = password.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return numString.count >= 2

    }

}
