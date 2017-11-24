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
    func getContentViewController(viewLoader: ViewLoaderProtocol, config: [String: Any]) -> ContentViewController;
    func getWebViewController(viewLoader: ViewLoaderProtocol, config: [String: Any]) -> WebViewController;
}

class Router: RouterProtocol {
    
    func getWebViewController(viewLoader: ViewLoaderProtocol, config: [String : Any]) -> WebViewController {
        // TODO: instantiate this properly
        return WebViewController.init()
    }
    
    func getContentViewController(viewLoader: ViewLoaderProtocol, config: [String: Any]) -> ContentViewController {
        
        let tableViewAdapter = ContentTableViewAdapter.init(config)
        let viewModel = ContentViewModel.init(config, viewLoader: viewLoader)
        let viewController = ContentViewController.init(viewModel: viewModel, tableViewAdapter: tableViewAdapter)
        
        viewModel.viewContollerDelegate = viewController
        
        return viewController
    }
    
}
