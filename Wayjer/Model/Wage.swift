//
//  Wage.swift
//  Wayjer
//
//  Created by Abdurrahman on 12/23/17.
//  Copyright © 2017 AR Ehsan. All rights reserved.
//

import Foundation

class Wage {
	class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
		return Int(ceil(price / wage))
	}
}
