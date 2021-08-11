//
//  PrivateFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import Foundation
import UIKit
import RxFlow

class PrivateFlow: Flow {
	
	var root: Presentable {
		return self.rootViewController
	}

	private lazy var rootViewController: UINavigationController = {
		let viewController = UINavigationController()
		viewController.setNavigationBarHidden(true, animated: false)
		return viewController
	}()

	deinit {
		print("\(type(of: self)): \(#function)")
	}

	func navigate(to step: Step) -> FlowContributors {
		guard let step = step as? AppStep else { return .none }
		
		switch step {
			case .userProfile:
				return navigationToProfileScreen()
			default:
				return .none
		}
	}
	
	func navigationToProfileScreen() -> FlowContributors {
		let profileScreenViewController = ProfileScreenViewController.instantiate()
		let profileScreenViewModel = ProfileScreenViewModel()
		profileScreenViewController.inject(viewModel: profileScreenViewModel)

		rootViewController.pushViewController(profileScreenViewController, animated: true)

		return .one(flowContributor: .contribute(withNextPresentable: profileScreenViewController,
												 withNextStepper: profileScreenViewModel))
	}

}
