//
//  TeacherCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 06.08.2021.
//

import Foundation
import RxCocoa

protocol TeacherCellModelProtocol {
	var teacherName: String { get }
}

struct TeacherCellModel {
	var teacherName: String
}

extension TeacherCellModel: TeacherCellModelProtocol {}
