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
		
		let showTapMore = PublishRelay<Void>()
		let showTapLess = PublishRelay<Void>()
		
		input.onAppear
			.withLatestFrom(mockItems)
			.map{ _ in ProfileScreenBuilder.build(showTapMore: showTapMore) }
			.bind(to: sections)
			.disposed(by: disposeBag)
		
		showTapMore.asObservable()
			.map{ _ in ProfileScreenBuilder.extendedBuild(showTapLess: showTapLess) }
			.bind(to: sections)
			.disposed(by: disposeBag)
		
		showTapLess.asObservable()
			.map{ _ in ProfileScreenBuilder.build(showTapMore: showTapMore) }
			.bind(to: sections)
			.disposed(by: disposeBag)
		

		
		let output = ProfileScreenViewModelOutput(sections: sections.asDriver(onErrorJustReturn: []))
		
		return output
	}
}
