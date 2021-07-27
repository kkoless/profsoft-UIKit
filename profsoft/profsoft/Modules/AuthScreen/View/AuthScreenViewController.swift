//
//  AuthScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class AuthScreenViewController: UIViewController, StoryboardBased {

	private let disposeBag = DisposeBag()
	
	@IBOutlet weak var enterButton: UIButton!
	@IBOutlet weak var skipButton: UIButton!
	@IBOutlet weak var companyLabel: UILabel!
	
	
	private var input: AuthScreenViewModelInputProtocol!
	private var output: AuthScreenViewModelOutputProtocol!
	private var viewModel: AuthScreenViewModelProtocol!
	
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
	
	func inject(viewModel: AuthScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension AuthScreenViewController {
	func configureUI(){
		configureEnterButton()
		configureSkipButton()
	}
	
	func configureEnterButton(){
		enterButton.setTitle("Вход", for: .normal)
		enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		enterButton.tintColor = .white
		enterButton.backgroundColor = .black
		enterButton.layer.cornerRadius = 22
		enterButton.layer.borderWidth = 2
		enterButton.layer.borderColor = UIColor.black.cgColor
		enterButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
	}
	
	func configureSkipButton(){
		skipButton.setTitle("Продолжить без регистрации", for: .normal)
		skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		skipButton.tintColor = .black
		skipButton.backgroundColor = .white
		skipButton.layer.cornerRadius = 22
		skipButton.layer.borderWidth = 2
		skipButton.layer.borderColor = UIColor.black.cgColor
		skipButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
		
		
	}

}

private extension AuthScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = AuthScreenViewModelInput(onAppear: onAppear.asObservable())

		output = viewModel.transform(input: input)
	}
}
