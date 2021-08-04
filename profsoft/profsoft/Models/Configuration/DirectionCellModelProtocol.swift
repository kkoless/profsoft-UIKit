//
//  DirectionCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import Foundation
import RxCocoa

protocol DirectionCellModelProtocol {
	var directionName: String { get }
}

struct DirectionCellModel {
	let directionName: String
}

extension DirectionCellModel: DirectionCellModelProtocol {}
