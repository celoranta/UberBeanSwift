//
//  NetworkManager.swift
//  UberBeanSwift
//
//  Created by Chris Eloranta on 2018-03-30.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
  
  // Yelp API enpoint parameters for query filter
  
  let distanceFromUser = "radius"
  
  //let whereData: "location" //address and neighborhood information
  //let searchTerm: "term" //Narrows the search by terms
  
  // Yelp API endpoint parameters for object creation
  let dummyLatitude = 49.28
  let dummyLongitude = -123.1
  let latitude = -90.00
  let longitude = 47.00
  let openNow = "open_now"
  
  //let price: String //pricing level
  //let businessType: String //'categories', in case we want to be specific on the map
  //let term: String //search term, may be useful

  var originalYelpTestString: String!
  
  func someFunction()
  {
    let secondYelpTestString =
    """
    "
    curl
    --header "Authorization: Bearer EwwZ3Cj7MsfHZlDn6okqQrhDCJrj-vgDO0VfKF0vqn17jZjfhBUUTOp9im89H3ze-w-RizsHF516c77T0Qynx8BIsO-WnYx" --request "GET" --url "https://api.yelp.com/v3/businesses/search?term=cafe&latitude=49.28&longitude=-123.1&radius=3000&limit=50&open_now
    "
    """
  }
  
}
