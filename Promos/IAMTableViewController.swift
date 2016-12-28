//
//  PromosTableViewController.swift
//  Promos
//
//  Created by Imad Ajallal on 12/23/16.
//  Copyright © 2016 Imad Ajallal. All rights reserved.
//

import UIKit
import Parse

class IAMTableViewController: UITableViewController {
    var promos = [Promo]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    var refresher : UIRefreshControl!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        queryPromos()
        self.clearsSelectionOnViewWillAppear = true
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(IAMTableViewController.queryPromos), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)
    }
	
	func queryPromos(){
            clearPreviousPromos()
			let query = PFQuery(className: "Promo")
			query.whereKey("operateur", equalTo: "iam")
			query.findObjectsInBackground { (objects, error) in
				if error == nil {
					if let retrievedObjects = objects {
						for retrievedObject in retrievedObjects {
							let promo = Promo(
								ptype: retrievedObject.object(forKey: "promoType") as? String,
								pPrice: retrievedObject.object(forKey: "promoPrice") as? String,
								pOperateur: retrievedObject.object(forKey: "operateur") as? String
							)
							self.promos.append(promo)
                            self.refresher.endRefreshing()
						}
					}
				}
			}
       // tableView.reloadData()
	}
	
	// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return promos.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "promoCell") as? PromoCell
			cell?.promoPriceCellLabel.text = promos[indexPath.row].promoPrice
			cell?.promoOperateurCellLabel.text = promos[indexPath.row].operateur
			cell?.promoTypeCellLabel.text = promos[indexPath.row].promoType
        return cell!
    }
    
    func clearPreviousPromos(){
        
        self.promos = []
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
