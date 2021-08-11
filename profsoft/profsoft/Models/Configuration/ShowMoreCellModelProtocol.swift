//
//  ShowMoreCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 06.08.2021.
//

import Foundation
import RxCocoa

protocol ShowMoreCellModelProtocol {
	var tapToMore: PublishRelay<Void> { get }
}

struct ShowMoreCellModel {
	var tapToMore: PublishRelay<Void>
}

extension ShowMoreCellModel: ShowMoreCellModelProtocol {}
