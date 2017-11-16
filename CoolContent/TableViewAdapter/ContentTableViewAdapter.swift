//
//  ContentTableViewAdapter.swift
//  CoolContent
//
//  Created by martin ogg on 16/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol ContentTableViewAdapterProtocol : class {
    func rowCount() -> Int
    func cellFor(tableView: UITableView, indexPath :IndexPath) -> UITableViewCell
}

class ContentTableViewAdapter: ContentTableViewAdapterProtocol {
    
    
    let contentDict: [String: Any]
    
    init(_ contentDict_:[String: Any]) {
        self.contentDict = contentDict_
    }
    
    func rowCount() -> Int {
        guard let items = contentDict["items"] as? NSArray else { return 0 }
        
        return items.count
    }
    
    func cellFor(tableView: UITableView, indexPath :IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    
    }
    
    
}
