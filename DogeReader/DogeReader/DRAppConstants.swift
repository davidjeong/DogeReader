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
    static var clientId: String {
        return "1H3TJGmThSHMgQ"
    }
    
    // MARK: - Reddit Permissions
    static var scope: String {
        return "identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread"
    }

    // MARK: - Required URLs
    static var accessTokenUrl: String {
        return "https://www.reddit.com/api/v1/access_token"
    }
    static var authorizeUrl: String {
        return "https://www.reddit.com/api/v1/authorize"
    }
    static var redirectUri: String {
        return "dogereader://response"
    }
}
