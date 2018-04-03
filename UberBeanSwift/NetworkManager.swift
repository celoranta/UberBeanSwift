//
//  NetworkManager.swift
//  UberBeanSwift
//
//  Created by Chris Eloranta on 2018-03-30.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

import UIKit
import CoreLocation

class NetworkManager: NSObject {
  
  var cafeAuRait: [Cafe] = []
  
  
  func updateCafeQueryResults(location: CLLocationCoordinate2D, plottingObjectDestination: @escaping ([Cafe])-> Void)
  {
    let latitude:Double = (Double)(location.latitude)
    let longitude:Double = (Double)(location.longitude)
    let yelpAPIURLString = "https://api.yelp.com/v3/businesses/search?term=cafe&latitude=\(latitude)5&longitude=\(longitude)"
    let yelpAPIURL = URL(string: yelpAPIURLString)!
    var request = URLRequest.init(url: yelpAPIURL)
    request.addValue("Bearer EwwZ3Cj7MsfHZlDn6okqQrhDCJrj-vgDO0VfKF0vqn17jZjfhBUUTOp9im89H3zv9HiXMVEdBWAf_IQxcQDm0hF_F8PUuaC0e-w-RizsHF516c77T0Qynx8BIsO-WnYx", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        self.handleClientError(error)
        return
      }
      let data = data
      //temporary fatal guard ... to be error handled
      guard let jsonUnwrapped = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
        else{
          fatalError()
      }
      
      guard let dictionaryUnwrapped = try? jsonUnwrapped!["businesses"] as! [[String:Any]]
        else{
          //   temporary fatal guard
          fatalError()
      }
      for cafe in dictionaryUnwrapped
      {
        print(cafe)
        let cafeObject = Cafe(fromCafeDictionary: cafe)
        self.cafeAuRait.append(cafeObject)
      }
      DispatchQueue.main.async {
      plottingObjectDestination(self.cafeAuRait)
      }
    }
    task.resume()
  }
  
  //should use optional binding
  func handleServerError(_: URLResponse!)
  {
    
  }
  
  //should use optional binding
  func handleClientError(_: Error!)
  {
    
  }
}

//   let secondYelpTestString =
//    """
//    curl \
//    --header "Authorization: Bearer EwwZ3Cj7MsfHZlDn6okqQrhDCJrj-vgDO0VfKF0vqn17jZjfhBUUTOp9im89H3zv9HiXMVEdBWAf_IQxcQDm0hF_F8PUuaC0e-w-RizsHF516c77T0Qynx8BIsO-WnYx" \
//    --request "GET"
//    """

/*
 // Creates a URL object from a string
 NSString *urlString = @"https://swapi.co/api/people";
 NSURL *url = [NSURL URLWithString:urlString];
 
 // Creates a data task for my URL, but nothing happens right away, 2-step process, see [dataTask resume] below
 NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
 // This code is executed when the URL request is completed, after the [dataTask resume] line below. This code block is in the background thread
 
 if (error != nil) {
 // Do complex error processing here
 // We return here so that we don't continue processing the rest of the block, i.e. no point in parsing the returned data
 return;
 }
 
 // This line says to execute the following block in the main queue (dispatch_get_main_queue()), and the async means to kick it off now and resume execution in the line following this code block
 dispatch_async(dispatch_get_main_queue(), ^{
 // The following line will be executed in the main thread
 // It needs to be on the main thread because we're updating a UI element (the UILabel
 self.label.text = @"Data retrieved, parsing now...";
 });
 
 // This line is executed right after the above code block is queued up
 // So let's parse the retrieved data
 [self parseResponseData:data];
 }];
 
 // Execute ("start") the task in a background thread, we don't specify which thread, the task knows it'll be a background thread
 // This executes before the code in the completion block
 [dataTask resume];
 }
 
 - (void)parseResponseData:(NSData *)data {
 // Convert NSData object to a JSON object. It's an "id" type because it can either be an NSArray or an NSDictionary
 NSError *error = nil;   // Declare a pointer to an NSError here, the following call will change this pointer to point to a valid NSError object if an error occurs
 id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
 
 // Check for error
 if (error != nil) {
 // Error in parsing NSData
 dispatch_async(dispatch_get_main_queue(), ^{
 self.label.text = @"Error!";
 });
 
 // Do complex error processing here
 return;
 }
 
 // Confirm that JSON object is a dictionary
 if ([jsonObject isKindOfClass:[NSDictionary class]]) {
 NSDictionary *jsonDict = (NSDictionary *)jsonObject;
 
 // We're done processing, go back to the main loop
 dispatch_async(dispatch_get_main_queue(), ^{
 // Back in the main loop
 self.label.text = @"Completed parsing!";
 NSLog(@"Retrieved dictionary: %@", jsonDict);
 });
 }
 }
 */
