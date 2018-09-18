//
//  ForecastCell.swift
//  NYForecast
//
//  Created by C4Q on 9/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {
    
    
    

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    var forecast: Forecast?
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
      
        if let forecast = forecast {
            if self.highLabel.text == "\(forecast.maxTempF)°F" {
                self.highLabel.text = "\(forecast.maxTempC)°C"
            } else {
                self.highLabel.text = "\(forecast.maxTempF)°F"
            }
            if self.lowLabel.text == "\(forecast.minTempF)°F" {
                self.lowLabel.text = "\(forecast.minTempC)°C"
            } else {
                self.lowLabel.text = "\(forecast.minTempF)°F"
            }
            
        }
    }
    
    func configureCell(with forecast:Forecast) {
        self.dateLabel.text = forecast.dateTimeISO.components(separatedBy: "T")[0]
        self.highLabel.text = "\(forecast.maxTempF)°F"
        self.lowLabel.text = "\(forecast.minTempF)°F"
        self.imageView.image = UIImage(named: forecast.icon)
    }
    
    
}
