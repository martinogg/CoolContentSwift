//
//  ContentTableViewTests.swift
//  CoolContentTests
//
//  Created by martin ogg on 16/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import XCTest

@testable import CoolContent

class ContentTableViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRowCount() {
        guard let contentDict = ViewLoader.getDictFromFile() else {
            XCTFail()
            return
        }
        
         let contentTableViewAdapterToTest = ContentTableViewAdapter.init(contentDict)
        
        XCTAssert(contentTableViewAdapterToTest.rowCount() == 3)
    }
    
    //TODO: need to test for cell Returns
}
