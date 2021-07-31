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
	
}

struct LoginScreenViewModelOutput: LoginScreenViewModelOutputProtocol {
	
}

struct LoginScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
}

extension LoginScreenViewModel: LoginScreenViewModelProtocol {
	func transform(input: LoginScreenViewModelInputProtocol) -> LoginScreenViewModelOutputProtocol {
		
		input.forgotPassButton.rx.tap
			.map{AppStep.showAlert}
			.bind(to: steps)
			.disposed(by: disposeBag)
		
//		input.passwordTextField.rx
//			.controlEvent(.editingDidEndOnExit)
//			.subscribe(onNext: { _ in
//				input.passwordTextField.resignFirstResponder()
//			})
//			.disposed(by: disposeBag)
//
//		input.emailTextField.rx
//			.controlEvent(.editingDidEndOnExit)
//			.subscribe(onNext: { _ in
//				input.passwordTextField.resignFirstResponder()
//			})
//			.disposed(by: disposeBag)
		
		let output = LoginScreenViewModelOutput()
		
		return output
	}
}

