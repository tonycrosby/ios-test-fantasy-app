//
//  PurchasedPlayer.swift
//  FinalApp
//
//  Created by Tony Crosby on 12/4/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import Foundation

struct PurchasedPlayer : Codable {
    
    var playerId: Int
    var playerPrice: Int
    
    init(playerId: Int, playerPrice: Int) {
        self.playerId = playerId
        self.playerPrice = playerPrice
    }
}
