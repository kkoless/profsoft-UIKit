//
//  StartScreenViewModel.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct StartScreenViewModelInput: StartScreenViewModelInputProtocol {
	var enterButton: UIButton
	var skipButton: UIButton
	
}

struct StartScreenViewModelOutput: StartScreenViewModelOutputProtocol {
	
}

struct StartScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
	
}

extension StartScreenViewModel: StartScreenViewModelProtocol {
	func transform(input: StartScreenViewModelInputProtocol) -> StartScreenViewModelOutputProtocol {
		
		input.enterButton.rx.tap
			.map{ AppStep.login }.bind(to: steps).disposed(by: disposeBag)
		
		
		let output = StartScreenViewModelOutput()
		
		return output
	}
}
