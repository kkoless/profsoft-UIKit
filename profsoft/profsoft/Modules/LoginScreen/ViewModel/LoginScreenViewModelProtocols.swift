//
//  LoginScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol LoginScreenViewModelInputProtocol {
	
}

protocol LoginScreenViewModelOutputProtocol {
}

protocol LoginScreenViewModelProtocol {
	func transform(input: LoginScreenViewModelInputProtocol) -> LoginScreenViewModelOutputProtocol
}
