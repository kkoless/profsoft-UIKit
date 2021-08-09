//
//  SearchScreenViewModel.swift
//  profsoft
//
//  Created by Кирилл Колесников on 09.08.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct SearchScreenViewModelInput: SearchScreenViewModelInputProtocol {

}

struct SearchScreenViewModelOutput: SearchScreenViewModelOutputProtocol {
	
}

struct SearchScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
	
}

extension SearchScreenViewModel: SearchScreenViewModelProtocol {
	func transform(input: SearchScreenViewModelInputProtocol) -> SearchScreenViewModelOutputProtocol {
		
		let output = SearchScreenViewModelOutput()
		
		return output
	}
}
