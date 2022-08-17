//
//  SearchViewModel.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/15.
//

import Combine
import Foundation

enum ServiceError: Error {
    case invalidURL
    case transportError
    case serverError(code: Int)
    case wrongResult
}

class SearchViewModel: ObservableObject {
    var cancelBag = Set<AnyCancellable>()
    
    func requestAppData(id: String) -> AnyPublisher<Detail, Error> {
        guard let url = URL(string: "http://itunes.apple.com/lookup?id=" + id) else {
            return Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw ServiceError.transportError
                }
                guard httpResponse.statusCode == 200 else {
                    throw ServiceError.serverError(code: httpResponse.statusCode)
                }
                return data
            }
            .decode(type: AppleITunes.self, decoder: jsonDecoder)
            .tryMap { appleITunes in
                guard appleITunes.resultCount > 0,
                      let result = appleITunes.results.first
                else {
                    throw ServiceError.wrongResult
                }
                return result
            }
            .eraseToAnyPublisher()
    }
}
