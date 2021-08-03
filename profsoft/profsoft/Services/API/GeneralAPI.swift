//
//  GeneralAPI.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import Foundation
import Moya


// ИЗМЕНИТЬ

enum GeneralAPI {
	case fetchGuest
	case fetchPromotions(page: Int, limit: Int)
}

extension GeneralAPI: TargetType {
	var baseURL: URL {
		return Consts.API.baseUrl
	}

	var path: String {
		switch self {
		case .fetchGuest:
			return "/api/v1/security/login/guest"
		case .fetchPromotions:
			return "/api/v1/promotions"
		}
	}

	var method: Moya.Method {
		switch self {
		case .fetchGuest:
			return .post
		case .fetchPromotions:
			return .get
		}
	}

	var sampleData: Data {
		return Data()
	}

	var task: Task {

		var params = [String: Any]()

		switch self {
		case .fetchGuest:
			params["pushToken"] = "jdajkhdsjkahjk"
			params["cityId"] = 1
			params["shopId"] = 1
			params["deviceType"] = "ios"

			return .requestCompositeParameters(bodyParameters: params,
											   bodyEncoding: JSONEncoding.default,
											   urlParameters: [:])

		case let .fetchPromotions(page: page, limit: limit):
			params["p[page]"] = page
			params["p[amount]"] = limit

			return .requestParameters(parameters: params,
									  encoding: URLEncoding.default)
		}
	}

	var headers: [String : String]? {
		return nil
	}
}
