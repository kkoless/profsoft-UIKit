//
//  EducationFormCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import Foundation
import RxCocoa

protocol EducationFormCellModelProtocol {
	var educationName: String { get }
}

struct EducationFormCellModel {
	let educationName: String
}

extension EducationFormCellModel: EducationFormCellModelProtocol {}
