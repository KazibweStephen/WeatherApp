//
//  WeatherDetailsViewModelTestCase.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/5/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherDetailsViewModelTestCase: XCTestCase {

    var sut: WeatherDetailsViewModel!
    let timeout: TimeInterval = 5
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        sut = WeatherDetailsViewModel(weatherData: try getMockWeatherData())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getCityName() throws {
        XCTAssertEqual(sut.getCityName(), "London, GB")
    }

    func test_refreshWeatherData() throws {
        var expectation = self.expectation(description: "Refresh functionality")
        sut.refreshWeatherData { (result) in
            defer { expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.city.name, "London")
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        waitForExpectations(timeout: 4)
    }

    func getMockWeatherData() throws -> WeatherData {
        let data: Data

        let testBundle = Bundle(for: WeatherDetailsViewModelTestCase.self)
        let url = try XCTUnwrap(
            testBundle.url(forResource: "data", withExtension: "json")
        )
        data = try XCTUnwrap(try Data(contentsOf: url))
        return try JSONDecoder().decode(Weather.self, from: data) as WeatherData
    }

}
