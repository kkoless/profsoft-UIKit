//
//  AppStep.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import Foundation
import RxFlow
import RxCocoa

enum AppStep: Step {
	
	case initStep // Перенаправит на StartFlow
	
	case start // Перенаправит на StartScreen

	case login // Перенапрявляет на LoginScreen
	
	case showAlert // Покажет Alert на LoginScreen
	
	case loginSucces // При успешном входе перенаправит на ProfileScreen
	case userSkipLogin // Перенаправит на ProfileScreen
	
	case dashboard
	case userProfile // (user: User)
	
	
	case general
	case search
	
	case none
}
