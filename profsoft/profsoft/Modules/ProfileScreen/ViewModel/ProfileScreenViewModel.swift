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
	let onAppear: Observable<Void>
}

struct ProfileScreenViewModelOutput: ProfileScreenViewModelOutputProtocol {
	let dataSource = ProfileScreenDataSource().dataSource
	let sections: Driver<[ProfileScreenDataSource.SectionType]>
}

struct ProfileScreenViewModel: Stepper {
	let disposeBag = DisposeBag()
	var steps = PublishRelay<Step>()
}

extension ProfileScreenViewModel: ProfileScreenViewModelProtocol {
	
	typealias SectionType = ProfileScreenDataSource.SectionType
	
	func transform(input: ProfileScreenViewModelInputProtocol) -> ProfileScreenViewModelOutputProtocol {
		
		let sections = BehaviorRelay<[SectionType]>(value: [])
		let mockItems = BehaviorRelay<[String]>(value: [])
		
		let showTap = PublishRelay<Void>()
		
		input.onAppear
			.withLatestFrom(mockItems)
			.map{ _ in ProfileScreenBuilder.build(showTapMore: showTap) }
			.bind(to: sections)
			.disposed(by: disposeBag)
		
		showTap.asObservable()
			.map{ _ in ProfileScreenBuilder.extendedBuild() }
			.bind(to: sections)
			.disposed(by: disposeBag)
		

		
		let output = ProfileScreenViewModelOutput(sections: sections.asDriver(onErrorJustReturn: []))
		
		return output
	}
}
