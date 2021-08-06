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
	case none
	case courses
}

enum ProfileScreenItem {
	case header(model: HeaderCellModelProtocol)
	case sectionName
	case certificate(model: CertificateCellModelProtocol)
	case direction(model: DirectionCellModelProtocol)
	case educationForm(model: EducationFormCellModelProtocol)
	case studyPeriod(model: StudyPeriodCellModelProtocol)
	case showMore(model: ShowMoreCellModelProtocol)
	case study(model: StudyCellModelProtocol)
	case teacher(model: TeacherCellModelProtocol)
	// и другие
}

final class ProfileScreenDataSource {

	typealias SectionType = SectionModel<String, ProfileScreenItem>

	typealias DataSource = RxTableViewSectionedReloadDataSource<SectionType>

	let dataSource = DataSource { dataSource, tableView, indexPath, _ -> UITableViewCell in
		switch dataSource[indexPath] {
			case .header(model: let model):
				return CellBuilder<HeaderTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
			case .sectionName:
				return EmptyCellBuilder<SectionCourcesTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath)
				
			case .certificate(model: let model):
				return CellBuilder<CertificateTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
			case .direction(model: let model):
				return CellBuilder<DirectionTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
			case .educationForm(model: let model):
				return CellBuilder<EducationFormTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
			case .studyPeriod(model: let model):
				return CellBuilder<StudyPeriodTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
			case .showMore(model: let model):
				return CellBuilder<ShowMoreTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
												
			case .study(model: let model):
				return CellBuilder<StudyTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
			case .teacher(model: let model):
				return CellBuilder<TeacherTableViewCell>.build(tableView: tableView,
															  indexPath: indexPath,
															  model: model)
				
			default:
				return UITableViewCell()
		}
	}
}
