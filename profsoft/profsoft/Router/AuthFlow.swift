//
//  AuthFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import UIKit
import RxFlow
import RxCocoa

//final class AuthFlow: Flow {
//
//	var root: Presentable {
//		return self.rootViewController
//	}
//
//	private lazy var rootViewController: UINavigationController = {
//		let viewController = UINavigationController()
//		return viewController
//	}()
//
//	deinit {
//		print("\(type(of: self)): \(#function)")
//	}
//
//	func navigate(to step: Step) -> FlowContributors {
//		guard let step = step as? AppStep else { return .none }
//
//		switch step {
//			case .auth:
//			return navigationToAuthScreen()
//		default:
//			return .none
//		}
//	}
//
//
//	private func navigationToAuthScreen() -> FlowContributors {
//		let viewController = AuthScreenViewController.instantiate()
//		let viewModel = AuthScreenViewModel()
//		viewController.inject(viewModel: viewModel)
//
//		rootViewController.pushViewController(viewController, animated: true)
//
//
//		Flows.use(self,
//				  when: .ready) {[unowned self] (root: U) in
//
//			rootViewController.setViewControllers([viewController], animated: true)
//		}
//
//		return .one(flowContributor: .contribute(withNextPresentable: viewController,
//												 withNextStepper: viewModel))
//	}
//}
