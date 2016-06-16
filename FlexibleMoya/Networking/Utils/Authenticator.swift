//
//  File.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

/// This in reality should be a class that handles login/logout etc.
/// For this demo it will only contain auth token
final class Authenticator {
    
    /// This will play as an AuthToken for logged user and GuestAuthToken for
    /// guests.
    static var authToken: AuthToken?
}
