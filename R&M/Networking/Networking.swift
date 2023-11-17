//
//  Networking.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation

//MARK: Работа с сетью

enum HTTPMethod: String {
    case POST // стандарт
    case GET // стандарт
}

class Networking {
    static func sendRequest<T: Decodable>(responseType: T.Type, urlString: String, method: HTTPMethod, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let JSONDecoder = JSONDecoder()
                do {
                    let model = try JSONDecoder.decode(responseType, from: data)
                    completion(.success(model))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                completion(.failure(error))
            }
            
            let dictionary = try! JSONSerialization.jsonObject(with: data!) as? [String: Any]
            print(dictionary)
        }
        dataTask.resume()
    }
}
