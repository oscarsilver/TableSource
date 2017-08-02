//
//  NSObject+ClassName.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
