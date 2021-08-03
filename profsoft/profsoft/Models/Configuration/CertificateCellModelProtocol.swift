//
//  CertificateCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 04.08.2021.
//

import Foundation
import RxCocoa

protocol CertificateCellModelProtocol {
	var certificateId: String { get }
}

struct CertificateCellModel {
	let certificateId: String
}

extension CertificateCellModel: CertificateCellModelProtocol {}
