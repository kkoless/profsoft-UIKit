//
//  ProfileFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import Foundation
import RxFlow
import RxCocoa

//final class ProfileFlow: Flow {
//
//	var root: Presentable {
//		return self.rootViewController
//	}
//
//	private lazy var rootViewController = UINavigationController {
//		let viewController = UINavigationController()
//		return viewController
//	}
//
//	func navigate(to step: Step) -> FlowContributors {
//		guard let step = step as? AppStep else { return .none }
//
//		switch step {
//			case .profile:
//				return navigateToProfile()
//			default:
//			return .none
//		}
//	}
//
//	private func navigateToProfile() -> FlowContributors {
//
//	}
//}
