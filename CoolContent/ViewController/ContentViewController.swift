//
//  ContentViewController.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol ContentViewControllerDelegate : class {
    func push(view viewController: UIViewController)
}

class ContentViewController: UITableViewController, ContentViewControllerDelegate {
    
    var viewModel: ContentViewModelProtocol?
    var tableViewAdapter: ContentTableViewAdapterProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(viewModel: ContentViewModelProtocol?, tableViewAdapter: ContentTableViewAdapterProtocol?) {
        self.viewModel = viewModel;
        self.tableViewAdapter = tableViewAdapter;
        super.init(nibName: nil, bundle: nil)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        tableViewAdapter?.registerCellClasses(tableView: self.tableView)
    }
    
    // UITableViewDelegate and DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = self.tableViewAdapter?.rowCount() else {
            return 0
        }
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableViewAdapter?.cellFor(tableView: tableView, indexPath :indexPath) else {
            fatalError()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.viewModel?.cellTapped(atIndexPath: indexPath);
    }
    
    // delegate
    func push(view viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
