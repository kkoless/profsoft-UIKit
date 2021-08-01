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
	@IBOutlet private weak var forgotPassButton: UIButton!
	
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var emailTextField: UITextField!
	
	@IBOutlet private weak var passwordErrorLabel: UILabel!
	@IBOutlet private weak var emailErrorLabel: UILabel!
	
	
	@IBOutlet private weak var companyLogoImageView: UIImageView!
	private let companyLogo = UIImage(named: "companyLogo")
	
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


extension LoginScreenViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		passwordTextField.resignFirstResponder()
		emailTextField.resignFirstResponder()
		return true
	}

}


private extension LoginScreenViewController {
	
	func configureUI(){
		configureButtons()
		configureTextFields()
		configureLabels()
		configureCompanyLogo()
		configureKeyboard()
	}
	
	func configureButtons(){
		configureEnterButton()
		configureShowPassButton()
		configureForgotPassButton()
	}
	
	func configureTextFields(){
		configurePassTextField()
		configureEmailTextField()
	}
	
	func configureLabels(){
		configurePasswordErrorLabel()
		configureEmailErrorLabel()
	}
	
	func configureCompanyLogo(){
		companyLogoImageView.image = companyLogo
	}
	
	
	func configureKeyboard(){
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
}

private extension LoginScreenViewController {
	
	@objc func keyboardWillShow(notification: NSNotification) {
		guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
		   // if keyboard size is not available for some reason, dont do anything
		   return
		}
	  
	  // move the root view up by the distance of keyboard height
	  self.view.frame.origin.y = 0 - keyboardSize.height
	}

	@objc func keyboardWillHide(notification: NSNotification) {
	  // move back the root view origin to zero
	  self.view.frame.origin.y = 0
	}
	
}


private extension LoginScreenViewController {
	 
	func configureEnterButton() {
		enterButton.setTitle("Вход", for: .normal)
		enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		enterButton.tintColor = .white
		enterButton.backgroundColor = .black
		
		enterButton.layer.cornerRadius = 22
		enterButton.layer.borderWidth = 2
		enterButton.layer.borderColor = UIColor.black.cgColor
		
		enterButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
	}
	
	func configurePassTextField() {
		passwordTextField.delegate = self
		
		passwordTextField.placeholder = "Пароль"
		passwordTextField.isSecureTextEntry = true
		
		passwordTextField.font = passwordTextField.font?.withSize(18)
		
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
	
	func configureEmailTextField() {
		emailTextField.delegate = self
		
		emailTextField.placeholder = "Email"
		
		emailTextField.font = emailTextField.font?.withSize(18)
		
		emailTextField.layer.borderColor = UIColor.black.cgColor
		emailTextField.layer.borderWidth = 1.5
		emailTextField.layer.cornerRadius = 22
		emailTextField.layer.masksToBounds = true
	}
	
	
	func configureShowPassButton() {
		showPassButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 25)
		showPassButton.setImage(openEye, for: .normal)
	}
	
	func configureForgotPassButton() {
		forgotPassButton.tintColor = .gray
		forgotPassButton.contentHorizontalAlignment = .left
		forgotPassButton.setTitle("Забыли пароль?", for: .normal)
	}
	
	func configurePasswordErrorLabel() {
		passwordErrorLabel.font = passwordErrorLabel.font.withSize(13)
		passwordErrorLabel.textColor = .red
		passwordErrorLabel.text = ""
	}
	
	func configureEmailErrorLabel() {
		emailErrorLabel.font = emailErrorLabel.font.withSize(13)
		emailErrorLabel.textColor = .red
		emailErrorLabel.text = ""
	}
}


private extension LoginScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = LoginScreenViewModelInput(emailTextField: emailTextField, passwordTextField: passwordTextField, forgotPassButton: forgotPassButton, enterButton: enterButton, showPassButton: showPassButton, passwordErrorLabel: passwordErrorLabel, emailErrorLabel: emailErrorLabel)
	

		output = viewModel.transform(input: input)
	}
}

