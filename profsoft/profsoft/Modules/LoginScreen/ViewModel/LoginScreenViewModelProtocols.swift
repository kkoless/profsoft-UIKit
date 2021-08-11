//
//  LoginScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol LoginScreenViewModelInputProtocol {
	var onForgotPassButtonTap: Observable<Void> { get }
	var onEnterButtonTap: Observable<Void> { get }
	var onShowPassButtonTap: Observable<Void> { get }
	
	var passwordText: Observable<String> { get }
	var emailText: Observable<String> { get }
}

protocol LoginScreenViewModelOutputProtocol {
	var errorPassData: Driver<Void> { get }
	var errorEmailData: Driver<Void> { get }
	var successPassData: Driver<Void> { get }
	var successEmailData: Driver<Void> { get }
}

protocol LoginScreenViewModelProtocol {
	func transform(input: LoginScreenViewModelInputProtocol) -> LoginScreenViewModelOutputProtocol
}
