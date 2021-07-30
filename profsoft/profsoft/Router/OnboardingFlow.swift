//
//  OnboardingFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import Foundation
import UIKit
import RxFlow

class OnboardingFlow: Flow {
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
			case .start:
				return navigationToStartScreen()
			case .login:
				return navigationToLoginScreen()
			case .showAlert:
				return showAlert()
			default:
				return .none
		}
	}
	
	private func navigationToStartScreen() -> FlowContributors {
		let startViewController = StartScreenViewController.instantiate()
		let startViewModel = StartScreenViewModel()
		startViewController.inject(viewModel: startViewModel)
		
		
		self.rootViewController.pushViewController(startViewController, animated: true)
		
		
		return .one(flowContributor: .contribute(withNextPresentable: startViewController, withNextStepper: startViewModel))
	}
	
	private func navigationToLoginScreen() -> FlowContributors {
		let loginViewController = LoginScreenViewController.instantiate()
		let loginViewModel = LoginScreenViewModel()
		loginViewController.inject(viewModel: loginViewModel)
			
		
		self.rootViewController.pushViewController(loginViewController, animated: true)
		
		
		return .one(flowContributor: .contribute(withNextPresentable: loginViewController, withNextStepper: loginViewModel))
	}
	
	private func showAlert() -> FlowContributors {
		let alert = AlertHelper.oneButtonCancel
		
		self.rootViewController.present(alert, animated: true)
		
		return .one(flowContributor: .contribute(withNextPresentable: alert, withNextStepper: OneStepper(withSingleStep: AppStep.none)))
	}

	
}
