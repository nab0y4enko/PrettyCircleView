//
//  Sequence+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/13/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

public extension Sequence where Iterator.Element: Hashable {
    
    public var uniqueElements: [Iterator.Element] {
        let uniqueElements = Set(self)
        return Array(uniqueElements)
    }
}

public extension Sequence where Iterator.Element: Equatable {
    
    public var uniqueElements: [Iterator.Element] {
        let uniqueElements = reduce([], { (result, element) -> [Iterator.Element] in
            if result.contains(element) {
                return result
            }
            return result + [element]
        })
        return uniqueElements
    }
}
