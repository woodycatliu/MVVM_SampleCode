//
//  MVVM_SampleCodeTests.swift
//  MVVM_SampleCodeTests
//
//  Created by Woody Liu on 2021/12/24.
//

import XCTest
@testable import MVVM_SampleCode

class MVVM_SampleCodeTests: XCTestCase {
    
    var data: Data!

    override func setUp() {
        super.setUp()
        
        if let d = JSONString.data(using: .utf8) {
            data = d
        } else {
            XCTAssertThrowsError("Decode is error")
        }
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let object = try JSONDecoder().decode(DataModel.self, from: data)
        
        XCTAssertEqual(object.firstList.count, 6)
        XCTAssertEqual(object.secondList.count, 4)
        XCTAssertEqual(object.values.count, 9)
        XCTAssertEqual(object.values[0], 10)
        XCTAssertEqual(object.battles.count, 6)
        
        print(object)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
