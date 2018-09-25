//
//  PlayersTableViewController.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/28/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import UIKit
import Alamofire

class PlayersTableViewController: UITableViewController {

    var players : [Player] = [Player]()
    let loader = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.frame = CGRect(x: (self.view.frame.size.width - 40)/2, y:(self.view.frame.size.height-40)/2, width: 40.0, height: 40.0)
        self.tableView.addSubview(loader)
        loader.startAnimating()
        
        self.refreshControl?.addTarget(self, action: #selector(FeaturedTableViewController.refreshData), for: UIControlEvents.valueChanged)
        
        fetchData()
        loader.stopAnimating()
    }
    
    func fetchData() {
        let playerHelper = PlayerHelper()
        let playerFilter = PlayerFilter()
        players = playerHelper.GetPlayers(filter: playerFilter)
        self.tableView.reloadData()
    }
    
    func refreshData() {
        fetchData()
        self.refreshControl?.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        
        var player = players[indexPath.row]
        cell.nameLabel.text = "\(player.firstName) \(player.lastName)"
        cell.clubLabel.text = player.clubData?.name
        let dividedPrice = Double(player.price) / 1000000.00
        cell.priceLabel.text = String(format: "$%.02fm", dividedPrice)
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if (segue.identifier == "playersToDetailsSegue") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let playerDetailViewController:PlayerDetailViewController = segue.destination as! PlayerDetailViewController
                let playerDetail = players[indexPath.row]
                playerDetailViewController.playerDetail = playerDetail
            }
        }
    }
}
