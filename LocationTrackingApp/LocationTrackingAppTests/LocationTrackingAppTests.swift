//
//  LocationTrackingAppTests.swift
//  LocationTrackingAppTests
//
//  Created by Purushottam Padhya on 27/1/22.
//

import XCTest
@testable import LocationTrackingApp
import CoreLocation

class LocationTrackingAppTests: XCTestCase {
    var locationMock = LocationManager.shared
    
    override func setUp() {
        super.setUp()
        let uv = UIViewController()
        locationMock.vc = uv
        locationMock.startTracking()
        let latitude: CLLocationDegrees = 33.8688
        let longitude: CLLocationDegrees = 151.2093

        let location: CLLocation = CLLocation(latitude: latitude,
          longitude: longitude)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
