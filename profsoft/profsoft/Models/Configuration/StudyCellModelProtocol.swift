//
//  StudyCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import Foundation
import RxCocoa

protocol StudyCellModelProtocol {
	var studyDiscription: String { get }
}

struct StudyCellModel {
	var studyDiscription: String
}

extension StudyCellModel: StudyCellModelProtocol {}
