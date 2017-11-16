//
//  ViewLoaderTests.swift
//  CoolContentTests
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import XCTest
@testable import CoolContent

class ViewLoaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSimpleDictRequest() {
        
        class MockRouter: RouterProtocol {
            let uiTestVC = UIViewController.init()
            func getContentViewController() -> UIViewController {
                return uiTestVC
            }
        }
        
        let mockRouter = MockRouter.init()
        
        let testViewLoader = ViewLoader.init(router: mockRouter)
        
        guard let dict = ViewLoader.getDictFromFile() else {
            XCTFail()
            return
        }
        
        var callbackCalled = false;
        
        testViewLoader.getView(withDict: dict, callback: {(vc: UIViewController) in
            
            callbackCalled = true;
            XCTAssert(vc === mockRouter.uiTestVC)
        });
        
        XCTAssert(callbackCalled)
    }
    
    func testGetDictFromFile() {
        guard let dictToTest = ViewLoader.getDictFromFile() else {
            XCTFail()
            return
        }
        
        XCTAssert(dictToTest["type"] as! String == "local_list")
        XCTAssert(dictToTest["text"] as! String == "Game On Scotland")
        XCTAssert(dictToTest["bgnd_color"] as! String == "#ffffff")
        
        let itemsToTest = dictToTest["items"] as! NSArray
        XCTAssert(itemsToTest.count == 3)
    }

    
}

