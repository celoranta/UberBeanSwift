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
  let businessImage: String
  let yelpRating: String
  
  init(fromCafeDictionary dict: NSDictionary)
  {
    print(dict)
    let JsonCoordinates = dict.value(forKey: "coordinates") as! [String:Double]
    let JsonLatitude = JsonCoordinates["latitude"]
    let JsonLongitiude = JsonCoordinates["longitude"]
    let wrappedLatitude = CLLocationDegrees.init(JsonLatitude!)
    let wrappedLongitude = CLLocationDegrees.init(JsonLongitiude!)
    coordinates = CLLocationCoordinate2D.init(latitude: wrappedLatitude,
                                             longitude: wrappedLongitude)
    businessName = dict.value(forKey: "name") as! String
    businessImage = dict["image_url"] as! String
    yelpRating = dict["rating"] as! String
  }
}

//{"id": "revolver-vancouver",
//  "name": "Revolver",
//  "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/RNcD3LjMpA-5LXKgW0rTDA/o.jpg",
//  "is_closed": false,
//  "url": "https://www.yelp.com/biz/revolver-vancouver?adjust_creative=Y3_DSkfENxgUH4zPjbjH_Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=Y3_DSkfENxgUH4zPjbjH_Q",
//  "review_count": 436,
//  "categories": [{"alias": "coffee", "title": "Coffee & Tea"}],
//  "rating": 4.5,
//  "coordinates": {"latitude": 49.283273, "longitude": -123.1094283},
//  "transactions": [],
//  "price": "$$",
//  "location": {"address1": "325 Cambie Street", "address2": "", "address3": "", "city": "Vancouver", "zip_code": "V6B 1H7", "country": "CA", "state": "BC", "display_address": ["325 Cambie Street", "Vancouver, BC V6B 1H7", "Canada"]},
//  "phone": "+16045584444",
//  "display_phone":
//  "+1 604-558-4444",
//  "distance": 170.529247664302}
