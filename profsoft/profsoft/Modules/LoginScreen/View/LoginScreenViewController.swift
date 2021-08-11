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
	
	
	@IBOutlet private weak var enterButtonConstrait: NSLayoutConstraint!
	@IBOutlet private weak var forgotPassButtonConstraintTop: NSLayoutConstraint!
	@IBOutlet private weak var companyLogoConstraintBottom: NSLayoutConstraint!
	
	
	private var showPassButton = UIButton()
	
	
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
	
	func inject(viewModel: LoginScreenViewModelProtocol) {
		self.viewModel = viewModel
	}
	
}


extension LoginScreenViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		switch textField {
			case passwordTextField, emailTextField:
				textField.resignFirstResponder()
			default:
				return false
		}
		
		return true
	}

}

private extension LoginScreenViewController {
	
	@objc func keyboardWillShow(notification: NSNotification) {
		
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				self.view.frame.origin.y -= keyboardSize.height
			}
			
			enterButtonConstrait.constant = -15
			forgotPassButtonConstraintTop.constant = 40
			companyLogoConstraintBottom.constant = 100
			
			UIView.animate(withDuration: 0.5) {
				self.view.layoutIfNeeded()
			}
			
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
		
		enterButtonConstrait.constant = 20
		forgotPassButtonConstraintTop.constant = 115
		companyLogoConstraintBottom.constant = 193
		
		enterButton.backgroundColor = .black
		enterButton.layer.borderColor = UIColor.black.cgColor
		
		UIView.animate(withDuration: 0.5) {
			self.view.layoutIfNeeded()
			
		}
		
	}
	
}


private extension LoginScreenViewController {
	
	func configureUI() {
		configureButtons()
		configureTextFields()
		configureLabels()
		configureCompanyLogo()
		configureKeyboard()
	}
	
	func configureButtons() {
		enterButton.setTitle("Вход", for: .normal)
		enterButton.titleLabel?.font = UIFont(name: "Golos", size: 17)
		enterButton.tintColor = .white
		enterButton.backgroundColor = .gray
		enterButton.layer.cornerRadius = 22
		enterButton.layer.borderWidth = 2
		enterButton.layer.borderColor = UIColor.gray.cgColor
		enterButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
		
		
		showPassButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 25)
		showPassButton.setImage(UIImage(named: "openEye"), for: .normal)
		
		forgotPassButton.tintColor = .gray
		forgotPassButton.contentHorizontalAlignment = .left
		forgotPassButton.setTitle("Забыли пароль?", for: .normal)
	}
	
	func configureTextFields() {
		passwordTextField.delegate = self
		passwordTextField.placeholder = "Пароль"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.font = UIFont(name: "Golos", size: 16)
		passwordTextField.layer.borderColor = UIColor.black.cgColor
		passwordTextField.layer.borderWidth = 1.5
		passwordTextField.layer.cornerRadius = 28
		passwordTextField.layer.masksToBounds = true
		passwordTextField.rightViewMode = .always
		passwordTextField.rightView = showPassButton
		
		showPassButton.rx.tap.withLatestFrom(showPassState).asObservable().subscribe(onNext: { [weak self] state in
			guard let self = self else { return }
			self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
			self.showPassState.accept(!self.showPassState.value)
			self.showPassButton.setImage(state ? UIImage(named: "openEye") : UIImage(named: "closeEye"), for: .normal)
		})
		.disposed(by: disposeBag)
		
		
		emailTextField.delegate = self
		emailTextField.placeholder = "Email"
		emailTextField.font = UIFont(name: "Golos", size: 16)
		emailTextField.layer.borderColor = UIColor.black.cgColor
		emailTextField.layer.borderWidth = 1.5
		emailTextField.layer.cornerRadius = 28
		emailTextField.layer.masksToBounds = true
	}
	
	func configureLabels() {
		passwordErrorLabel.font = UIFont(name: "Golos", size: 11)
		passwordErrorLabel.textColor = .red
		passwordErrorLabel.text = ""
		
		emailErrorLabel.font = UIFont(name: "Golos", size: 11)
		emailErrorLabel.textColor = .red
		emailErrorLabel.text = ""
	}
	
	func configureCompanyLogo() {
		companyLogoImageView.image = UIImage(named: "companyLogo")
	}
	
	
	func configureKeyboard() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
}

private extension LoginScreenViewController {
	func bindUI() {
		bindViewModel()
		bindErrors()
	}
	
	func bindViewModel() {
		
		let onForgotPassButtonTap = forgotPassButton.rx.tap.asObservable()
		let onEnterButtonTap = enterButton.rx.tap.asObservable()
		let onShowPassButtonTap = showPassButton.rx.tap.asObservable()
		
		let passwordText = passwordTextField.rx.text.orEmpty.asObservable()
		let emailText = emailTextField.rx.text.orEmpty.asObservable()
		
		let input = LoginScreenViewModelInput(onForgotPassButtonTap: onForgotPassButtonTap, onEnterButtonTap: onEnterButtonTap, onShowPassButtonTap: onShowPassButtonTap, passwordText: passwordText, emailText: emailText)
	
		output = viewModel.transform(input: input)
	}
	
	func bindErrors() {
		output.successEmailData.drive(onNext: { [weak self] in
			guard let self = self else { return }
			self.validEmailTF()
		})
		.disposed(by: disposeBag)
		
		output.successPassData.drive(onNext: { [weak self] in
			guard let self = self else { return }
			self.validPasswordTF()
		})
		.disposed(by: disposeBag)
		
		output.errorEmailData.drive(onNext: { [weak self] in
			guard let self = self else { return }
			self.notValidEmailTF()
		})
		.disposed(by: disposeBag)
		
		output.errorPassData.drive(onNext: { [weak self] in
			guard let self = self else { return }
			self.notValidPasswordTF()
		})
		.disposed(by: disposeBag)
	}
	
	func validEmailTF(){
		emailTextField.layer.borderColor = UIColor.black.cgColor
		emailTextField.textColor = .black
		emailErrorLabel.text = ""
	}
	
	func notValidEmailTF(){
		emailTextField.layer.borderColor = UIColor.red.cgColor
		emailTextField.textColor = .red
		emailErrorLabel.text = "Неверная форма ввода"
	}
	

	func validPasswordTF(){
		passwordTextField.layer.borderColor = UIColor.black.cgColor
		passwordTextField.textColor = .black
		passwordErrorLabel.text = ""
		showPassButton.setImage(UIImage(named: "openEye"), for: .normal)
		
	}
	
	func notValidPasswordTF(){
		passwordTextField.layer.borderColor = UIColor.red.cgColor
		passwordTextField.textColor = .red
		passwordErrorLabel.text = "Пароль должен быть не менее 6 символов"
		showPassButton.setImage(UIImage(named: "redOpenEye"), for: .normal)
	}
	
	
}

