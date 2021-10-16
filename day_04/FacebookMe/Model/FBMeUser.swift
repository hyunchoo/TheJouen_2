//
//  FBMeUser.swift
//  FacebookMe
//
//  Created by 🙈 🙊 on 2021/10/14.
//

import UIKit

class FBMeUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "bayMax", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
