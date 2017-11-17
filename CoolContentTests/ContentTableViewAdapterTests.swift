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
        guard let contentDict = ViewLoader.getDictFromFile(name: "configtest") else {
            XCTFail()
            return
        }
        
         let contentTableViewAdapterToTest = ContentTableViewAdapter.init(contentDict)
        
        XCTAssert(contentTableViewAdapterToTest.rowCount() == 4)
    }
    
    func testCells() {
        guard let contentDict = ViewLoader.getDictFromFile(name: "configtest") else {
            XCTFail()
            return
        }
        
        let contentTableViewAdapterToTest = ContentTableViewAdapter.init(contentDict)
        
        let mockTableView = UITableView.init()
        
        contentTableViewAdapterToTest.registerCellClasses(tableView: mockTableView)
        
        let cell0 = contentTableViewAdapterToTest.cellFor(tableView: mockTableView, indexPath: IndexPath(row: 0, section: 0))
        
        let cell1 = contentTableViewAdapterToTest.cellFor(tableView: mockTableView, indexPath: IndexPath(row: 1, section: 0))
        
        let cell2 = contentTableViewAdapterToTest.cellFor(tableView: mockTableView, indexPath: IndexPath(row: 2, section: 0))
        
        let cell3 = contentTableViewAdapterToTest.cellFor(tableView: mockTableView, indexPath: IndexPath(row: 3, section: 0))
        
        XCTAssert(cell0.isKind(of: ImageListItemView.self))
        XCTAssert(cell1.isKind(of: TextListItemView.self))
        XCTAssert(cell2.isKind(of: ImageButtonListItemView.self))
        XCTAssert(cell3.isKind(of: BasicListItemView.self))
    }
    
}
