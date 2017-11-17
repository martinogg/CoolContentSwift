//
//  ContentViewModelTests.swift
//  CoolContentTests
//
//  Created by martin ogg on 17/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import XCTest

@testable import CoolContent
class ContentViewModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCellTapped() {
        guard let config = ViewLoader.getDictFromFile(name: "configtest") else {
            XCTFail()
            return
        }
        
        class MockViewLoader : ViewLoaderProtocol {
            let VCToReturn = UIViewController.init()
            
            func getView(withDict dict: Dictionary<String, Any>, callback: ((UIViewController) -> Void)) {
                callback (VCToReturn)
            }
        }
        
        let mockViewLoader = MockViewLoader.init()
        
        let testContentViewModel = ContentViewModel.init(config, viewLoader: mockViewLoader )
        
        class MockViewController : ContentViewControllerDelegate {
            var pushedVC: UIViewController?
            
            func push(view viewController: UIViewController) {
                self.pushedVC = viewController
            }
        }
        let mockViewController = MockViewController.init()
        
        testContentViewModel.viewContollerDelegate = mockViewController
        
        testContentViewModel.cellTapped(atIndexPath: IndexPath.init(row: 3, section: 0))
        
        XCTAssert(mockViewController.pushedVC === mockViewLoader.VCToReturn)
        
        
    }

}
