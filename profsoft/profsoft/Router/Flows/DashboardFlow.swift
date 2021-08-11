//
//  DashboardFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import UIKit
import RxFlow
import RxCocoa

enum TabBarItem: Int {
	case home
	case search
	case profile
}

fileprivate typealias UINC = UINavigationController

final class DashboardFlow: Flow {

	var root: Presentable {
		return self.rootViewController
	}

	private lazy var rootViewController: UITabBarController = {
		let viewController = UITabBarController()
		viewController.modalPresentationStyle = .fullScreen
		viewController.modalTransitionStyle = .flipHorizontal
		return viewController
	}()

	//private let serviceContainer: APIServiceContainer
	//private let mediatorContainer: MediatorServiceContainer

	private let privateFlow: PrivateFlow
	private let searchFlow: SearchFlow
	private let generalFlow: GeneralFlow

	init() {
		//self.serviceContainer = serviceContainer
		//self.mediatorContainer = mediatorContainer
		self.privateFlow = PrivateFlow()
		self.searchFlow = SearchFlow()
		self.generalFlow = GeneralFlow()
	}

	deinit {
		print("\(type(of: self)): \(#function)")
	}

	func navigate(to step: Step) -> FlowContributors {
		guard let step = step as? AppStep else { return .none }

		switch step {
		case .dashboard:
			return navigateToDashboard()
		default:
			return .none
		}
	}

	private func navigateToDashboard() -> FlowContributors {
		
		Flows.use(generalFlow,
				  searchFlow,
				  privateFlow,
				  when: .ready) {
			[unowned self] root1, root2, root3 in
			
			let tabBarItem1 = UITabBarItem(title: "",
										   image: UIImage(named: "home"),
										   selectedImage: UIImage(named: "home"))
			let tabBarItem2 = UITabBarItem(title: "",
										   image: UIImage(named: "search"),
										   selectedImage: UIImage(named: "search"))
			let tabBarItem3 = UITabBarItem(title: "",
										   image: UIImage(named: "profile"),
										   selectedImage: UIImage(named: "profile"))
			
			root1.tabBarItem = tabBarItem1
			root2.tabBarItem = tabBarItem2
			root3.tabBarItem = tabBarItem3
			
			rootViewController.setViewControllers([root1, root2, root3], animated: true)
		}
		
		return .multiple(flowContributors: [
			.contribute(withNextPresentable: generalFlow, withNextStepper: OneStepper(withSingleStep: AppStep.general)),
			.contribute(withNextPresentable: searchFlow, withNextStepper: OneStepper(withSingleStep: AppStep.search)),
			.contribute(withNextPresentable: privateFlow, withNextStepper: OneStepper(withSingleStep: AppStep.userProfile))
		])
	}
}
