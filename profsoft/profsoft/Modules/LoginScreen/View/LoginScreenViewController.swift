//
//  LoginScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa


class LoginScreenViewController: UIViewController, StoryboardBased {
	
	private let disposeBag = DisposeBag()	
	
	@IBOutlet private weak var enterButton: UIButton!
	@IBOutlet weak var forgotPassButton: UIButton!
	
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var companyLabel: UILabel!
	
	private var showPassButton =  UIButton()
	private let openEye = UIImage(named: "openEye")
	private let closeEye = UIImage(named: "closeEye")
	
	
	private var input: LoginScreenViewModelInputProtocol!
	private var output: LoginScreenViewModelOutputProtocol!
	private var viewModel: LoginScreenViewModelProtocol!
	
	private let showPassState = BehaviorRelay<Bool>(value: false)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configureUI()
		bindUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	func inject(viewModel: LoginScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension LoginScreenViewController {
	func configureUI(){
		configureEnterButton()
		configureShowPassButton()
		configureForgotPassButton()
		
		configurePassTextField()
		configureEmailTextField()
	}
	
	func configureEnterButton(){
		enterButton.setTitle("Вход", for: .normal)
		enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		enterButton.tintColor = .white
		
		enterButton.backgroundColor = .gray
		enterButton.layer.cornerRadius = 22
		enterButton.layer.borderWidth = 2
		enterButton.layer.borderColor = UIColor.gray.cgColor
		
		enterButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
	}
	
	func configurePassTextField(){
		passwordTextField.placeholder = "Пароль"
		passwordTextField.isSecureTextEntry = true
		
		passwordTextField.font = UIFont(name: "Golos", size: 16)
		
		
		passwordTextField.layer.borderColor = UIColor.black.cgColor
		passwordTextField.layer.borderWidth = 1.5
		passwordTextField.layer.cornerRadius = 22
		
		passwordTextField.layer.masksToBounds = true
		passwordTextField.rightViewMode = .always
		passwordTextField.rightView = showPassButton
		
		showPassButton.rx.tap.withLatestFrom(showPassState).asObservable().subscribe(onNext: { [weak self] state in
			guard let self = self else { return }
			self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
			self.showPassState.accept(!self.showPassState.value)
			self.showPassButton.setImage(state ? self.openEye : self.closeEye, for: .normal)
		})
		.disposed(by: disposeBag)
	}
	
	func configureEmailTextField(){
		emailTextField.placeholder = "Email"
		
		emailTextField.font = UIFont(name: "Golos", size: 16)
		
		
		emailTextField.layer.borderColor = UIColor.black.cgColor
		emailTextField.layer.borderWidth = 1.5
		emailTextField.layer.cornerRadius = 22
		
		emailTextField.layer.masksToBounds = true
	}
	
	
	func configureShowPassButton(){
		showPassButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 25)
		showPassButton.setImage(openEye, for: .normal)
	}
	
	func configureForgotPassButton(){
		forgotPassButton.tintColor = .gray
		forgotPassButton.contentHorizontalAlignment = .left
		forgotPassButton.setTitle("Забыли пароль?", for: .normal)
		
		forgotPassButton.rx.tap
			.asObservable()
			.subscribe(
				onNext: {
					let urlCompany = URL(string: "academy@profsoft.pro")!
					let alert = UIAlertController(title: "Забыли пароль?", message: "Напишите в поддержку \(urlCompany)",         preferredStyle: .alert)
					
					alert.addAction(UIAlertAction(title: "Вернуться", style: .default))
					self.present(alert, animated: true, completion: nil)
				})
			.disposed(by: disposeBag)
	}
	
	
}

private extension LoginScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = LoginScreenViewModelInput()
	

		output = viewModel.transform(input: input)
	}
}

