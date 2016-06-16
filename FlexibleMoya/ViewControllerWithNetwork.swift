//
//  ViewController.swift
//  FlexibleMoya
//
//  Created by Sunshinejr on 16.06.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Moya
import UIKit

/// In this controller we see how we can "record" network requests.
class ViewControllerWithNetwork: UIViewController {

    let provider = MoyaProvider<GitHubAPI>(endpointClosure: MoyaUtils.endpointClosure(), plugins: [NetworkRecorderPlugin()])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Now we record both cases, success & error
        provider
            .request(.UserProfile("sunshinejr")) { result in
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

