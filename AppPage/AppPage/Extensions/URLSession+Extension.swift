//
//  URLSession+Extension.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/17.
//

import Combine
import Foundation

extension URLSession {
    func publisher(for request: URLRequest) -> AnyPublisher<Result<URLSession.DataTaskPublisher.Output, Error>, Error> {
       return dataTaskPublisher(for: request)
          .tryMap { output -> Result<URLSession.DataTaskPublisher.Output, Error> in
              guard let httpResponse = output.response as? HTTPURLResponse else {
                  return .failure(ServiceError.transportError)
              }
              guard httpResponse.statusCode == 200 else {
                  throw ServiceError.serverError(code: httpResponse.statusCode)
              }
              
              return .success(output)
          }
          .eraseToAnyPublisher()
   }
}
