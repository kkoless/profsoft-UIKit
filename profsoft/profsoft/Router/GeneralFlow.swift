//
//  GeneralFlow.swift
//  profsoft
//
//  Created by Кирилл Колесников on 07.08.2021.
//

import Foundation
import UIKit
import RxFlow

class GeneralFlow: Flow {
	
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
			
			default:
				return .none
		}
	}
	
}
