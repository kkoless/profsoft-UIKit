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
	case auth
	case profile
	case none
}
