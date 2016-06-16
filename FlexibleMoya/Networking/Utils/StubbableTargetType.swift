//
//  StubbableTargetType.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Moya

enum AuthTokenPresence {
    case Nowhere
    case InHeaders
    case InParameters
}

enum AuthTokenTypeRequired {
    case Nope
    case GuestToken
    case AuthToken
}

protocol StubbableTargetType: TargetType {
    
    var stubStatusCode: Int { get }
    /// Should auth token be present in the request? If yes, where?
    var authTokenPresence: AuthTokenPresence { get }
    /// If AuthTokenPresence != .Nowhere, specify what token type is required
    var authTokenTypeRequired: AuthTokenTypeRequired { get }
}

extension StubbableTargetType {
    
    var stubStatusCode: Int {
        return 200
    }
    
    var sampleData: NSData {
        guard let stubFile = stubFileName(forStatusCode: stubStatusCode),
            data = NSData(contentsOfFile: stubFile) else { return NSData() }
        
        return data
    }
    
    var authTokenPresence: AuthTokenPresence {
        return .Nowhere
    }
    
    var authTokenTypeRequired: AuthTokenTypeRequired {
        return .Nope
    }
}