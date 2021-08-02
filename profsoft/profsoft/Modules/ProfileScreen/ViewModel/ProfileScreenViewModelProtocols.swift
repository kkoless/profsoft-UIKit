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
}

protocol ProfileScreenViewModelOutputProtocol {
}

protocol ProfileScreenViewModelProtocol {
	func transform(input: ProfileScreenViewModelInputProtocol) -> ProfileScreenViewModelOutputProtocol
}

