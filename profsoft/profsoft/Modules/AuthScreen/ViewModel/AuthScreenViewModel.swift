//
//  AuthScreenViewModel.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct AuthScreenViewModelInput: AuthScreenViewModelInputProtocol {
	let onAppear: Observable<Void>
}

struct AuthScreenViewModelOutput: AuthScreenViewModelOutputProtocol {
	
}

struct AuthScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
}

extension AuthScreenViewModel: AuthScreenViewModelProtocol {
	func transform(input: AuthScreenViewModelInputProtocol) -> AuthScreenViewModelOutputProtocol {
		let output = AuthScreenViewModelOutput()
		return output
	}
}
