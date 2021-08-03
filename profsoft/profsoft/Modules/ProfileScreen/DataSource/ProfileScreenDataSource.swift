//
//  ProfileScreenDataSource.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import Foundation
import RxDataSources
import UIKit
import RxCocoa

enum ProfileScreenHeader {
	case courses
}

enum ProfileScreenItem {
	case header(model: HeaderCellModelProtocol)
	case loyalityCard
	// и другие
}

final class ProfileScreenDataSource {

	typealias SectionType = SectionModel<ProfileScreenHeader, ProfileScreenItem>

	typealias DataSource = RxTableViewSectionedReloadDataSource<SectionType>

	let dataSource = DataSource { dataSource, tableView, indexPath, _ -> UITableViewCell in
		switch dataSource[indexPath] {
		case let .header(model: model):
			return CellBuilder<HeaderTableViewCell>.build(tableView: tableView,
															   indexPath: indexPath,
															   model: model)
		default:
			return UITableViewCell()
		}
	}
}
