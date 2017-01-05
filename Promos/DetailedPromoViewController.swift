//
//  DetailedPromoViewController.swift
//  Promos
//
//  Created by Imad Ajallal on 1/5/17.
//  Copyright © 2017 Imad Ajallal. All rights reserved.
//

import UIKit

class DetailedPromoViewController: UIViewController {
    
    var promo = Promo(ptype: "", pPrice: "", pOperateur: "")
    
    @IBOutlet weak var detailPromoLabel: UILabel!

    @IBOutlet weak var detailPromoTypeLabel: UILabel!
    
    @IBOutlet weak var detailPromoPriceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailPromoLabel.text = promo.operateur
        detailPromoTypeLabel.text = promo.promoType
        detailPromoPriceLabel.text = promo.promoPrice
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
