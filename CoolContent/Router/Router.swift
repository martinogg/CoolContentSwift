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
    func getContentViewController(viewLoader: ViewLoaderProtocol) -> UIViewController;
}

class Router: RouterProtocol {
    
    func getContentViewController(viewLoader: ViewLoaderProtocol) -> UIViewController {
        
        guard let jsonDict = ViewLoader.getDictFromFile(name: "config") else {
            fatalError("jsonDict creation fail")
        }
        
        let tableViewAdapter = ContentTableViewAdapter.init(jsonDict)
        let viewModel = ContentViewModel.init(jsonDict, viewLoader: viewLoader);
        
        let viewController = ContentViewController.init(viewModel: viewModel, tableViewAdapter: tableViewAdapter)
        
        viewModel.viewContollerDelegate = viewController
        
        return viewController;
    }

}
