//
//  NetworkManager.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 15/02/22.
//

import Foundation

class NetworkManager {
    static func getDataFromApi(completion: @escaping (Result<FoodMenu, Error>) -> Void) {
        let url = URL(string: "http://54.149.84.126/api/user/categories?shop=1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("X-Requested-With", forHTTPHeaderField: "Content-type")
        request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FoodMenu.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
