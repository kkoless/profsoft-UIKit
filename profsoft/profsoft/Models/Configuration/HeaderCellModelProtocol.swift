//
//  HeaderCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import Foundation
import RxCocoa

protocol HeaderCellModelProtocol {
	var userInfo: String { get }
	var userEmail: String  { get }
	var userImage: UIImage { get }
	var imageTap: PublishRelay<Void> { get }
}

struct HeaderCellModel {
	let userInfo: String
	let userEmail: String
	let userImage: UIImage
	let imageTap: PublishRelay<Void>
}

extension HeaderCellModel: HeaderCellModelProtocol {
}

