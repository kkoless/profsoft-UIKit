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
	private var splashPresenter: SplashPresenterDescription? = SplashPresenter()
	private var appFlow: AppFlow!
	private let coordinator = FlowCoordinator()
	private let disposeBag = DisposeBag()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		guard let window = self.window else { return false }
		
		splashPresenter?.present()
		
		let delay: TimeInterval = 1
		DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			self.splashPresenter?.dismiss { [weak self] in
				self?.splashPresenter = nil
			}
		}
		
		coordinator.rx.didNavigate
			.subscribe(onNext: { flow, step in
				print("did navigate to flow=\(flow) and step=\(step)")
			}).disposed(by: disposeBag)
		
		self.appFlow = AppFlow(withWindow: window)
		
		coordinator.coordinate(flow: appFlow, with: AppStepper())
		
		return true
	}


}

