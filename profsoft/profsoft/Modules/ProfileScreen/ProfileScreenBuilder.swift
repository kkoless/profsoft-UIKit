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

		var courcesItems = [ProfileScreenItem]()

		let user = ProfileScreenItem.header(model: HeaderCellModel(userInfo: "Кожин Александр Сергеевич".uppercased(), userEmail: "kologram@gmail.com", imageTap: PublishRelay<Void>()))
		
		let certificate = ProfileScreenItem.certificate(model: CertificateCellModel(certificateId: "№ 08-09270-7321897"))
		
		courcesItems.append(certificate)

		return [
			SectionType(model: String(), items: [user]),
			SectionType(model: "Мои курсы", items: courcesItems)
		]
	}
}
