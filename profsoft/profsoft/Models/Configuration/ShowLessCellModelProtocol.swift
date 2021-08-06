//
//  ShowLessCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 07.08.2021.
//

import Foundation
import RxCocoa

protocol ShowLessCellModelProtocol {
	var tapToLess: PublishRelay<Void> { get }
}

struct ShowLessCellModel {
	var tapToLess: PublishRelay<Void>
}

extension ShowLessCellModel: ShowLessCellModelProtocol {}
