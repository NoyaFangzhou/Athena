//
//  UserIdentityAccess.swift
//  Athena
//
//  Created by Laura Bochenek on 4/8/17.
//  Copyright © 2017 Laura Bochenek. All rights reserved.
//

import Foundation
import AWSMobileHubHelper

class UserIdentityAccess {
    
    func getUserIdentity() -> String {
        return AWSIdentityManager.default().identityId!
    }
}
