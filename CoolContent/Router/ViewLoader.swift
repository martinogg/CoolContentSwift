//
//  ViewLoader.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol ViewLoaderProtocol {
    init(router: RouterProtocol)
    func getView(withDict dict: Dictionary<String, Any>, callback: ((_ vc: UIViewController) -> Void))
}

class ViewLoader {
    private let router: RouterProtocol;
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func getView(withDict dict: Dictionary<String, Any>, callback: ((_ vc: UIViewController) -> Void)) {
        
        callback(router.getContentViewController())        
    }
}
