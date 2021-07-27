//
//  AppFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class AppFlow: Flow {
	
	var root: Presentable {
		return self.rootWindow
	}
	
	private let rootWindow: UIWindow
	private lazy var rootViewController: UINavigationController = {
		let viewController = UINavigationController()
		return viewController
	}()
	
	
	init(withWindow window: UIWindow) {
		self.rootWindow = window
	}
	
	deinit {
		print("\(type(of: self)): \(#function)")
	}
	
	func navigate(to step: Step) -> FlowContributors {
		guard let step = step as? AppStep else { return .none }
		
		switch step {
			case .auth:
				return navigationToAuthScreen()
			default:
				return .none
		}
	}
	
	private func navigationToAuthScreen() -> FlowContributors {
		//let auth = AuthFlow()
		let viewController = AuthScreenViewController.instantiate()
		let viewModel = AuthScreenViewModel()
		viewController.inject(viewModel: viewModel)
		
		//rootViewController.pushViewController(viewController, animated: true)
		
		self.rootWindow.rootViewController = self.rootViewController
		rootViewController.pushViewController(viewController, animated: true)

		return .one(flowContributor: .contribute(withNextPresentable: viewController,
												 withNextStepper: viewModel))
	}
}



final class AppStepper: Stepper {

	let steps = PublishRelay<Step>()
	private let disposeBag = DisposeBag()

	var initialStep: Step {
		return AppStep.auth
	}

	func readyToEmitSteps() {
		steps.accept(AppStep.auth)
	}
}
