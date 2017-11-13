//
//  ContentViewController.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: UIViewController {
    var viewModel: ContentViewModelProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(viewModel: ContentViewModelProtocol) {
        self.viewModel = viewModel;
        super.init(nibName: nil, bundle: nil)
    }
    
}