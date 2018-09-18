//
//  AerisAPI.swift
//  NYForecast
//
//  Created by C4Q on 9/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

class AerisAPI {
    private init() {}
    static let manager = AerisAPI()
    private let accessID = "qjrGy6NSBoY8IOOCNaJJd"
    private let secretID = "gs6VATMFRT0mAp2H9L13A3A2h3jzte7frnhW3xvw"
    
    func getForecast(completionHandler: @escaping ([Forecast]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let urlStr = "http://api.aerisapi.com/forecasts/11101?client_id=\(accessID)&client_secret=\(secretID)"
        guard let url = URL(string: urlStr) else {
            errorHandler(AppError.badUrl)
            return
        }
        let request = URLRequest(url: url)
        let parseDataIntoForecast: (Data) -> Void = {(data) in
            do {
                let results = try JSONDecoder().decode(ResponseWrapper.self, from: data)
                if let response = results.response.first?.periods {
                    let forecasts = response
                    completionHandler(forecasts)
                }
            }
            catch {
                errorHandler(AppError.codingError(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: parseDataIntoForecast, errorHandler: errorHandler)
    }
}
