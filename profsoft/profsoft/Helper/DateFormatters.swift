//
//  DateFormatters.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import Foundation

struct DateFormatters {

	static let locale = Locale(identifier: "ru")

	static let fullDate: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = .current
		dateFormatter.locale = locale
		dateFormatter.dateFormat = "dd.MM.YYYY"
		return dateFormatter
	}()

	static let fullDatePicker: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = .current
		dateFormatter.locale = locale
		dateFormatter.dateFormat = "EEEE d MMMM"
		return dateFormatter
	}()

	static let serverDate: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = .current
		dateFormatter.locale = locale
		dateFormatter.dateFormat = "dd-MM-YYYY"
		return dateFormatter
	}()

	static let dayMounth: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = .current
		dateFormatter.locale = locale
		dateFormatter.dateFormat = "d MMMM"
		return dateFormatter
	}()

	static let dayMonthYear: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = .current
		dateFormatter.locale = locale
		dateFormatter.dateFormat = "d MMMM YYYY"
		return dateFormatter
	}()

	static let hoursMinutes: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = .current
		dateFormatter.locale = locale
		dateFormatter.timeStyle = .short
		return dateFormatter
	}()
}
