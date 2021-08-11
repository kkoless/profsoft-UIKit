//
//  SplashAnimator.swift
//  profsoft
//
//  Created by Кирилл Колесников on 08.08.2021.
//

import UIKit
import QuartzCore

protocol SplashAnimatorDescription: AnyObject {
	func animateAppearance()
	func animateDisappearance(completion: @escaping () -> Void)
}

final class SplashAnimator: SplashAnimatorDescription {
	
	// MARK: - Properties
	
	private unowned let foregroundSplashWindow: UIWindow
	private unowned let backgroundSplashWindow: UIWindow
	
	private unowned let foregroundSplashViewController: SplashScreenViewController
	private unowned let backgroundSplashViewController: SplashScreenViewController
	
	// MARK: - Initialization
	
	init(foregroundSplashWindow: UIWindow, backgroundSplashWindow: UIWindow) {
		self.foregroundSplashWindow = foregroundSplashWindow
		self.backgroundSplashWindow = backgroundSplashWindow
		
		guard
			let foregroundSplashViewController = foregroundSplashWindow.rootViewController as? SplashScreenViewController,
			let backgroundSplashViewController = backgroundSplashWindow.rootViewController as? SplashScreenViewController else {
				fatalError("Splash window doesn't have splash root view controller!")
		}
		
		self.foregroundSplashViewController = foregroundSplashViewController
		self.backgroundSplashViewController = backgroundSplashViewController
	}
	
	// MARK: - Appearance
	
	func animateAppearance() {
		foregroundSplashWindow.isHidden = false
		
		foregroundSplashViewController.firstHalfTextImageView.transform = CGAffineTransform(translationX: 51, y: 0)
		foregroundSplashViewController.secondHalfTextImageView.transform = CGAffineTransform(translationX: -51, y: 0)
		UIView.animate(withDuration: 0.4, animations: {
			self.foregroundSplashViewController.firstHalfTextImageView.transform = .identity
			self.foregroundSplashViewController.secondHalfTextImageView.transform = .identity
		})
		
		foregroundSplashViewController.firstHalfTextImageView.alpha = 0
		foregroundSplashViewController.secondHalfTextImageView.alpha = 0
		UIView.animate(withDuration: 0.15, animations: {
			self.foregroundSplashViewController.firstHalfTextImageView.alpha = 1
			self.foregroundSplashViewController.secondHalfTextImageView.alpha = 1
		})
	}
	
	// MARK: - Disappearance
	
	func animateDisappearance(completion: @escaping () -> Void) {
		guard let window = UIApplication.shared.delegate?.window, let mainWindow = window else {
			fatalError("Application doesn't have a window!")
		}
		
		// Background splash window provides splash behind the animated logo image instead of black screen
		backgroundSplashWindow.isHidden = false
		foregroundSplashWindow.alpha = 0
		
		CATransaction.setCompletionBlock {
			mainWindow.layer.mask = nil
			completion()
		}
		
		CATransaction.begin()
		
		UIView.animate(withDuration: 0.3) {
			self.backgroundSplashViewController.firstHalfTextImageView.alpha = 0
			self.backgroundSplashViewController.secondHalfTextImageView.alpha = 0
		}
		
		CATransaction.commit()
	}
	
}
