//
//  File.swift
//  Promos
//
//  Created by Imad Ajallal on 12/24/16.
//  Copyright © 2016 Imad Ajallal. All rights reserved.
//

import Foundation

class Promo
{
	var promoType : String?
	var promoPrice : String?
	var operateur : String?
	var promoDescription : String?
	var Valable : Date?
	
	 init(ptype : String? , pPrice : String? , pOperateur : String? ){
		
		promoType = ptype
		promoPrice = pPrice
		operateur = pOperateur
		
	}
}
