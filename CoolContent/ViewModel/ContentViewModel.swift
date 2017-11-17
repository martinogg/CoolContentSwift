//
//  ContentViewModel.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation

protocol ContentViewModelProtocol {
    func cellTapped(atIndexPath indexPath: IndexPath);
}

class ContentViewModel: ContentViewModelProtocol {
    weak var viewContollerDelegate: ContentViewControllerDelegate?
    unowned var viewLoader: ViewLoaderProtocol
    
    let data: [String: Any]
    
    init (_ data_: [String: Any], viewLoader: ViewLoaderProtocol) {
        self.data = data_
        self.viewLoader = viewLoader
    }
    
    func cellTapped(atIndexPath indexPath: IndexPath) {
        
        if let itemsList: NSArray = self.data["items"] as? NSArray,
            let target = itemsList[indexPath.row] as? [String: Any] {
            self.viewLoader.getView(withDict: target) { (newVC) in
                viewContollerDelegate?.push(view: newVC)
            }
        }
        
    }
}
