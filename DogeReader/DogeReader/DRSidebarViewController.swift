//
//  DRSidebarViewController.swift
//  DogeReader
//
//  Created by Juhwan Jeong on 3/29/16.
//  Copyright © 2016 Juhwan Jeong. All rights reserved.
//

import Cocoa

class DRSidebarViewController: NSViewController {

    // MARK: - Lifecycle
    @IBOutlet weak var sourceList: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: We actually want to call below code upon user click on login button
        let authorizeUrlAsString = String(format: "%@?client_id=%@&response_type=%@&state=%@&redirect_uri=%@&duration=%@&scope=%@", DRAppConstants.authorizeUrl, DRAppConstants.clientId, "code", "test", DRAppConstants.redirectUri, "permanent", DRAppConstants.scope)
        let authorizeUrl = NSURL(string: authorizeUrlAsString)
        
        NSWorkspace.sharedWorkspace().openURL(authorizeUrl!)
        
        let appleEventManager = NSAppleEventManager.sharedAppleEventManager()
        appleEventManager.setEventHandler(self, andSelector: #selector(self.handleGetURLEvent(_:replyEvent:)), forEventClass: AEEventClass(kInternetEventClass), andEventID: AEEventID(kAEGetURL))
    }
    
    // MARK: - Private Functions
    func handleGetURLEvent(event: NSAppleEventDescriptor, replyEvent: NSAppleEventDescriptor) {
        let urlAsString = event.paramDescriptorForKeyword(AEKeyword(keyDirectObject))!.stringValue
        let url = NSURL(string: urlAsString!)
        if (url?.scheme == "dogereader") {
            let queryParams = NSArray(array: (url?.query?.componentsSeparatedByString("&"))!)
            let codeParam = queryParams.filteredArrayUsingPredicate(NSPredicate(format: "SELF BEGINSWITH %@", "code="))
            let codeQuery = codeParam[0]
            let code = codeQuery.stringByReplacingOccurrencesOfString("code=", withString: "")
            print("My code is", code)
            
            let body = String(format:"grant_type=%@&code=%@&redirect_uri=%@", "authorization_code", code, DRAppConstants.redirectUri)
            let bodyData: NSData = body.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)!
            let bodyLength: String = String(bodyData.length)
            
            let authorizationString = String(format: "%@:", DRAppConstants.clientId)
            let authorizationData = authorizationString.dataUsingEncoding(NSUTF8StringEncoding)
            let authorizationValue = String(format: "Basic %@", (authorizationData?.base64EncodedStringWithOptions([]))!)
            
            
            let request = NSMutableURLRequest(URL: NSURL(string: DRAppConstants.accessTokenUrl)!)
            request.HTTPMethod = "POST"
            //request.addValue(Constants.clientId, forHTTPHeaderField: "user")
            request.setValue(bodyLength, forHTTPHeaderField: "Content-Length")
            request.setValue(authorizationValue, forHTTPHeaderField: "Authorization")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = bodyData;
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                let responseJson = try!NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
                print(responseJson)
            })
            task.resume()
        }
    }
}
