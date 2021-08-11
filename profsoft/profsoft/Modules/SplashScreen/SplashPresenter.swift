//
//  SplashPresenter.swift
//  profsoft
//
//  Created by Кирилл Колесников on 08.08.2021.
//

import UIKit

protocol SplashPresenterDescription: AnyObject {
	func present()
	func dismiss(completion: @escaping () -> Void)
}

final class SplashPresenter: SplashPresenterDescription {
	
	// MARK: - Properties
	
	private lazy var animator: SplashAnimatorDescription = SplashAnimator(foregroundSplashWindow: foregroundSplashWindow,
																		  backgroundSplashWindow: backgroundSplashWindow)
	
	private lazy var foregroundSplashWindow: UIWindow = {
		let splashViewController = self.splashViewController(with: firtsHalfTextImage, with: secondHalfTextImage)
		let splashWindow = self.splashWindow(windowLevel: .normal + 1, rootViewController: splashViewController)
		
		return splashWindow
	}()
	
	private lazy var backgroundSplashWindow: UIWindow = {
		let splashViewController = self.splashViewController(with: firtsHalfTextImage, with: secondHalfTextImage)
		let splashWindow = self.splashWindow(windowLevel: .normal - 1, rootViewController: splashViewController)
		
		return splashWindow
	}()
	
	private lazy var firtsHalfTextImage: UIImage? = {
		let imageName = "firstHalf"
		
		return UIImage(named: imageName)
	}()
	
	private lazy var secondHalfTextImage: UIImage? = {
		let imageName = "secondHalf"
		
		return UIImage(named: imageName)
	}()
	
	// MARK: - Helpers
	
	private func splashWindow(windowLevel: UIWindow.Level, rootViewController: SplashScreenViewController?) -> UIWindow {
		let splashWindow = UIWindow(frame: UIScreen.main.bounds)
		
		splashWindow.windowLevel = windowLevel
		splashWindow.rootViewController = rootViewController
		
		return splashWindow
	}
	
	private func splashViewController(with firstHalfTextImage: UIImage?, with secondHalfTextImage: UIImage?) -> SplashScreenViewController! {
		let splashViewController = SplashScreenViewController.instantiate()
		
		splashViewController.firstHalfTextImage = firtsHalfTextImage
		splashViewController.secondHalfTextImage = secondHalfTextImage
		
		return splashViewController
	}
	
	// MARK: - SplashPresenterDescription
	
	func present() {
		animator.animateAppearance()
	}
	
	func dismiss(completion: @escaping () -> Void) {
		animator.animateDisappearance(completion: completion)
	}
	
}
