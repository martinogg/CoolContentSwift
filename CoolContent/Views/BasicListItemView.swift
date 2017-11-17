//
//  BasicListItemView.swift
//  CoolContent
//
//  Created by martin ogg on 17/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

class BasicListItemView: UITableViewCell, CoolContentListItemProtocol {
    func configureItem(data: [String : Any]) {
        if let cellText = data["text"] as? String {
            self.textLabel?.text = cellText
        }
    }
}
