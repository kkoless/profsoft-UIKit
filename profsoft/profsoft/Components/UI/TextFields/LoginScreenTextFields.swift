//
//  PasswordTextField.swift
//  profsoft
//
//  Created by Кирилл Колесников on 29.07.2021.
//

import Foundation
import UIKit

class LoginScreenTextFields: UITextField {
	
	let padding = UIEdgeInsets(top: 16, left: 25, bottom: 16, right: 60)
	
	override open func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}
	override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}
	override open func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}
	
}
