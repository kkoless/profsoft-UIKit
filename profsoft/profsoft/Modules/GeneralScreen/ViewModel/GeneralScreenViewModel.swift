//
//  GeneralScreenViewModel.swift
//  profsoft
//
//  Created by Кирилл Колесников on 09.08.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct GeneralScreenViewModelInput: GeneralScreenViewModelInputProtocol {

}

struct GeneralScreenViewModelOutput: GeneralScreenViewModelOutputProtocol {
	
}

struct GeneralScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
	
}

extension GeneralScreenViewModel: GeneralScreenViewModelProtocol {
	func transform(input: GeneralScreenViewModelInputProtocol) -> GeneralScreenViewModelOutputProtocol {
		
		let output = GeneralScreenViewModelOutput()
		
		return output
	}
}
