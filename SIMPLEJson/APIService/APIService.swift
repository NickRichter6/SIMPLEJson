//
//  APIService.swift
//  SIMPLEJson
//
//  Created by Nick Ivanov on 19.07.2020.
//  Copyright © 2020 Nick Ivanov. All rights reserved.
//

import Foundation

class APIManager {
    
    func getData(completition: @escaping (Models?, Error?) -> ()) {
        guard let url = URL(string: "https://pryaniky.com/static/json/sample.json") else { return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data  else { return }
            print(data)
            
            do {
                let json = try JSONDecoder().decode(Models.self, from: data)
                print(json)
                completition(json,nil)
                } catch {
                print(error)
            }
        }.resume()
    }
}
