//
//  DetailViewPresenter.swift
//  SIMPLEJson
//
//  Created by Nick Ivanov on 19.07.2020.
//  Copyright © 2020 Nick Ivanov. All rights reserved.
//

import UIKit

protocol DetailPresenterProtocolInput {
}

protocol ConfigureDetailViewProtocolOutput: class {
    init(view: DetailPresenterProtocolInput, data: Data?)
    var data: Data? { get }
    func getImage(completion: @escaping (UIImage?) -> Void)
}

class ConfigureDetailView: ConfigureDetailViewProtocolOutput {

    let view: DetailPresenterProtocolInput
    let data: Data?
    
    required init(view: DetailPresenterProtocolInput, data: Data?) {
        self.view = view
        self.data = data
     }
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        if let urlString = data?.url, let url = URL(string: urlString) {
            let request = URLSession.shared
            request.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                let image = UIImage(data: data)
                completion(image)
            }.resume()
        }
    }
}
