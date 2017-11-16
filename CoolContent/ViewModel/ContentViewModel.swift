//
//  ContentViewModel.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation

protocol ContentViewModelProtocol {
    
}

class ContentViewModel: ContentViewModelProtocol {
    let content: [String: Any]
    
    init (_ content_: [String: Any]) {
        self.content = content_
    }
    
}
