//
//  SearchFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 07.08.2021.
//

import Foundation
import UIKit
import RxFlow

class SearchFlow: Flow {
	
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
			case .search:
				return navigationToSearchScreen()
			default:
				return .none
		}
	}
	
	func navigationToSearchScreen() -> FlowContributors {
		let searchScreenViewController = SearchScreenViewController.instantiate()
		let searchScreenViewModel = SearchScreenViewModel()
		searchScreenViewController.inject(viewModel: searchScreenViewModel)

		rootViewController.pushViewController(searchScreenViewController, animated: true)

		return .one(flowContributor: .contribute(withNextPresentable: searchScreenViewController,
												 withNextStepper: searchScreenViewModel))
	}

}
