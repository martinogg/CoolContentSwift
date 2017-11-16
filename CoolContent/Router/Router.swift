//
//  Router.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func getContentViewController() -> UIViewController;
}

class Router: RouterProtocol {
    
    func getContentViewController() -> UIViewController {
        
        guard let jsonDict = ViewLoader.getDictFromFile() else {
            fatalError("jsonDict creation fail")
        }
        
        return ContentViewController.init(viewModel: ContentViewModel.init(jsonDict));
    }

}
