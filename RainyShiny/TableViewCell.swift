//
//  TableViewCell.swift
//  RainyShiny
//
//  Created by anil kumar srivastava on 11/26/17.
//  Copyright © 2017 AditiSrivastava. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  
    @IBOutlet weak var minimumTemperature: UILabel!
    @IBOutlet weak var maximumTemperature: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(forecast: Forecast){
        minimumTemperature.text = "\(forecast.lowTemp)"
        maximumTemperature.text = "\(forecast.highTemp)"
        lblWeather.text = forecast.weatherType
        lblDay.text = forecast.date
        weatherImage.image = UIImage(named: forecast.weatherType)
    }

}
