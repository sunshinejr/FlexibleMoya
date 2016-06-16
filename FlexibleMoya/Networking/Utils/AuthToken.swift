//
//  AuthToken.swift
//  FlexibleMoya
//
//  Created by Lukasz Mroz on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Foundation

struct AuthToken {
    let token: String
    let type: String
    let expires: NSDate
}
