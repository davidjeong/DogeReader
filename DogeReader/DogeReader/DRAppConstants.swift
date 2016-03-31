//
//  DRAppConstants.swift
//  DogeReader
//
//  Created by Juhwan Jeong on 3/31/16.
//  Copyright © 2016 Juhwan Jeong. All rights reserved.
//  
//  Constants used by the application.
//

import Foundation

class DRAppConstants {

    // MARK: - App Specific IDs
    static var clientID: String {
        return "1H3TJGmThSHMgQ"
    }
    static var redirectURI: String {
        return "dogereader://response"
    }
    
    // MARK: - Reddit Permissions
    static var scope: String {
        return "identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread"
    }
    
    struct ApplicationInfo {
        static var loggedIn: Bool = false
        static var accessToken: String = ""
    }

    // MARK: - Required URLs
    struct Endpoints {
        static let redditURL = "https://www.reddit.com"
        
        static let accessTokenURL = "/api/v1/access_token"
        static let authorizeURL = "/api/v1/authorize"
        
        static let meURL = "/api/v1/me"
    }
    
    // MARK: - Public Functions
    static func buildURL(endpointURL: String) -> String {
        return String(format: "%@%@", Endpoints.redditURL, endpointURL)
    }
}
