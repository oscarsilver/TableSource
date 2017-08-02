//
//  NumberTVCell.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

class NumberTVCell: UITableViewCell {
    
    fileprivate lazy var numberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    // MARK: Initialzation
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("needed by compiler")
    }
}

// MARK: ModelConfigurable
extension NumberTVCell: ModelConfigurable {
    typealias Model = Int
    
    func configure(with model: Int) {
        numberLabel.text = "\(model)"
    }
}

// MARK: Private Methods
private extension NumberTVCell {
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(numberLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            numberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
}
