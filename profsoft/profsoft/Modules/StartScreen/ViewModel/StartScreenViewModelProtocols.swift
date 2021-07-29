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
	//var onAppear: Observable<Void> { get }
	var enterButton: UIButton { get }
	var skipButton: UIButton { get }
}

protocol StartScreenViewModelOutputProtocol {
}

protocol StartScreenViewModelProtocol {
	func transform(input: StartScreenViewModelInputProtocol) -> StartScreenViewModelOutputProtocol
}
