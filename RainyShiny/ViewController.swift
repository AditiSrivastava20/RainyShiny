//
//  ViewController.swift
//  RainyShiny
//
//  Created by anil kumar srivastava on 11/25/17.
//  Copyright © 2017 AditiSrivastava. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AVFoundation
import AVKit



class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
  
    @IBOutlet weak var lblWeatherCondition: UILabel!
    @IBOutlet weak var lblCurrentLocation: UILabel!
    @IBOutlet weak var lblCurrentWeather: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgWeatherCondition: UIImageView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts =  [Forecast]()
    override func viewDidLoad() {
      super.viewDidLoad()
     
        let videoURL =  URL(string:"https://gcs-vimeo.akamaized.net/exp=1511716575~acl=%2A%2F716024143.mp4%2A~hmac=aed17065de7d43d1e4652be9c8ac73e5476aab46ac1caaa64aaaa6b6b0eae0bd/vimeo-prod-skyfire-std-us/01/1858/8/209292190/716024143.mp4?download=1&filename=Sunset+-+8451.mp4")
        let player = AVPlayer(url: videoURL! as URL)
        let playerLayer = AVPlayerLayer(player: player)
        print ("The size : \(myView.bounds)")
       myView.clipsToBounds = true
        playerLayer.frame = myView.bounds
        myView.contentMode = .scaleAspectFill
       myView.layer.addSublayer(playerLayer)
      
      player.play()
      print(CURRENT_WEATHER_URL)
      currentWeather = CurrentWeather()
        currentWeather
            .downloadWeatherDetails {
                self.updateMainUI()
                
        }
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
   
    func updateMainUI(){
        
        lblDate.text = currentWeather.date
        lblCurrentWeather.text = "\(currentWeather.currentTemp)"
        lblWeatherCondition.text = currentWeather.weatherType
        lblCurrentLocation.text = currentWeather.cityName
        imgWeatherCondition.image = UIImage(named: currentWeather.weatherType)
    
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier : "tableCell",for : indexPath ) as? TableViewCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        else{
            return TableViewCell()
        }
    }
    
    
}

