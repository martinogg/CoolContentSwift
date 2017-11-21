//
//  ViewModel.swift
//  CoolContent
//
//  Created by martin ogg on 14/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
    func startButtonPressed()
}

class ViewModel: ViewModelProtocol {
    unowned var viewContollerDelegate: ViewControllerDelegate
    var viewLoader: ViewLoaderProtocol
    
    required init(_ viewControllerDelegate_: ViewControllerDelegate, _ viewLoader_: ViewLoaderProtocol) {
        viewContollerDelegate = viewControllerDelegate_
        viewLoader = viewLoader_
        
    }
    
    func startButtonPressed() {
        guard let config = ViewLoader.getDictFromFile(name: "config") else {
            fatalError()
        }
        
        viewLoader.getView(withDict: config) { (vc: UIViewController) in
            self.viewContollerDelegate.push(view: vc);
        }
    }
}
