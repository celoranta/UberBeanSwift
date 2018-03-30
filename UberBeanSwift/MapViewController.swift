//
//  MapViewController.swift
//  UberBeanSwift
//
//  Created by Chris Eloranta on 2018-03-30.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var userLocationManager = CLLocationManager()

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    userLocationManager.requestWhenInUseAuthorization()
    userLocationManager.delegate = self
    userLocationManager.requestLocation()
    
    mapView.showsUserLocation = true
    mapView.delegate = self
  }
  
  //MARK: Delegate Methods: CLLocationManager
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
  {
    print("locationManager \(manager) didUpdateLocations: \(locations) was called.")
    let userLocation = locations.first
    
    var location = CLLocationCoordinate2D()
    
    if let unwrappedLatitude = userLocation?.coordinate.latitude,
        let unwrappedLongitude = userLocation?.coordinate.longitude
    {
    location.latitude = unwrappedLatitude
    location.longitude = unwrappedLongitude
    }
    
    var span = MKCoordinateSpan()
    let spanDegreesVertical = 0.018
    let spanDegreesHorizontal = 0.018
    span.latitudeDelta = spanDegreesHorizontal
    span.longitudeDelta = spanDegreesVertical
    
    var region = MKCoordinateRegion()
    region.center = location
    region.span = span
    
    mapView.region = region
    view.layoutSubviews()
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
    print("locationManager didFailWithError: \(error) was called.")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
