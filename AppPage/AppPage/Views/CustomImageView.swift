//
//  CustomImageView.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/17.
//

import Combine
import UIKit

final class CustomImageView: UIImageView {
    private var cancelBag = Set<AnyCancellable>()
    
    deinit {
        cancelBag.removeAll()
    }
    
    func setImage(url: URL) {
        cancelBag.removeAll()
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.publisher(for: request)
            .catch({ (error: Error) -> AnyPublisher<Result<URLSession.DataTaskPublisher.Output, Error>, Error> in
                switch error {
                case ServiceError.transportError:
                    return Fail(error: error)
                        .delay(for: 3, scheduler: DispatchQueue.main)
                        .eraseToAnyPublisher()
                default:
                    return Just(Result.failure(error))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                }
            })
            .retry(2)
            .tryMap {
                return try $0.get().data
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(_):
                    self.image = UIImage(systemName: "wifi.exclamationmark")
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.image = UIImage(data: data)
            }
            .store(in: &cancelBag)
    }
    
    func cancel() {
        cancelBag.removeAll()
    }
}

