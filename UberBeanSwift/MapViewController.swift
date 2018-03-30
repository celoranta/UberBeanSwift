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

var locationManager = CLLocationManager()

class MapViewController: UIViewController {
  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
    
    var location = CLLocationCoordinate2D()
    let dummyLatitude = 47.00
    let dummyLongitude = -90.00
    location.latitude = dummyLatitude
    location.longitude = dummyLongitude
    
    var span = MKCoordinateSpan()
    let spanDegreesVertical = 5.0
    let spanDegreesHorizontal = 5.0
    span.latitudeDelta = spanDegreesHorizontal
    span.longitudeDelta = spanDegreesVertical
    
    var region = MKCoordinateRegion()
    region.center = location
    region.span = span
    
    mapView.region = region
    view.layoutSubviews()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
