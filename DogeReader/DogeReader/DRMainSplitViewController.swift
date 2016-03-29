//
//  DRMainSplitViewController.swift
//  DogeReader
//
//  Created by Juhwan Jeong on 3/29/16.
//  Copyright © 2016 Juhwan Jeong. All rights reserved.
//

import Cocoa

class DRMainSplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // Load user account
        /*
        let redditUrl = "http://www.reddit.com"
        let actualUrl = redditUrl.stringByAppendingString("/subreddits/emochoco/subscriber")
        
        let urlObject = NSURL(string: actualUrl)
        let request = NSMutableURLRequest(URL: urlObject!)
        request.HTTPMethod = "GET"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                    // Get value by key
                    let firstNameValue = convertedJsonIntoDict["userName"] as? String
                    print(firstNameValue!)
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
         */
        
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
}
