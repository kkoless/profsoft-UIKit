//
//  LoginScreenViewModel.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct LoginScreenViewModelInput: LoginScreenViewModelInputProtocol {
	var emailTextField: UITextField
	var passwordTextField: UITextField
	
	var forgotPassButton: UIButton
	var enterButton: UIButton
	var showPassButton: UIButton
	
	var passwordErrorLabel: UILabel
	var emailErrorLabel: UILabel
}

struct LoginScreenViewModelOutput: LoginScreenViewModelOutputProtocol {
	
}

struct LoginScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
}

extension LoginScreenViewModel: LoginScreenViewModelProtocol {
	
	func transform(input: LoginScreenViewModelInputProtocol) -> LoginScreenViewModelOutputProtocol {
		
		let validEmailData = input.emailTextField.rx.text.orEmpty
			.flatMap{ data -> Observable<Bool> in
				if data.isEmpty || !validUserEmailData(data: data){
					return .just(false)
				}

				return .just(true)
			}

		let validPasswordData = input.passwordTextField.rx.text.orEmpty
			.flatMap{ data -> Observable<Bool> in
				if data.isEmpty || !validUserPasswordData(data: data){
					return .just(false)
				}

				return .just(true)
			}
		
		input.enterButton.rx.tap
			.map{ _ in
				let userEmail = input.emailTextField.text!
				let userPassword = input.passwordTextField.text!
				
				if loginToAccount(email: userEmail, password: userPassword) { return AppStep.loginSucces }
				
				else {
					validEmailData.subscribe(onNext: { data in
						data ? validEmailTF(emailTextField: input.emailTextField, emailErrorLabel: input.emailErrorLabel) : notValidEmailTF(emailTextField: input.emailTextField, emailErrorLabel: input.emailErrorLabel)
						
					}).disposed(by: disposeBag)
					
					
					validPasswordData.subscribe(onNext: { data in
						data ? validPasswordTF(passwordTextField: input.passwordTextField, passwordErrorLabel: input.passwordErrorLabel, showPassButton: input.showPassButton) : notValidPasswordTF(passwordTextField: input.passwordTextField, passwordErrorLabel: input.passwordErrorLabel, showPassButton: input.showPassButton)
						
					}).disposed(by: disposeBag)
					
					return AppStep.none
				}
			}
			.bind(to: steps)
			.disposed(by: disposeBag)
		
		
		input.forgotPassButton.rx.tap
			.map{AppStep.showAlert}
			.bind(to: steps)
			.disposed(by: disposeBag)
		
		
		let output = LoginScreenViewModelOutput()
		
		return output
	}
}

private extension LoginScreenViewModel {
	
	func loginToAccount(email: String, password: String) -> Bool {
		let userEmail = Consts.UserCredentials.email
		let userPassword = Consts.UserCredentials.password
		
		let resp = email == userEmail && password == userPassword ? true : false
		
		return resp
	}
	
	
	// --------
	
	
	func validEmailTF(emailTextField: UITextField, emailErrorLabel: UILabel){
		emailTextField.layer.borderColor = UIColor.black.cgColor
		emailTextField.textColor = .black
		emailErrorLabel.text = ""
	}
	func notValidEmailTF(emailTextField: UITextField, emailErrorLabel: UILabel){
		emailTextField.layer.borderColor = UIColor.red.cgColor
		emailTextField.textColor = .red
		emailErrorLabel.text = "Неверная форма ввода"
	}
	
	
	// -------
	
	
	func validPasswordTF(passwordTextField: UITextField, passwordErrorLabel: UILabel, showPassButton: UIButton){
		passwordTextField.layer.borderColor = UIColor.black.cgColor
		passwordTextField.textColor = .black
		passwordErrorLabel.text = ""
		showPassButton.setImage(UIImage(named: "openEye"), for: .normal)
		
	}
	
	func notValidPasswordTF(passwordTextField: UITextField, passwordErrorLabel: UILabel, showPassButton: UIButton){
		passwordTextField.layer.borderColor = UIColor.red.cgColor
		passwordTextField.textColor = .red
		passwordErrorLabel.text = "Пароль должен быть не менее 6 символов"
		showPassButton.setImage(UIImage(named: "redOpenEye"), for: .normal)
	}
	
	func validUserEmailData(data: String) -> Bool {
		!data.contains("@") || !data.contains(".") ? false : true
	}
	
	func validUserPasswordData(data: String) -> Bool {
		data.count < 6 ? false : true
	}
	
	func apdateEnterButton(enterButton: UIButton) {
		enterButton.backgroundColor = .black
		enterButton.layer.borderColor = UIColor.black.cgColor
	}
	
}
