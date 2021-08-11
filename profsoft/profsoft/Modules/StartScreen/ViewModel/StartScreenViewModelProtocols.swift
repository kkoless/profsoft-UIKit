//
//  StartScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//


import Foundation
import RxCocoa
import RxSwift

protocol StartScreenViewModelInputProtocol {
	var onEnterButtonTap: Observable<Void> { get }
	var onSkipButtonTap: Observable<Void> { get }
}

protocol StartScreenViewModelOutputProtocol {
}

protocol StartScreenViewModelProtocol {
	func transform(input: StartScreenViewModelInputProtocol) -> StartScreenViewModelOutputProtocol
}
