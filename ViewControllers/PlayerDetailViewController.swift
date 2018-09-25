//
//  PlayerDetailViewController.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/29/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import UIKit
import WebKit

class PlayerDetailViewController: UIViewController {
    
    var playerDetail : Player?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var clubImageView: UIImageView!
    @IBOutlet weak var clubImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fantasyView: UIView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var fantasyButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var bioButton: UIButton!
    @IBOutlet weak var fantasyBarView: UIView!
    @IBOutlet weak var statsBarView: UIView!
    @IBOutlet weak var bioBarView: UIView!
    @IBOutlet weak var bioWebView: WKWebView!
    @IBOutlet weak var fantasyPriceLabel: UILabel!
    @IBOutlet weak var fantasyLastPriceLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var debutLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    
    var purchasedPlayers: [PurchasedPlayer]
    var userCanPurchasePlayer: Bool
    var userDefaultsHelper: UserDefaultsHelper?
    
    @IBAction func buttonPressed(_ sender: Any) {
    
        let blueBgColor = UIColor(red: 0, green: 44, blue: 132, alpha: 1)
        let whiteBgColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        fantasyView.isHidden = true
        statsView.isHidden = true
        bioView.isHidden = true
        fantasyBarView.backgroundColor = whiteBgColor
        statsBarView.backgroundColor = whiteBgColor
        bioBarView.backgroundColor = whiteBgColor
        
        if(fantasyButton === sender as AnyObject) {
            fantasyView.isHidden = false
            fantasyBarView.backgroundColor = blueBgColor
        }
        if(statsButton === sender as AnyObject) {
            statsView.isHidden = false
            statsBarView.backgroundColor = blueBgColor
        }
        if(bioButton === sender as AnyObject) {
            bioView.isHidden = false
            bioBarView.backgroundColor = blueBgColor
        }
        if(buyButton === sender as AnyObject) {
            let buttonText = userCanPurchasePlayer ? "Are you sure you wish to buy this player?" : "Are you sure you wish to sell this player?"
         
            let alert = UIAlertController(title: "Confirm Trade",
                                          message: buttonText,
                                          preferredStyle: .alert)
            
            let submitAction = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
                let player = PurchasedPlayer(playerId: (self.playerDetail?.id)!, playerPrice: (self.playerDetail?.price)!)
                if self.userCanPurchasePlayer {
                    self.userDefaultsHelper?.ReduceBalance(amount: (self.playerDetail?.price)!)
                    self.userDefaultsHelper?.AddPurchasedPlayer(player: player)
                    self.userCanPurchasePlayer = false
                }
                else {
                    self.userDefaultsHelper?.IncreaseBalance(amount: (self.playerDetail?.price)!)
                    self.userDefaultsHelper?.RemovePurchasedPlayer(player: player)
                    self.userCanPurchasePlayer = true
                }
                self.setBuyButtonText()
            })
            
            let cancel = UIAlertAction(title: "No", style: .destructive, handler: { (action) -> Void in })
            
            alert.addAction(submitAction)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            self.fantasyView.isHidden = false
            self.fantasyBarView.backgroundColor = blueBgColor
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        purchasedPlayers = UserDefaultsHelper().GetPurchasedPlayers()
        userCanPurchasePlayer = false
        super.init(coder: aDecoder)
        userCanPurchasePlayer = !userHasPurchasedPlayer()
        userDefaultsHelper = UserDefaultsHelper()
    }
    
    func userHasPurchasedPlayer() -> Bool {
        return purchasedPlayers.contains { element in
            return element.playerId == playerDetail?.id
        }
    }
    
    func setBuyButtonText()  -> () {
        let title = userCanPurchasePlayer ? "Buy" : "Sell"
        buyButton.setTitle(title, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(playerDetail!.firstName) \(playerDetail!.lastName)"
        setBuyButtonText()
        
        let imageRequestHelper = ImageRequestHelper()
        imageRequestHelper.GetImage(imageURL: (playerDetail?.clubData?.logoUrl)!, callback: { imageData in
            self.clubImageView.image = UIImage(data: imageData)
        })
        
        if playerDetail?.imageData == nil {
            imageRequestHelper.GetImage(imageURL: (playerDetail?.imageURL)!, callback: { imageData in
                let image = UIImage(data: imageData)
                self.playerImageView.image = image
                self.clubImageWidthConstraint.constant = ((image?.size.width)! / (image?.size.height)!) * 150
            })
        }
        
        let dividedPrice = Double((playerDetail?.price)!) / 1000000.00
        
        bioWebView.loadHTMLString((playerDetail?.bio)!, baseURL: nil)
        fantasyPriceLabel.text = String(format: "$%.02fm", dividedPrice)
        fantasyLastPriceLabel.text = playerDetail?.lastPriceDate
        ageLabel.text = "\((playerDetail?.age)!)"
        goalsLabel.text = "\((playerDetail?.careerGoals)!)"
        debutLabel.text = "\((playerDetail?.debut)!)"
        positionLabel.text = playerDetail?.position
        heightLabel.text = "\((playerDetail?.height)!)"
        weightLabel.text = "\((playerDetail?.weight)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
