//
//  GitHubAPI.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Foundation
import Moya

enum GitHubAPI {
    case UserProfile(String)
    case FailableUserProfile(String) // For stubbing purposes
}

extension GitHubAPI: StubbableTargetType {
    var baseURL: NSURL { return NSURL(string: "https://api.github.com")! }
    
    var path: String {
        switch self {
        case .UserProfile(let name):
            return "/users/\(name.URLEscapedString)"
        case .FailableUserProfile:
            return "/users/." // There is no user with name ., so we will get 404 for our stub
        }
    }
    
    var method: Moya.Method {
        return .GET
    }
    
    var parameters: [String: AnyObject]? {
        return nil
    }
    
    var stubStatusCode: Int {
        switch self {
        case .FailableUserProfile:
            return 404
        default:
            return 200
        }
    }
}

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}