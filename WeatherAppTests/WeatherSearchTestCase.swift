//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherSearchTestCase: XCTestCase {

    var sut: WeatherSearchViewController!
    override func setUpWithError() throws {
        sut = WeatherSearchViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_welcomeLabelDisplayed() throws {
        XCTAssertEqual(sut.welcomeLabel.text, "Welcome to the weather app")
    }

    func test_searchTextFieldDisplayed() throws {
        XCTAssertEqual(sut.searchTextField.placeholder, "Please enter a City/state/country/zipcode/etc")
    }

    func test_goButtonDisplayed() throws {
        XCTAssertEqual(sut.goButton.titleLabel?.text, "Go!")
    }

    func test_goButtonAction_showLoading() throws {
        sut.searchTextField.text = "Cairo"
        sut.goAction(sut.goButton)
        _ = try XCTUnwrap(sut.children.first as? SpinnerViewController)
    }
}
