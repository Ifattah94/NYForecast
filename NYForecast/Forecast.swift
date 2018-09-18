//
//  Forecast.swift
//  NYForecast
//
//  Created by C4Q on 9/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
struct ResponseWrapper: Codable {
    let response: [Response]
}

struct Response: Codable {
    let periods: [Forecast]
}

struct Forecast: Codable {
    let dateTimeISO: String
    let maxTempC: Int
    let maxTempF: Int
    let minTempC: Int
    let minTempF: Int
    var icon: String
    }
