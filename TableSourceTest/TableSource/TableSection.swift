//
//  TableSection.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

struct TableSection {
    let cellInfo: CellInfo
    let models: [Any]
}

// MARK: Public Methods
extension TableSection {
    var numberOfRows: Int {
        return models.count
    }
    
    func install(on tableView: UITableView) {
        tableView.register(cellInfo.type, forCellReuseIdentifier: cellInfo.reuseIdentifier)
    }
}
