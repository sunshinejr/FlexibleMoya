//
//  ApiConstants.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Foundation

struct ApiConstants {
    
    static var stubsPath: String? = {
        guard let infoPlist = NSBundle.mainBundle().infoDictionary,
            stubsPath = infoPlist["StubsDirectoryPath"] as? String else { return nil }
        
        return stubsPath
    }()
}