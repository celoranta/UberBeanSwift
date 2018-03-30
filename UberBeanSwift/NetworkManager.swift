//
//  NetworkManager.swift
//  UberBeanSwift
//
//  Created by Chris Eloranta on 2018-03-30.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
  
  let dummyLatitude = 49.28
  let dummyLongitude = -123.1

  var originalYelpTestString: String!
  
  func someFunction()
  {
  self.originalYelpTestString =
  """
curl
  --header "Authorization: Bearer EwwZ3Cj7MsfHZlDe-w-RizsHF516c77T0Qynx8BIsO-WnYx"
  --request "GET"
  --url "https://api.yelp.com/v3/businesses/search?term=cafe&latitude=\(dummyLatitude)
  &longitude=\(dummyLongitude)"
"""
  }
  
}
