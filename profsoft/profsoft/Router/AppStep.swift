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
	case initStep
	case start
	
	case userLogin // Перенаправит на экран ввода логина/пароля
	case userSkipLogin // Перенаправит сразу дальше (допустим на экран профиля пользователя)
	
	
	case none
}
