//
//  Cafe.swift
//  UberBeanSwift
//
//  Created by Chris Eloranta on 2018-03-30.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

import UIKit

class Cafe: NSObject {

  func someTempFunc(){
    
  let businessName: String
  let coordinates: CLLocation
  let openNow: Bool!
  let businessImage: NSURL?
  let yelpRating: String!
  
    
  let price: String //pricing level
  let businessType: String //'categories', in case we want to be specific on the map
  let term: String //search term, may be useful
  }
  
  init(fromCafeDictionary dict: NSDictionary)
  {
    businessName = dict[0]
    latitude = -90.00
    longitude = 47.00
    openNow = true
    // businessImage
    yelpRating = "Good"
  }
  
}
