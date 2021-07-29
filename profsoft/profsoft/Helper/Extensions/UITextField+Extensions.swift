//
//  UITextField+Extensions.swift
//  profsoft
//
//  Created by Кирилл Колесников on 29.07.2021.
//

import Foundation
import UIKit

extension UITextField {
	func setRightView(_ view: UIView, padding: CGFloat) {
		view.translatesAutoresizingMaskIntoConstraints = true

		let outerView = UIView()
		outerView.translatesAutoresizingMaskIntoConstraints = false
		outerView.addSubview(view)

		outerView.frame = CGRect(
			origin: .zero,
			size: CGSize(
				width: view.frame.size.width + padding,
				height: view.frame.size.height + padding
			)
		)

		view.center = CGPoint(
			x: outerView.bounds.size.width / 2,
			y: outerView.bounds.size.height / 2
		)

		rightView = outerView
	}
}
