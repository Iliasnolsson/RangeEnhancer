//
//  ClosedRangeExtensions.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-07-07.
//

import QuartzCore
import CoordinateEnums

public extension Array  {
    
    func boundingRange<T>() -> ClosedRange<T>? where Element == ClosedRange<T> {
        if self.isEmpty {return nil}
        
        var rangesMutable = self
        let firstRange = rangesMutable.removeFirst()
        var min: T = firstRange.lowerBound
        var max: T = firstRange.upperBound
        for range in rangesMutable {
            if range.lowerBound < min {
                min = range.lowerBound
            }
            if range.upperBound > max {
                max = range.upperBound
            }
        }
        return min...max
    }
    
}

public extension ClosedRange {
    
    func contains(_ otherRange: ClosedRange) -> Bool {
        return lowerBound <= otherRange.lowerBound && upperBound >= otherRange.upperBound
    }
    
    func positioned(onSideOf otherRange: ClosedRange) -> SideHorizontal? {
        if upperBound <= otherRange.lowerBound {
            return .left
        }
        if lowerBound >= otherRange.upperBound {
            return .right
        }
        return nil
    }
    
    func add(_ range: ClosedRange<Bound>) -> ClosedRange<Bound> {
        let lowestBound = Swift.min(lowerBound, range.lowerBound)
        let highestBound = Swift.max(upperBound, range.upperBound)
        return lowestBound...highestBound
    }
    
}
