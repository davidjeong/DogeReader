//
//  DRSubreddit.swift
//  DogeReader
//
//  Created by Juhwan Jeong on 4/8/16.
//  Copyright © 2016 Juhwan Jeong. All rights reserved.
//
//  Has all models required for Doge Reader.

import Cocoa

class DRModelManager {
    static let sharedInstance = DRModelManager();
    var account: DRAccount;
    
    private init() {
        account = DRAccount(username: "");
    }
}

class DRAccount: NSObject {
    var username : String
    var mySubreddits: [DRSubreddit] = []
    
    init(username: String) {
        self.username = username;
    }
    
    func addToMySubreddits(subreddit: DRSubreddit) {
        self.mySubreddits.append(subreddit);
    }
}

class DRSubreddit: NSObject {

    let subreddit : String
    let url : String
    init (subreddit:String, url: String) {
        self.subreddit = subreddit;
        self.url = url;
    }
    
}
