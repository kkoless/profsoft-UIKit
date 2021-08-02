//
//  ProfileScreenViewModel.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct ProfileScreenViewModelInput: ProfileScreenViewModelInputProtocol {

}

struct ProfileScreenViewModelOutput: ProfileScreenViewModelOutputProtocol {
	
}

struct ProfileScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
}

extension ProfileScreenViewModel: ProfileScreenViewModelProtocol {
	
	func transform(input: ProfileScreenViewModelInputProtocol) -> ProfileScreenViewModelOutputProtocol {
		
		
		let output = ProfileScreenViewModelOutput()
		
		return output
	}
}
