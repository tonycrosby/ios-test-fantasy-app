//
//  UserDefaultsHelper.swift
//  FinalApp
//
//  Created by Tony Crosby on 12/4/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    func GetBalance() -> Int {
        guard let balance = UserDefaults.standard.object(forKey: "Balance") else {
            SetBalance(newBalance: 10000000)
            return 10000000
        }
        return balance as! Int
    }
    
    func SetBalance(newBalance: Int) -> () {
        UserDefaults.standard.set(newBalance, forKey: "Balance")
    }
    
    func ReduceBalance(amount: Int) -> () {
        let balance = GetBalance()
        SetBalance(newBalance: balance - amount)
    }
    
    func IncreaseBalance(amount: Int) -> Int {
        let newBalance = GetBalance() + amount
        SetBalance(newBalance: newBalance)
        return newBalance
    }
    
    func GetPurchasedPlayers() -> [PurchasedPlayer] {
        guard let data = UserDefaults.standard.data(forKey: "PurchasedPlayers") else {
            return [PurchasedPlayer]()
        }

        let players = NSKeyedUnarchiver(forReadingWith: data).decodeDecodable([PurchasedPlayer], forKey: "PurchasedPlayers") as! [PurchasedPlayer]
        return players
    }
    
    func RemovePurchasedPlayer(player: PurchasedPlayer) -> [PurchasedPlayer] {
        var players = GetPurchasedPlayers()
        if let index = players.index(where: { $0.playerId == player.playerId }) {
            players.remove(at: index)
        }
        return players
    }
    
    func AddPurchasedPlayer(player: PurchasedPlayer) -> [PurchasedPlayer] {
        var players = GetPurchasedPlayers()
        players.append(player)
        let keyedArchiver = NSKeyedArchiver()
        
        do {
            try keyedArchiver.encodeEncodable(players, forKey: "PurchasedPlayers")
        }
        catch {
            
        }
        UserDefaults.standard.set(keyedArchiver.encodedData, forKey: "PurchasedPlayers")
        
        return players
    }
}
