//
//  NetworkRecorderPlugin.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Result
import Moya

public final class NetworkRecorderPlugin: PluginType {
    
    public func willSendRequest(request: RequestType, target: TargetType) {}
    
    public func didReceiveResponse(result: Result<Moya.Response, Moya.Error>, target: TargetType) {
        switch result {
        case .Failure(_): ()
        case .Success(let response):
            do {
                let text = try response.mapString()
                if let stubsPath = target.stubFileName(forStatusCode: response.statusCode) {
                    try text.writeToFile(stubsPath, atomically: true, encoding: NSUTF8StringEncoding)
                }
            } catch {
                print("There was a problem with recording the request. This mostly happens when you are using phone instead of simulator. If it happens on simulator, please check your settings & path.")
            }
        }
    }
}