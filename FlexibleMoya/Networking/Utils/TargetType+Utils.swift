//
//  TargetType+Utils.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Moya

extension TargetType {
    
    func stubFileName(forStatusCode statusCode: String) -> String? {
        guard let stubsPath = ApiConstants.stubsPath else { return nil }
        if let selfString = "\(self)".componentsSeparatedByString("(").first {
            return "\(stubsPath)\(self.dynamicType)_\(selfString)_\(statusCode).json"
        } else {
            return "\(stubsPath)\(self.dynamicType)_\(self)_\(statusCode).json"
        }
    }
}