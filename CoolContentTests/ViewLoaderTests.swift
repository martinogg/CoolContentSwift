//
//  ViewLoaderTests.swift
//  CoolContentTests
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import XCTest
@testable import CoolContent

class MockRouter: RouterProtocol {
    let contentTestVC: ContentViewController = ContentViewController.init(viewModel: nil, tableViewAdapter: nil)
    let webTestVC: WebViewController = WebViewController.init()
    
    func getWebViewController(viewLoader: ViewLoaderProtocol, config: [String : Any]) -> WebViewController {
        return webTestVC
    }
    
    func getContentViewController(viewLoader: ViewLoaderProtocol, config: [String : Any]) -> ContentViewController {
        return contentTestVC
    }
}

class ViewLoaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWebViewDictRequest() {
        let mockRouter = MockRouter.init()
        
        let testViewLoader = ViewLoader.init(router: mockRouter)
        
        guard let dict = ViewLoader.getDictFromFile(name: "configtestwebview") else {
            XCTFail()
            return
        }
        
        var callbackCalled = false;
        
        testViewLoader.getView(withDict: dict, callback: {(vc: UIViewController) in
            
            callbackCalled = true;
            XCTAssert(vc === mockRouter.webTestVC)
        });
        
        XCTAssert(callbackCalled)
        
    }
    
    func testContentDictRequest() {
        
        let mockRouter = MockRouter.init()
        
        let testViewLoader = ViewLoader.init(router: mockRouter)
        
        guard let dict = ViewLoader.getDictFromFile(name: "configtest") else {
            XCTFail()
            return
        }
        
        var callbackCalled = false;
        
        testViewLoader.getView(withDict: dict, callback: {(vc: UIViewController) in
            
            callbackCalled = true;
            XCTAssert(vc === mockRouter.contentTestVC)
        });
        
        XCTAssert(callbackCalled)
    }
    
    func testGetDictFromFile() {
        guard let dictToTest = ViewLoader.getDictFromFile(name: "configtest") else {
            XCTFail()
            return
        }
        
        XCTAssert(dictToTest["type"] as! String == "local_list")
        XCTAssert(dictToTest["text"] as! String == "Game On Scotland")
        XCTAssert(dictToTest["bgnd_color"] as! String == "#ffffff")
        
        let itemsToTest = dictToTest["items"] as! NSArray
        XCTAssert(itemsToTest.count == 4)
    }

    
}

