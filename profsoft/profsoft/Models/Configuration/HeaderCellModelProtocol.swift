//
//  HeaderCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import Foundation
import RxCocoa

protocol HeaderCellModelProtocol {
	//var userImage: UIImage { get }
	var userInfo: String { get }
	var userEmail: String  { get }
	var imageTap: PublishRelay<Void> { get }
}

struct HeaderCellModel {
	//let userImage: UIImage
	let userInfo: String
	let userEmail: String
	let imageTap: PublishRelay<Void>
}

extension HeaderCellModel: HeaderCellModelProtocol {}

