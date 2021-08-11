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
	let onForgotPassButtonTap: Observable<Void>
	let onEnterButtonTap: Observable<Void>
	let onShowPassButtonTap: Observable<Void>
	
	let passwordText: Observable<String>
	let emailText: Observable<String>
}

struct LoginScreenViewModelOutput: LoginScreenViewModelOutputProtocol {
	let errorPassData: Driver<Void>
	let errorEmailData: Driver<Void>
	let successPassData: Driver<Void>
	let successEmailData: Driver<Void>
}

struct LoginScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
}

extension LoginScreenViewModel: LoginScreenViewModelProtocol {
	
	func transform(input: LoginScreenViewModelInputProtocol) -> LoginScreenViewModelOutputProtocol {
		
		let errorPassData = PublishRelay<Void>()
		let errorEmailData = PublishRelay<Void>()
		let successPassData = PublishRelay<Void>()
		let successEmailData = PublishRelay<Void>()
		
		
		input.onEnterButtonTap
			.map{ _ in
				let userEmail = input.emailText
				let userPassword = input.passwordText
				
				if loginToAccount(email: userEmail, password: userPassword) { return AppStep.loginSucces }
				
				else {
					
					input.emailText
						.map { !($0.isEmpty || !validUserEmailData(data: $0)) }
						.filter { !$0 }
						.map { _ in Void() }
						.bind(to: errorEmailData)
						.disposed(by: disposeBag)
					
					input.emailText
						.map { !($0.isEmpty || !validUserEmailData(data: $0)) }
						.filter { $0 }
						.map { _ in Void() }
						.bind(to: successEmailData)
						.disposed(by: disposeBag)
					
					
					input.passwordText
						.map { !($0.isEmpty || !validUserPasswordData(data: $0)) }
						.filter { !$0 }
						.map { _ in Void() }
						.bind(to: errorPassData)
						.disposed(by: disposeBag)
					
					input.passwordText
						.map { !($0.isEmpty || !validUserPasswordData(data: $0)) }
						.filter { $0 }
						.map { _ in Void() }
						.bind(to: successPassData)
						.disposed(by: disposeBag)
					
					return AppStep.none
				}
			}
			.bind(to: steps)
			.disposed(by: disposeBag)
		
		
		input.onForgotPassButtonTap
			.map{ AppStep.showAlert }
			.bind(to: steps)
			.disposed(by: disposeBag)
		
		
		let output = LoginScreenViewModelOutput(
			errorPassData: errorPassData.asDriver(onErrorDriveWith: .never()),
			errorEmailData: errorEmailData.asDriver(onErrorDriveWith: .never()),
			successPassData: successPassData.asDriver(onErrorDriveWith: .never()),
			successEmailData: successEmailData.asDriver(onErrorDriveWith: .never())
		)
		
		return output
	}
}

private extension LoginScreenViewModel {
	
	func loginToAccount(email: Observable<String>, password: Observable<String>) -> Bool {
		let userEmail = Consts.UserCredentials.email
		let userPassword = Consts.UserCredentials.password
		
		var inputEmail = ""
		var inputPass = ""
		
		email.subscribe(onNext: {
			text in
			inputEmail = text
		})
		.disposed(by: disposeBag)
		
		password.subscribe(onNext: {
			text in
			inputPass = text
		})
		.disposed(by: disposeBag)
		
		let resp = inputEmail == userEmail && inputPass == userPassword ? true : false
		
		return resp
	}
	
	func validUserEmailData(data: String) -> Bool {
		!data.contains("@") || !data.contains(".") ? false : true
	}
	
	func validUserPasswordData(data: String) -> Bool {
		data.count < 6 ? false : true
	}
	
}
