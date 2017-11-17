//
//  TextListItemView.swift
//  CoolContent
//
//  Created by martin ogg on 16/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

class TextListItemView: UITableViewCell, CoolContentListItemProtocol {
    func configureItem(data: [String : Any]) {
        self.textLabel?.text = "TextListItemView"
    }
}
