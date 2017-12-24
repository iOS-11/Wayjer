//
//  WayjerViewController.swift
//  Wayjer
//
//  Created by Abdurrahman on 12/21/17.
//  Copyright © 2017 AR Ehsan. All rights reserved.
//

import UIKit

class WayjerViewController: UIViewController {
	
	@IBOutlet weak var wageTextField: UITextField!
	@IBOutlet weak var priceTextField: UITextField!
	
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var hoursLabel: UILabel!
	@IBOutlet weak var calculateButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		wageTextField.becomeFirstResponder()
		
		resultLabel.text = ""
		hoursLabel.text = ""
		setupCalculateButton()
	}

	func setupCalculateButton() {
		let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
		calcButton.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
		calcButton.setTitle("Calculate", for: .normal)
		calcButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
		calcButton.titleLabel!.font = UIFont(name: "AvenirNext-DemiBold", size: 23.0)
		calcButton.addTarget(self, action: #selector(WayjerViewController.calculate), for: .touchUpInside)
		
		wageTextField.inputAccessoryView = calcButton
		priceTextField.inputAccessoryView = calcButton
	}
	
	@objc func calculate() {
		if let wageText = wageTextField.text, let priceText = priceTextField.text {
			if let wage = Double(wageText), let price = Double(priceText) {
				view.endEditing(true)
				resultLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
				if Wage.getHours(forWage: wage, andPrice: price) <= 1 {
					hoursLabel.text = "Hour"
				} else {
					hoursLabel.text = "Hours"
				}
			}
		}
	}
	
	@IBAction func clearButtonPressed(_ sender: Any) {
		wageTextField.text = ""
		priceTextField.text = ""
		resultLabel.text = ""
		hoursLabel.text = ""
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}

