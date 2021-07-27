//
//  AuthScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//


import Foundation
import RxCocoa
import RxSwift

protocol AuthScreenViewModelInputProtocol {
	var onAppear: Observable<Void> { get }
}

protocol AuthScreenViewModelOutputProtocol {
}

protocol AuthScreenViewModelProtocol {
	func transform(input: AuthScreenViewModelInputProtocol) -> AuthScreenViewModelOutputProtocol
}
