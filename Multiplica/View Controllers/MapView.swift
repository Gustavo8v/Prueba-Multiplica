//
//  ViewController.swift
//  Multiplica
//
//  Created by Gustavo Gutierrez on 15/01/21.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire


class MapView: UIViewController {
 
    
// MARK : - Variables
    
    var locationManager = CLLocationManager()
    var kDistanceMeters: CLLocationDistance = RadioAeropuertos.distance * 1000
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
      centerViewOnUser()
        
    
    }

//MARK : - Referencias UI
    @IBOutlet private var mapView: MKMapView!
    
    
//MARK : - Funciones
    
    
    private func centerViewOnUser() {
        guard let location = locationManager.location?.coordinate else { return }
        
        let coordinateRegion = MKCoordinateRegion.init(center: location,
                                                       latitudinalMeters: kDistanceMeters,
                                                       longitudinalMeters: kDistanceMeters)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
            let coordinateRegion = MKCoordinateRegion.init(center: location.coordinate,
                                                           latitudinalMeters: kDistanceMeters,
                                                           longitudinalMeters: kDistanceMeters)
            
        mapView.setRegion(coordinateRegion, animated: true)
    }
 

}





