import XCTest
@testable import RangeEnhancer

final class ClosedRangeExtensionsTests: XCTestCase {
    
    // Test the `lengthExpand(by:)` function
    func testLengthExpansion() {
        let range1 = 1.0...10.0
        let expandedRange1 = range1.lengthExpand(by: 2.5)
        XCTAssertEqual(expandedRange1, -1.5...12.5)
        
        let range2 = -5.0...5.0
        let expandedRange2 = range2.lengthExpand(by: 1.0)
        XCTAssertEqual(expandedRange2, -6.0...6.0)
        
        let range3 = 2.0...3.0
        let expandedRange3 = range3.lengthExpand(by: 0.0)
        XCTAssertEqual(expandedRange3, 2.0...3.0)
    }
    
    // Test the `upperBoundAdd(_:)` function
    func testUpperBoundAddition() {
        let range1 = 0.0...10.0
        let newRange1 = range1.upperBoundAdd(5.0)
        XCTAssertEqual(newRange1, 0.0...15.0)
        
        let range2 = -5.0...5.0
        let newRange2 = range2.upperBoundAdd(2.5)
        XCTAssertEqual(newRange2, -5.0...7.5)
        
        let range3 = 2.0...3.0
        let newRange3 = range3.upperBoundAdd(-1.0)
        XCTAssertEqual(newRange3, 2.0...2.0)
    }
    
    // Test the `lowerBoundAdd(_:)` function
    func testLowerBoundAddition() {
        let range1 = 0.0...10.0
        let newRange1 = range1.lowerBoundAdd(5.0)
        XCTAssertEqual(newRange1, 5.0...10.0)
        
        let range2 = -5.0...5.0
        let newRange2 = range2.lowerBoundAdd(-2.5)
        XCTAssertEqual(newRange2, -7.5...5.0)
        
        let range3 = 2.0...3.0
        let newRange3 = range3.lowerBoundAdd(-1.0)
        XCTAssertEqual(newRange3, 1.0...3.0)
    }
}

final class ArrayExtensionsTests: XCTestCase {
    
    // Test the `boundingRange()` function with non-empty array
    func testBoundingRangeNonEmpty() {
        let ranges1 = [1.0...10.0, 5.0...15.0, -2.5...2.5, 7.0...9.0]
        let boundingRange1: ClosedRange<Double>? = ranges1.boundingRange()
        XCTAssertEqual(boundingRange1, -2.5...15.0)
        
        let ranges2 = [1.0...2.0, 3.0...4.0, 5.0...6.0]
        let boundingRange2: ClosedRange<Double>? = ranges2.boundingRange()
        XCTAssertEqual(boundingRange2, 1.0...6.0)
        
        let ranges3 = [2.5...2.5]
        let boundingRange3: ClosedRange<Double>? = ranges3.boundingRange()
        XCTAssertEqual(boundingRange3, 2.5...2.5)
    }
    
    // Test the `boundingRange()` function with empty array
    func testBoundingRangeEmpty() {
        let emptyRanges: [ClosedRange<Double>] = []
        let boundingRange: ClosedRange<Double>? = emptyRanges.boundingRange()
        XCTAssertNil(boundingRange)
    }
    
    // Test the `contains(_:)` function
    func testContains() {
        let range1 = 0...10
        XCTAssertTrue(range1.contains(5...7))
        XCTAssertFalse(range1.contains(-1...1))
        XCTAssertFalse(range1.contains(9...11))
        
        let range2 = -2.5...2.5
        XCTAssertTrue(range2.contains(-1.0...0.0))
        XCTAssertFalse(range2.contains(-1.0...3.0))
        XCTAssertFalse(range2.contains(-3.0...3.0))
    }
    
    // Test the `positioned(onSideOf:)` function
    func testPositioned() {
        let range1 = 0...10
        XCTAssertEqual(range1.positioned(onSideOf: -5...0), .right)
        XCTAssertEqual(range1.positioned(onSideOf: -5...(-1)), .right)
        XCTAssertNil(range1.positioned(onSideOf: 8...15))
        
        let range2 = -2.5...2.5
        XCTAssertEqual(range2.positioned(onSideOf: -5...(-3)), .right)
        XCTAssertNil(range2.positioned(onSideOf: 0...1))
        XCTAssertEqual(range2.positioned(onSideOf: 3...5), .left)
    }
    
    // Test the `add(_:)` function
    func testAdd() {
        let range1 = 0...10
        XCTAssertEqual(range1.add(-5...5), -5...10)
        XCTAssertEqual(range1.add(8...12), 0...12)
        
        let range2 = -2.5...2.5
        XCTAssertEqual(range2.add(-1.0...0.0), -2.5...2.5)
        XCTAssertEqual(range2.add(3.0...4.0), -2.5...4.0)
    }
}
