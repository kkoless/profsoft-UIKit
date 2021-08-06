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

	static func build(showTapMore: PublishRelay<Void>) -> [SectionType] {
		

		var courcesItems = [ProfileScreenItem]()

		let user = ProfileScreenItem.header(model: HeaderCellModel(userInfo: "Кожин Александр Сергеевич".uppercased(), userEmail: "kologram@gmail.com", imageTap: PublishRelay<Void>()))
		
		let sectionCources = ProfileScreenItem.sectionName
		
		let certificate = ProfileScreenItem.certificate(model: CertificateCellModel(certificateId: "№ 08-09270-7321897"))
		
		let direction = ProfileScreenItem.direction(model: DirectionCellModel(directionName: "Design"))
		
		let educationForm = ProfileScreenItem.educationForm(model: EducationFormCellModel(educationName: "очная"))
		
		let studyPeriod = ProfileScreenItem.studyPeriod(model: StudyPeriodCellModel(startPeriod: "01.07.2021", endPeriod: "30.08.2021"))
		
		let showMore = ProfileScreenItem.showMore(model: ShowMoreCellModel(tapToMore: showTapMore))
		
		courcesItems.append(certificate)
		courcesItems.append(direction)
		courcesItems.append(educationForm)
		courcesItems.append(studyPeriod)
		courcesItems.append(showMore)

		return [
			SectionType(model: "", items: [user]),
			SectionType(model: "", items: [sectionCources]),
			SectionType(model: "Мои курсы".uppercased(), items: courcesItems)
		]
	}
	
	static func extendedBuild() -> [SectionType] {
		
		var courcesItems = [ProfileScreenItem]()

		let user = ProfileScreenItem.header(model: HeaderCellModel(userInfo: "Кожин Александр Сергеевич".uppercased(), userEmail: "kologram@gmail.com", imageTap: PublishRelay<Void>()))
		
		let sectionCources = ProfileScreenItem.sectionName
		
		let certificate = ProfileScreenItem.certificate(model: CertificateCellModel(certificateId: "№ 08-09270-7321897"))
		
		let direction = ProfileScreenItem.direction(model: DirectionCellModel(directionName: "Design"))
		
		let educationForm = ProfileScreenItem.educationForm(model: EducationFormCellModel(educationName: "очная"))
		
		let studyPeriod = ProfileScreenItem.studyPeriod(model: StudyPeriodCellModel(startPeriod: "01.07.2021", endPeriod: "30.08.2021"))
		
		let studyDescription = ProfileScreenItem.study(model: StudyCellModel(studyDiscription: "Создание макетов и прототипов Web и Мобильных приложения для платформ iOS, Android в Figma. Изучение UXPin, практическое применение полученных знаний"))
		
		let teacher = ProfileScreenItem.teacher(model: TeacherCellModel(teacherName: "Щелкунова Юлия Сергеевна"))
		
		courcesItems.append(certificate)
		courcesItems.append(direction)
		courcesItems.append(educationForm)
		courcesItems.append(studyPeriod)
		courcesItems.append(studyDescription)
		courcesItems.append(teacher)

		return [
			SectionType(model: "", items: [user]),
			SectionType(model: "", items: [sectionCources]),
			SectionType(model: "Мои курсы".uppercased(), items: courcesItems)
		]
	}
}
