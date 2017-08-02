//
//  TableSource.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

class TableSource: NSObject {
    let sections: [TableSection]
    
    // MARK: Initialization
    init(sections: [TableSection]) {
        self.sections = sections
    }
}

// MARK: Public Methods
extension TableSource {
    func install(on tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        sections.forEach { $0.install(on: tableView) }
    }
}

// MARK: UITableViewDelegate
extension TableSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let section = sectionAt(indexPath.section),
            let model = modelAt(indexPath)
        else { return }
        section.cellInfo.selection?(model)
    }
}

// MARK: UITableViewDataSource
extension TableSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = sectionAt(section) else { return 0 }
        return section.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = cellIdentifier(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        guard let model = modelAt(indexPath) else { return cell }
        if let cell = cell as? Configurable {
            cell.configure(with: model)
        }
        return cell
    }
}

// MARK: Private Methods
private extension TableSource {
    func sectionAt(_ index: Int) -> TableSection? {
        guard index < sections.count else { return nil }
        return sections[index]
    }
    
    func modelAt(_ indexPath: IndexPath) -> Any? {
        guard
            let section = sectionAt(indexPath.section),
            indexPath.row < section.numberOfRows
        else { return nil }
        return section.models[indexPath.row]
    }
    
    func cellIdentifier(for indexPath: IndexPath) -> String {
        guard let section = sectionAt(indexPath.section) else { fatalError("Section index out of bounds") }
        return section.cellInfo.reuseIdentifier
    }
}
