//
//  AlertHelper.swift
//  profsoft
//
//  Created by Кирилл Колесников on 30.07.2021.
//

import UIKit

enum AlertHelper {
	
	static var oneButtonCancel: UIAlertController {
		let urlCompany = URL(string: "academy@profsoft.pro")!
		let alert = UIAlertController(title: "Забыли пароль?", message: "Напишите в поддержку \(urlCompany)",         preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "Вернуться", style: .default))
		return alert
	}

}
