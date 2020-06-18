//
//  LoginTests.swift
//  PayDayBankTests
//
//  Created by  on 17.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import XCTest

class LoginTests: XCTestCase {
    
    var loginPresenter: LoginPresenter!
    
    override func setUpWithError() throws {
        loginPresenter = LoginPresenter(protocolDelegate: MockPresenterProtocol())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidateMail() throws {
        let successMail = "a@a.com"
        let failMail = "a"
        
        let validateTrue = loginPresenter.validateEmail(email: successMail)
        let validateFalse = loginPresenter.validateEmail(email: failMail)
        
        assert(validateTrue, "Success mail failed")
        assert(!validateFalse, "Fail mail failed")
    }
    
    func testValidatePassword() throws {
        let successPass = "123456"
        let failPass = "123"
        
        let validateTrue = loginPresenter.validatePassword(password: successPass)
        let validateFalse = loginPresenter.validatePassword(password: failPass)
        
        assert(validateTrue, "Success pass failed")
        assert(!validateFalse, "Fail pass failed")
    }

}

class MockPresenterProtocol: LoginPresenterProtocol {
    func loginAccepted() {
        print("Login accepted")
    }
}
