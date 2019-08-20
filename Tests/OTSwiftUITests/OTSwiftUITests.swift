//import XCTest
//import SwiftUI
//import Combine
//@testable import OTSwiftUI
//
//final class OTSwiftUITests: XCTestCase {
//    
//    var _selected = 0
//    lazy var selected = Binding(get: { self._selected }, set: { self._selected = $0 })
//    
//    func testOTPicker() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        
//        let collection = [0, 1, 2, 3, 4, 5]
//        let picker = OTPicker(collection, selection: selected) { (int, isSelected) in
//            OTCardWidget(isSelected: isSelected)
//        }
//        
//        XCTAssertEqual(picker, "Hello, World!")
//    }
//
//    static var allTests = [
//        ("testExample", testOTPicker),
//    ]
//}
//
//#if DEBUG
//extension Int: Identifiable {
//    public var id: Int {
//        hashValue
//    }
//}
//#endif
