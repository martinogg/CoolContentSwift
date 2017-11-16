//
//  ContentViewController.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: UITableViewController {
    
    var viewModel: ContentViewModelProtocol?
    var tableViewAdapter: ContentTableViewAdapterProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(viewModel: ContentViewModelProtocol, tableViewAdapter: ContentTableViewAdapterProtocol) {
        self.viewModel = viewModel;
        self.tableViewAdapter = tableViewAdapter;
        super.init(nibName: nil, bundle: nil)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
}
