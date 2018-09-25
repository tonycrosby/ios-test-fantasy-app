//
//  ClubMapper.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/29/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import Foundation

class ClubMapper {
    
    func MapClub(clubEnum: ClubEnum) -> Club {
        var club: Club = Club()
        
        switch clubEnum {
        case .carlton:
            club.name = "Carlton Blues"
            club.logoUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/2/24/Carlton_FC_logo.svg/1200px-Carlton_FC_logo.svg.png"
        case .collingwood:
            club.name = "Collingwood Magpies"
            club.logoUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/0/01/Collingwood_Football_Club_Logo.svg/829px-Collingwood_Football_Club_Logo.svg.png"
        case .eagles:
            club.name = "West Coast Eagles"
            club.logoUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/3/35/West_Coast_Eagles_logo.svg/1280px-West_Coast_Eagles_logo.svg.png"
        case .essendon:
            club.name = "Essendon Bombers"
            club.logoUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/8/8b/Essendon_FC_logo.svg/936px-Essendon_FC_logo.svg.png"
        case .hawthorn:
            club.name = "Hawthorn Hawks"
            club.logoUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/6/62/Hawthorn-football-club-brand.svg/1113px-Hawthorn-football-club-brand.svg.png"
        case .richmond:
            club.name = "Richmond Tigers"
            club.logoUrl = "http://logos-download.com/wp-content/uploads/2016/05/Richmond_Tigers_logo_transparent_bg.png"
        case .sydney:
            club.name = "Sydney Swans"
            club.logoUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Sydney_Swans_Logo.svg/850px-Sydney_Swans_Logo.svg.png"
        default:
            club.name = "Unknown"
        }
        
        return club
    }
}
