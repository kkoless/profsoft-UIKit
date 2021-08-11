//
//  StudyPeriodCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import Foundation
import RxCocoa

protocol StudyPeriodCellModelProtocol {
	var startPeriod: String { get }
	var endPeriod: String { get }
}

struct StudyPeriodCellModel {
	var startPeriod: String
	var endPeriod: String
}

extension StudyPeriodCellModel: StudyPeriodCellModelProtocol {}
