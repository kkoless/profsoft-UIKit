//
//  ProfileScreenBuilder.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import Foundation
import RxCocoa

struct ProfileScreenBuilder {

	typealias SectionType = ProfileScreenDataSource.SectionType

	static func build() -> [SectionType] {

		var items = [ProfileScreenItem]()

		let user = ProfileScreenItem.header(model: HeaderCellModel(userInfo: "Кожин Александр Сергеевич".uppercased(), userEmail: "kologram@gmail.com", imageTap: PublishRelay<Void>()))
		
		items.append(user)

		return [SectionType(model: ProfileScreenHeader.courses, items: items)]
	}
}
