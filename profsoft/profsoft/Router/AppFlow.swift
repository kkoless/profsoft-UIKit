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
			viewController.setNavigationBarHidden(true, animated: false)
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
			case .initStep:
				return navigateToStartFlow()
			default:
				return .none
		}
	}
	
	private func navigateToStartFlow() -> FlowContributors {
		let startFlow = StartFlow()
		
		Flows.use(startFlow, when: .ready) { [unowned self] root in
			self.rootWindow.rootViewController = root
		}
		
		return .one(flowContributor: .contribute(withNextPresentable: startFlow,
												 withNextStepper: OneStepper(withSingleStep: AppStep.start)))
	}
}



final class AppStepper: Stepper {

	let steps = PublishRelay<Step>()
	private let disposeBag = DisposeBag()

	var initialStep: Step {
		return AppStep.initStep
	}

	func readyToEmitSteps() {
		steps.accept(AppStep.initStep)
	}
}
