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

	init() {
		//self.serviceContainer = serviceContainer
		//self.mediatorContainer = mediatorContainer
		self.privateFlow = PrivateFlow()
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
		
		Flows.use(privateFlow,
				  when: .ready) { [unowned self] (root1: UINC) in
			
			let tabBarItem1 = UITabBarItem(title: "Профиль",
										   image: UIImage(named: "profile"),
										   selectedImage: UIImage(named: "profile"))
			
			root1.tabBarItem = tabBarItem1
			
			rootViewController.setViewControllers([root1], animated: true)
		}
		
		return .multiple(flowContributors: [.contribute(withNextPresentable: privateFlow,
														withNextStepper: OneStepper(withSingleStep: AppStep.userProfile)),
		])
	}
}
