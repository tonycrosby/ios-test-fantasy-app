//
//  AccountViewController.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/28/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var playersTableView: UITableView!
    
    var purchasedPlayers: [PurchasedPlayer]?
    var players: [Player]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let playerHelper = PlayerHelper()
        let userDefaultsHelper = UserDefaultsHelper()
        let purchasedPlayers = userDefaultsHelper.GetPurchasedPlayers()
        let allPlayers = playerHelper.GetPlayers(filter: nil)
        players = PlayerHelper.MapPurchasedPlayersToPlayers(purchasedPlayers: purchasedPlayers, players: allPlayers)
        playersTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersTableView.delegate = self
        playersTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (players?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        
        var player = players![indexPath.row]
        cell.nameLabel.text = "\(player.firstName) \(player.lastName)"
        cell.clubLabel.text = player.clubData?.name
        let dividedPrice = Double(player.price) / 1000000.00
        cell.priceLabel.text = String(format: "Purchased for: $%.02fm", dividedPrice)
        
        let playerLoader = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        playerLoader.frame = CGRect(x: (cell.playerImageView.frame.size.width - 40)/2, y:(cell.playerImageView.frame.size.height-40)/2, width: 40.0, height: 40.0)
        cell.playerImageView.addSubview(playerLoader)
        playerLoader.startAnimating()
        
        let imageRequestHelper = ImageRequestHelper()
        imageRequestHelper.GetImage(imageURL: player.imageURL, callback: { imageData in
            let image = UIImage(data: imageData)
            cell.playerImageView?.image = image
            player.imageData = imageData
            cell.setNeedsLayout()
            playerLoader.stopAnimating()
            
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "accountToPlayerDetailSegue") {
            if let indexPath = playersTableView.indexPathForSelectedRow {
                let playerDetailViewController:PlayerDetailViewController = segue.destination as! PlayerDetailViewController
                let playerDetail = players?[indexPath.row]
                playerDetailViewController.playerDetail = playerDetail
            }
        }
    }
}
