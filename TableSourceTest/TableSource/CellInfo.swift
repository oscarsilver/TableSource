//
//  CellInfo.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

typealias CellSelection = (Any) -> ()

// MARK: CellInfo
struct CellInfo {
    typealias Component = UITableViewCell
    let type: Component.Type
    let selection: CellSelection?
    
    var reuseIdentifier: String {
        return type.className
    }
    
    init(type: Component.Type,
         selection: CellSelection? = nil) {
        self.type = type
        self.selection = selection
    }
}
