//
//  ProfileScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol ProfileScreenViewModelInputProtocol {
	var onAppear: Observable<Void> { get }
}

protocol ProfileScreenViewModelOutputProtocol {
	var dataSource: ProfileScreenDataSource.DataSource { get }
	var sections: Driver<[ProfileScreenDataSource.SectionType]> { get }
}

protocol ProfileScreenViewModelProtocol {
	func transform(input: ProfileScreenViewModelInputProtocol) -> ProfileScreenViewModelOutputProtocol
}

