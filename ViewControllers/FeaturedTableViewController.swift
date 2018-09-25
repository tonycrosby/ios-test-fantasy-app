//
//  FeaturedTableViewController.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/28/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import UIKit
import Alamofire

class FeaturedTableViewController: UITableViewController {
    
    var featuredPlayers : [Player] = [Player]()
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
        featuredPlayers = playerHelper.GetFeaturedPlayers()
        self.tableView.reloadData()
    }
    
    func refreshData() {
        fetchData()
        self.refreshControl?.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
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
        return featuredPlayers.count
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "featuredPlayerCell", for: indexPath) as! FeaturedPlayerTableViewCell
        
        var featuredPlayer = featuredPlayers[indexPath.row]
        cell.nameLabel.text = "\(featuredPlayer.firstName) \(featuredPlayer.lastName)"
        let dividedPrice = Double(featuredPlayer.price) / 1000000.00
        cell.priceLabel.text = String(format: "%.02f", dividedPrice)
        
        var bla : Double
        bla = 2.4
        bla.round()
        
        let playerLoader = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        playerLoader.frame = CGRect(x: (cell.playerImageView.frame.size.width - 40)/2, y:(cell.playerImageView.frame.size.height-40)/2, width: 40.0, height: 40.0)
        cell.playerImageView.addSubview(playerLoader)
        playerLoader.startAnimating()
   
        let imageRequestHelper = ImageRequestHelper()
        imageRequestHelper.GetImage(imageURL: featuredPlayer.imageURL, callback: { imageData in
                let image = UIImage(data: imageData)
                cell.playerImageView?.image = image
                featuredPlayer.imageData = imageData
                cell.setNeedsLayout()
                playerLoader.stopAnimating()
        })
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.safeAreaLayoutGuide.layoutFrame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "playersToDetailsSegue") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let playerDetailViewController:PlayerDetailViewController = segue.destination as! PlayerDetailViewController
                let playerDetail = featuredPlayers[indexPath.row]
                playerDetailViewController.playerDetail = playerDetail
            }
        }
    }
    
}
