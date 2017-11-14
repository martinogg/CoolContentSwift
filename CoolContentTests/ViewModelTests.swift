//
//  ViewModelTests.swift
//  CoolContentTests
//
//  Created by martin ogg on 14/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import XCTest
import UIKit

@testable import CoolContent

class ViewModelTests: XCTestCase {

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStartButtonPressed() {
        
        class MockViewLoader: ViewLoaderProtocol {
            var testViewControllertoSend: UIViewController
            
            init (_ testViewControllertoSend_: UIViewController) {
               testViewControllertoSend = testViewControllertoSend_
            }
            
            func getView(withDict dict: Dictionary<String, Any>, callback: ((UIViewController) -> Void)) {
                callback(testViewControllertoSend)
            }
        }
        
        class MockViewController: ViewControllerDelegate {
            weak var pushedViewController: UIViewController?
            func push(view viewController: UIViewController) {
                pushedViewController = viewController
            }
        }
        
        let viewControllerToSend = UIViewController.init();
        let mockViewLoader = MockViewLoader.init(viewControllerToSend)
        let mockViewController = MockViewController.init()
        
        let testViewModel = ViewModel.init(mockViewController, mockViewLoader)
        
        testViewModel.startButtonPressed()
        
        XCTAssert(viewControllerToSend === mockViewController.pushedViewController)
    }
    
    
}


