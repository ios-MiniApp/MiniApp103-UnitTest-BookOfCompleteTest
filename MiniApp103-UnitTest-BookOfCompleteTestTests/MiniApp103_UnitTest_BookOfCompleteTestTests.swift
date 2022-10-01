//
//  MiniApp103_UnitTest_BookOfCompleteTestTests.swift
//  MiniApp103-UnitTest-BookOfCompleteTestTests
//
//  Created by 前田航汰 on 2022/09/30.
//

import XCTest
/*
 testable import は、
 プロジェクトのメインターゲットにバンドルされているクラスなどにアクセスするためのインポート。
 このキーワードでテストターゲットからインポートしたターゲットは、
 internal のアクセスレベルにあるクラスなどにアクセス可能。
 */
@testable import MiniApp103_UnitTest_BookOfCompleteTest

/*
 XCTestCase は、
 テストケースを定義していくためのクラス。
 このクラスにテストケースを定義していくことで、特定のライフサイクルにしたがって XCTest がテストを評価していく。
 */
class PasswordValidatorTests1: XCTestCase {

    // XCTest で書くテストケースは関数名のはじまりを test とする必要がある。
    // 8文字以上であること
    func testFalseIs2Characters_Total7Characters() {
        XCTAssertFalse(PasswordStringCheckModel.validate(password: "abcde12"), "ここに失敗時のメッセージつけれる")
    }

    func testTrueIs2Characters_Total8Characters() {
        XCTAssertTrue(PasswordStringCheckModel.validate(password: "abcdef12"))
    }

    func testTrueIs2Characters_Total9Characters() {
        XCTAssertTrue(PasswordStringCheckModel.validate(password: "abcdefg12"))
    }

    // 数字が2文字以上利用されていること
    func testFalseIsNonNumeric7Characters_1Numeric() {
        XCTAssertFalse(PasswordStringCheckModel.validate(password: "abcdefg1"))
    }

    func testTrueIsNonNumeric7Characters_2Numeric() {
        XCTAssertTrue(PasswordStringCheckModel.validate(password: "abcdefg12"))
    }

    func testTrueIsNonNumeric7Characters_3Numeric() {
        XCTAssertTrue(PasswordStringCheckModel.validate(password: "abcdefg123"))
    }

}

// テストは構造化もできる。
class PasswordValidatorTests2: XCTestCase {

    func testパスワードバリデーションの文字数() {
        XCTContext.runActivity(named: "数字が2文字以上含まれている場合") { _ in
            XCTContext.runActivity(named: "合計7文字が入力された場合") { _ in
                XCTAssertFalse(PasswordStringCheckModel.validate(password: "abcde12"))
            }
            XCTContext.runActivity(named: "合計8文字が入力された場合") {_ in
                XCTAssertTrue(PasswordStringCheckModel.validate(password: "abcdef12"))
            }
            XCTContext.runActivity(named: "合計9文字が入力された場合") { _ in
                XCTAssertTrue(PasswordStringCheckModel.validate(password: "abcdefg12"))
            }
        }
    }

}
