//
//  AppDelegate.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var appFlow: AppFlow!
	let coordinator = FlowCoordinator()
	private let disposeBag = DisposeBag()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		guard let window = self.window else { return false }
		
		self.appFlow = AppFlow(withWindow: window)

		coordinator.rx.didNavigate
			.subscribe(onNext: { flow, step in
				print("did navigate to flow=\(flow) and step=\(step)")
			}).disposed(by: disposeBag)

		coordinator.coordinate(flow: appFlow, with: AppStepper())
		
		return true
	}


}

