//
//  DetailsCoordinator.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

class DetailsCoordinator: Coordinator {
    let rootViewController: UINavigationController
    let weatherData: Weather

    init(rootViewController: UINavigationController, weatherData: Weather) {
        self.rootViewController = rootViewController
        self.weatherData = weatherData
    }

    func start() {
        let viewController = MapViewViewController()
        viewController.config(weatherData: weatherData)
        self.rootViewController.pushViewController(viewController, animated: true)
    }
}
