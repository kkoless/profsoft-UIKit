//
//  SplashScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 08.08.2021.
//

import UIKit
import Reusable

final class SplashScreenViewController: UIViewController, StoryboardBased{
	
	// MARK: - Properties
	
	@IBOutlet weak var firstHalfTextImageView: UIImageView!
	@IBOutlet weak var switchPart: UISwitch!
	@IBOutlet weak var secondHalfTextImageView: UIImageView!
	
	var firstHalfTextImage: UIImage?
	var secondHalfTextImage: UIImage?

	// MARK: - Life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureUI()
		
		firstHalfTextImageView.image = firstHalfTextImage
		secondHalfTextImageView.image = secondHalfTextImage
	}
	
}

extension SplashScreenViewController {
	func configureUI(){
		configureFirstHalfImageView()
		configureSecondHalfImageView()
	}
	
	func configureFirstHalfImageView(){
		firstHalfTextImageView.contentMode = .scaleAspectFit
	}
	
	func configureSecondHalfImageView(){
		secondHalfTextImageView.contentMode = .scaleAspectFit
	}
}
