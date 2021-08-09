//
//  GeneralScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 09.08.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol GeneralScreenViewModelInputProtocol {

}

protocol GeneralScreenViewModelOutputProtocol {
	
}

protocol GeneralScreenViewModelProtocol {
	func transform(input: GeneralScreenViewModelInputProtocol) -> GeneralScreenViewModelOutputProtocol
}
