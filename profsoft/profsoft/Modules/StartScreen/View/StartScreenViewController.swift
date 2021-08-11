//
//  StartScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class StartScreenViewController: UIViewController, StoryboardBased {

	private let disposeBag = DisposeBag()
	
	@IBOutlet weak var enterButton: UIButton!
	@IBOutlet weak var skipButton: UIButton!
	
	@IBOutlet weak var firstHalfTextImageView: UIImageView!
	@IBOutlet weak var switchPart: UISwitch!
	@IBOutlet weak var secondHalfTextImageView: UIImageView!
	
	
	private var input: StartScreenViewModelInputProtocol!
	private var output: StartScreenViewModelOutputProtocol!
	private var viewModel: StartScreenViewModelProtocol!
	
	private let onAppear = PublishRelay<Void>()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		bindUI()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		onAppear.accept(())
	}
	
	func inject(viewModel: StartScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension StartScreenViewController {
	func configureUI(){
		configureEnterButton()
		configureSkipButton()
		configureCompanyLogo()
	}
	
	func configureEnterButton(){
		enterButton.setTitle("Вход", for: .normal)
		enterButton.titleLabel?.font = UIFont(name: "Golos", size: 17)
		enterButton.tintColor = .white
		
		enterButton.backgroundColor = .black
		enterButton.layer.cornerRadius = 22
		enterButton.layer.borderWidth = 2
		enterButton.layer.borderColor = UIColor.black.cgColor
		
		enterButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
	}
	
	func configureSkipButton(){
		skipButton.setTitle("Продолжить без регистрации", for: .normal)
		skipButton.titleLabel?.font = UIFont(name: "Golos", size: 17)
		skipButton.tintColor = .black
		
		skipButton.backgroundColor = .white
		skipButton.layer.cornerRadius = 22
		skipButton.layer.borderWidth = 2
		skipButton.layer.borderColor = UIColor.black.cgColor
		
		skipButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
	}
	
	func configureCompanyLogo(){
		firstHalfTextImageView.image = UIImage(named: "firstHalf")
		secondHalfTextImageView.image = UIImage(named: "secondHalf")
		
		firstHalfTextImageView.contentMode = .scaleAspectFit
		secondHalfTextImageView.contentMode = .scaleAspectFit
	}

}

private extension StartScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let onEnterButtonTap = enterButton.rx.tap.asObservable()
		let onSkipButtonTap = skipButton.rx.tap.asObservable()
		let input = StartScreenViewModelInput(onEnterButtonTap: onEnterButtonTap, onSkipButtonTap: onSkipButtonTap)

		output = viewModel.transform(input: input)
	}
}
