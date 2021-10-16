//
//  TableKeys.swift
//  FacebookMe
//
//  Created by 🙈 🙊 on 2021/10/14.
//

import Foundation

public struct TableKeys {
    static let Section = "section"
    static let Rows = "rows"
    static let ImageName = "imageName"
    static let Title = "title"
    static let subTitle = "subtitle"
    static let seeMore = "See more..."
    static let addFavorites = "Add Favorites..."
    static let logout = "Log Out"
    static let goodbye = "goodbye"
    
    static func populate(withUser user: FBMeUser) -> [[String: Any]] {
        return[
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName: user.avatarName, TableKeys.Title: user.name, TableKeys.subTitle: "View your profile"]
                ]
            ],
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName: Specs.imageName.friends, TableKeys.Title: "Friends"],
                    [TableKeys.ImageName: Specs.imageName.events, TableKeys.Title: "Events"],
                    [TableKeys.ImageName: Specs.imageName.groups, TableKeys.Title: "Groups"],
                    [TableKeys.ImageName: Specs.imageName.education, TableKeys.Title: user.education],
                    [TableKeys.ImageName: Specs.imageName.townHall, TableKeys.Title: "Town Hall" ],
                    [TableKeys.Title: TableKeys.seeMore],
                    [TableKeys.Title: TableKeys.goodbye]
                ]
            ],
        
        [
            TableKeys.Section: "FAVORITES",
            TableKeys.Rows: [
                [TableKeys.Title: TableKeys.addFavorites]
            ]
        ],
            [
                TableKeys.Rows:[
                [TableKeys.ImageName: Specs.imageName.settings, TableKeys.Title: "Setting"],
                [TableKeys.ImageName: Specs.imageName.privacyShortcuts, TableKeys.Title: "Privacy Shortcuts"],
                [TableKeys.ImageName: Specs.imageName.helpSupport, TableKeys.Title: "Help and Support"]
            ]
        ],
        [
            TableKeys.Rows:[
                [TableKeys.Title: TableKeys.logout]
            ]
        ]
    ]
  }
}
