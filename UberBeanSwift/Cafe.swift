//
//  Cafe.swift
//  UberBeanSwift
//
//  Created by Chris Eloranta on 2018-03-30.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Cafe: NSObject {

  let businessName: String
  let coordinates: CLLocationCoordinate2D
  let openNow: Bool
  let businessImage: NSURL
  let yelpRating: String
  
  //let price: String //pricing level
  //let businessType: String //'categories', in case we want to be specific on the map
  
  init(fromCafeDictionary dict: NSDictionary)
  {
    let businessArray = dict[1] as! [NSDictionary]
//    let cafeRating = dict.type(of: init)(object: Int, forKey: "rating")
//    "price":String
//    "phone":String
//    "is_closed":Bool
//    "name":String
//    "url":String
//    "coordinates":[String:Double]
//    "image_url":String
//    "location":[String:String]
    
    print(dict)
    let latitude = -90.00 //dummy
    let longitude = 47.00 //dummy
    let wrappedLatitude = CLLocationDegrees.init(latitude)
    let wrappedLongitude = CLLocationDegrees.init(longitude)
    let location = CLLocationCoordinate2D.init(latitude: wrappedLatitude,
                                               longitude: wrappedLongitude)
    self.businessName = "dummyDefault"
    self.coordinates = location
    self.openNow = true
    self.businessImage = NSURL.fileURL(withPath: "https://fakeurl") as NSURL
    self.yelpRating = "default"
  }
}


//{
//  "total": 8228,
//  "businesses": [
//  {
//  "rating": 4,
//  "price": "$"
