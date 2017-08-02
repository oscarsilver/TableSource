//
//  ModelConfigurable.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

// This is a trick so that we can try to cast any model to `Configurable`. We cannot write `if model is ModelConfigurable`
// Since the `ModelConfigurable` protocol has associatedType. But we can cast it to `Configurable` instead and call the method
// with the similar signature.
protocol Configurable {
    func configure(with model: Any)
}

protocol ModelConfigurable: Configurable {
    associatedtype Model
    func configure(with model: Model)
}

extension ModelConfigurable {
    // Adding default implementation of the `Configurable` method.
    func configure(with model: Any) {
        guard let `model` = model as? Model else { return }
        configure(with: model)
    }
}
