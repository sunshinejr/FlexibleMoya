//
//  MoyaUtils.swift
//  FlexibleMoya
//
//  Created by Lukasz Mroz on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

//import Foundation
import Moya

struct MoyaUtils {
    
    static func endpointClosure<T: StubbableTargetType>() -> (target: T) -> Endpoint<T> {
        return { target in
            let endpoint = Endpoint<T>(URL: self.url(target), sampleResponseClosure: {.NetworkResponse(target.stubStatusCode, target.sampleData)}, method: target.method, parameters: target.parameters).endpointByAdding(httpHeaderFields: ["Content-type": "application/x-www-form-urlencoded"])
            
            if case .Nowhere = target.authTokenPresence {
                return endpoint
            }
            
            if let authToken = Authenticator.authToken?.token {
                switch target.authTokenPresence {
                case .InHeaders:
                    return endpoint.endpointByAddingHTTPHeaderFields(["Authorization": "Bearer \(authToken)"])
                case .InParameters:
                    return endpoint.endpointByAddingParameters(["access_token": authToken])
                default: ()
                }
            }
            
            return endpoint
        }
    }
    
    static private func url(route: StubbableTargetType) -> String {
        return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
    }
}