//
//  MasterProvider.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import Foundation
import Moya
import RxSwift

final class MasterProvider<T>: MoyaProvider<T> where T: TargetType {

	convenience init() {
		let endpointClosure = { (target: T) -> Endpoint in
			let defaultEndpointMapping = MoyaProvider
				.defaultEndpointMapping(for: target)
				.adding(newHTTPHeaderFields: [Consts.API.xContentTypeName: Consts.API.xContentTypeValue])

//			if let token = LocalUserStorage.accessToken {
//				return defaultEndpointMapping.adding(newHTTPHeaderFields: [Consts.API.authorizationHeader: "\(token)"])
//			}

			return defaultEndpointMapping
		}
		let logger = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: [.formatRequestAscURL, .errorResponseBody]))
		let plugins = Consts.API.backendVerbose ?
			[NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)), logger] : []

		self.init(endpointClosure: endpointClosure,
				  plugins: plugins)
	}
}
