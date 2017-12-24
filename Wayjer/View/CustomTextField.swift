//
//  CustomTextField.swift
//  Wayjer
//
//  Created by Abdurrahman on 12/22/17.
//  Copyright © 2017 AR Ehsan. All rights reserved.
//

import UIKit

extension UITextField {
	@IBInspectable var placeHolderColor: UIColor? {
		get {
			return self.placeHolderColor
		}
		set {
			self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
		}
	}
}
