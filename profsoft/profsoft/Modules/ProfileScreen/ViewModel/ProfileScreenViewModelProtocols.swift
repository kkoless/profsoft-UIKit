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
	var imagePicker: ImagePicker { get }
	var tableView: UITableView { get }
	var userImage: BehaviorRelay<UIImage> { get }
}

protocol ProfileScreenViewModelOutputProtocol {
	var dataSource: ProfileScreenDataSource.DataSource { get }
	var sections: Driver<[ProfileScreenDataSource.SectionType]> { get }
}

protocol ProfileScreenViewModelProtocol {
	func transform(input: ProfileScreenViewModelInputProtocol) -> ProfileScreenViewModelOutputProtocol
}

