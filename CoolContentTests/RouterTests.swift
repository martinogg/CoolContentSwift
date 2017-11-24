//
//  RouterTests.swift
//  CoolContentTests
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import CoolContent

class RouterTests: XCTestCase {
    private let router: RouterProtocol = Router()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetViewForContentView() {
        
        let mockRouter = MockRouter.init()
        
        let viewLoaderToTest = ViewLoader.init(router: mockRouter)
        
        viewLoaderToTest.getView(withDict: [String: Any]()) { (viewController) in
            XCTAssert(viewController === mockRouter.contentTestVC)
        }
        
    }
    
    
}

