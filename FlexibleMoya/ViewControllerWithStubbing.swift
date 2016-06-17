//
//  ViewControllerWithStubbing.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Moya
import UIKit

/// This controller shows how to use stubs instead of network. The only change 
/// is to add "stubClosure: MoyaProvider.ImmediatelyStub" in the provider init.
/// So in real-life app, you don't need to create 2 controllers, one for network
/// and one for stubbing - just when you want to use stubs, add this to your init,
/// otherwise just delete it - reallt simple!
class ViewControllerWithStubbing: UIViewController {
    
    let provider = MoyaProvider<GitHubAPI>(endpointClosure: MoyaUtils.endpointClosure(),
                                           stubClosure: MoyaProvider.ImmediatelyStub,
                                           plugins: [NetworkRecorderPlugin()])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Now we try to use our stubs, if there isn't any files matching we will
        // get empty NSData, which will be an empty response.
        // Here we change the name to check if we get the stub with "sunshinejr"
        // or the actual response with "test" username.
        provider
            .request(.UserProfile("test")) { result in
                let json = try? result.value?.mapJSON()
                
                print("Success results: \(json)")
        }
        
        provider
            .request(.FailableUserProfile("sunshinejr")) { result in
                let json = try? result.value?.mapJSON()
                
                print("Success results: \(json)")
        }
    }
}