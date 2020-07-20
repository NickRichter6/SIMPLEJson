//
//  MainViewPresenter.swift
//  SIMPLEJson
//
//  Created by Nick Ivanov on 19.07.2020.
//  Copyright © 2020 Nick Ivanov. All rights reserved.
//

import Foundation

protocol MainPresenterProtocolInput {
    func reloadData()
}

protocol ConfigureMainViewProtocolOutput: class {
    init(view: MainPresenterProtocolInput)
    func getDetail(for row: Int) -> Data?
    func loadData()
    var models: Models? { get }
}

class ConfigureMainView: ConfigureMainViewProtocolOutput {
    
    private let apiManager = APIManager()

    let view: MainPresenterProtocolInput
    var models: Models?{
        didSet {
            view.reloadData()
        }
    }
    
    required init(view: MainPresenterProtocolInput) {
        self.view = view
    }
    
    func loadData() {
        apiManager.getData { [weak self] (models, error) in
            guard let models = models else {return}
            self?.models = models
        }
    }
    
    func getDetail(for row: Int) -> Data?  {
        if let name = models?.view[row], let dates = models?.data {
            for i in dates {
                if name == i.name {
                    return i.data
                }
            }
        }
        return nil
    }
}
