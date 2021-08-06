//
//  CertificateCellModelProtocol.swift
//  profsoft
//
//  Created by Кирилл Колесников on 04.08.2021.
//

import Foundation
import RxCocoa

protocol CertificateNumbCellModelProtocol {
	var certificateId: String { get }
}

struct CertificateNumbCellModel {
	let certificateId: String
}

extension CertificateNumbCellModel: CertificateNumbCellModelProtocol {}
