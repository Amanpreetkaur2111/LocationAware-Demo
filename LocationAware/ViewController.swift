//
//  ViewController.swift
//  LocationAware
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var CourseLabel: UILabel!
    
    @IBOutlet weak var altitudeLabel: UILabel!
    
    @IBOutlet weak var allInfo: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        latLabel.text = String(location.coordinate.latitude)
        longLabel.text = String(location.coordinate.longitude)
        speedLabel.text = String(location.speed)
        CourseLabel.text = String(location.course)
        altitudeLabel.text = String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location){
                   (placemarks , error) in
                   
                   if let error = error {
                       print(error)}
                   else{
                       if let placemark = placemarks?[0]{
                           
                           var address = ""
                           if placemark.subThoroughfare != nil{
                               address += placemark.subThoroughfare! + "\n"
                           }
                          
                           if placemark.thoroughfare != nil{
                               address += placemark.thoroughfare! + "\n"
                           }
                          
                           if placemark.subLocality != nil{
                               address += placemark.subLocality! + "\n"
                           }
                           
                           
                           if placemark.subAdministrativeArea != nil{
                              address += placemark.subAdministrativeArea! + "\n"
                           }
                          
                           
                           
                           if placemark.country != nil{
                               address += placemark.country! + "\n"
                           }
                           
                        self.allInfo.text = address
                       }
    
    }

        }
    




        
}
}
