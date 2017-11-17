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
    func registerCellClasses(tableView: UITableView)
}

class ContentTableViewAdapter: ContentTableViewAdapterProtocol {
    
    let contentDict: [String: Any]
    
    init(_ contentDict_:[String: Any]) {
        self.contentDict = contentDict_
    }
    
    lazy private var contentItems: NSArray = {
        guard let items = contentDict["items"] as? NSArray else { fatalError("Item list fail") }
        
        return items
    }()
    
    func rowCount() -> Int {
        return self.contentItems.count
    }
    
    func cellFor(tableView: UITableView, indexPath :IndexPath) -> UITableViewCell {
        
        guard let item = self.contentItems[indexPath.row] as? [String: Any],
        let itemType: String = item["type"] as? String else {
            fatalError("Item List request fail")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: itemType, for: indexPath) as? CoolContentListItemProtocol else {
            fatalError()
        }
        
        cell.configureItem(data: item)
        
        return cell as! UITableViewCell
    }
    
    func registerCellClasses(tableView: UITableView) {
        tableView.register(TextListItemView.self, forCellReuseIdentifier: "text_list_item")
        tableView.register(ImageListItemView.self, forCellReuseIdentifier: "image_list_item")
        tableView.register(ImageButtonListItemView.self, forCellReuseIdentifier: "imagebutton_list_item")
        tableView.register(BasicListItemView.self, forCellReuseIdentifier: "basic_list_item")
    }
    
}
