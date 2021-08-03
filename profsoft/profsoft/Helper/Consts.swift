//
//  Consts.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import Foundation
import UIKit

enum Consts{
	
	enum API {
		static let baseUrl = URL(string: "")!
		static let authorizationHeader = "apiKey"
		static let xContentTypeName = "Content-type"
		static let xContentTypeValue = "application/json"
		static let authVerbose = true
		static let backendVerbose = true
	}
	
	enum UserCredentials {
		static let email = "kirill@gmail.com"
		static let password = "qwerty123"
	}
	
	enum ImageLoginScreen {
		static let openEye = UIImage(named: "openEye")
		static let closeEye = UIImage(named: "closeEye")
		static let companyLogo = UIImage(named: "companyLogo")
	}
	
	
}
