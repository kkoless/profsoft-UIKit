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

	static func build(imageUser: BehaviorRelay<UIImage>, imageTap: PublishRelay<Void>, showTapMore: PublishRelay<Void>, showTapLess: PublishRelay<Void>) -> [SectionType] {
		

		var courcesItems = [ProfileScreenItem]()
		
		let headerModel = HeaderCellModel(userInfo: "Кожин Александр Сергеевич".uppercased(), userEmail: "kologram@gmail.com", userImage: imageUser.value, imageTap: imageTap)
		let certificateNumbModel = CertificateNumbCellModel(certificateId: "№ 08-09270-7321897")
		let directionModel = DirectionCellModel(directionName: "Design")
		let educationFormModel = EducationFormCellModel(educationName: "очная")
		let studyPeriodModel = StudyPeriodCellModel(startPeriod: "01.07.2021", endPeriod: "30.08.2021")
		let showMoreModel = ShowMoreCellModel(tapToMore: showTapMore)
		let showLessModel = ShowLessCellModel(tapToLess: showTapLess)

		
		let user = ProfileScreenItem.header(model: headerModel)
		
		let sectionCources = ProfileScreenItem.sectionName
		
		let certificateNumb1 = ProfileScreenItem.certificateNumb(model: certificateNumbModel)
		let direction1 = ProfileScreenItem.direction(model: directionModel)
		let educationForm1 = ProfileScreenItem.educationForm(model: educationFormModel)
		let studyPeriod1 = ProfileScreenItem.studyPeriod(model: studyPeriodModel)
		let showMore1 = ProfileScreenItem.showMore(model: showMoreModel)
		
		let certificateNumb2 = ProfileScreenItem.certificateNumb(model: certificateNumbModel)
		let direction2 = ProfileScreenItem.direction(model: directionModel)
		let educationForm2 = ProfileScreenItem.educationForm(model: educationFormModel)
		let studyPeriod2 = ProfileScreenItem.studyPeriod(model: studyPeriodModel)
		let showMore2 = ProfileScreenItem.showMore(model: showMoreModel)
		
		courcesItems.append(sectionCources)
		courcesItems.append(certificateNumb1)
		courcesItems.append(direction1)
		courcesItems.append(educationForm1)
		courcesItems.append(studyPeriod1)
		courcesItems.append(showMore1)
		
		courcesItems.append(certificateNumb2)
		courcesItems.append(direction2)
		courcesItems.append(educationForm2)
		courcesItems.append(studyPeriod2)
		courcesItems.append(showMore2)

		return [
			SectionType(model: .none, items: [user]),
			SectionType(model: .courses, items: courcesItems)
		]
	}
	
	static func extendedBuild(imageUser: BehaviorRelay<UIImage>, imageTap: PublishRelay<Void>, showTapLess: PublishRelay<Void>, showTapMore: PublishRelay<Void>) -> [SectionType] {
		
		var courcesItems = [ProfileScreenItem]()

		let headerModel = HeaderCellModel(userInfo: "Кожин Александр Сергеевич".uppercased(), userEmail: "kologram@gmail.com", userImage: imageUser.value, imageTap: imageTap)
		let certificateNumbModel = CertificateNumbCellModel(certificateId: "№ 08-09270-7321897")
		let directionModel = DirectionCellModel(directionName: "Design")
		let educationFormModel = EducationFormCellModel(educationName: "очная")
		let studyPeriodModel = StudyPeriodCellModel(startPeriod: "01.07.2021", endPeriod: "30.08.2021")
		let studyDescriptionModel = StudyCellModel(studyDiscription: "Создание макетов и прототипов Web и Мобильных приложения для платформ iOS, Android в Figma. Изучение UXPin, практическое применение полученных знаний")
		let teacherModel = TeacherCellModel(teacherName: "Щелкунова Юлия Сергеевна")
		let showLessModel = ShowLessCellModel(tapToLess: showTapLess)
		let showMoreModel = ShowMoreCellModel(tapToMore: showTapMore)
		
		
		let user = ProfileScreenItem.header(model: headerModel)
		
		let sectionCources = ProfileScreenItem.sectionName
		
		
		let certificateNumb1 = ProfileScreenItem.certificateNumb(model: certificateNumbModel)
		let direction1 = ProfileScreenItem.direction(model: directionModel)
		let educationForm1 = ProfileScreenItem.educationForm(model: educationFormModel)
		let studyPeriod1 = ProfileScreenItem.studyPeriod(model: studyPeriodModel)
		let studyDescription1 = ProfileScreenItem.study(model: studyDescriptionModel)
		let teacher1 = ProfileScreenItem.teacher(model: teacherModel)
		let certificate1 = ProfileScreenItem.certificate
		let share1 = ProfileScreenItem.share
		let showLess1 = ProfileScreenItem.showLess(model: showLessModel)
		
		let certificateNumb2 = ProfileScreenItem.certificateNumb(model: certificateNumbModel)
		let direction2 = ProfileScreenItem.direction(model: directionModel)
		let educationForm2 = ProfileScreenItem.educationForm(model: educationFormModel)
		let studyPeriod2 = ProfileScreenItem.studyPeriod(model: studyPeriodModel)
		let showMore2 = ProfileScreenItem.showMore(model: showMoreModel)
		
		courcesItems.append(sectionCources)
		courcesItems.append(certificateNumb1)
		courcesItems.append(direction1)
		courcesItems.append(educationForm1)
		courcesItems.append(studyPeriod1)
		courcesItems.append(studyDescription1)
		courcesItems.append(teacher1)
		courcesItems.append(certificate1)
		courcesItems.append(share1)
		courcesItems.append(showLess1)

		courcesItems.append(certificateNumb2)
		courcesItems.append(direction2)
		courcesItems.append(educationForm2)
		courcesItems.append(studyPeriod2)
		courcesItems.append(showMore2)
		
		return [
			SectionType(model: .none, items: [user]),
			SectionType(model: .courses, items: courcesItems)
		]
	}
}
