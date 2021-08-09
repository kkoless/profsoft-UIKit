//
//  SearchScreenViewModelProtocols.swift
//  profsoft
//
//  Created by Кирилл Колесников on 09.08.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchScreenViewModelInputProtocol {

}

protocol SearchScreenViewModelOutputProtocol {
	
}

protocol SearchScreenViewModelProtocol {
	func transform(input: SearchScreenViewModelInputProtocol) -> SearchScreenViewModelOutputProtocol
}
