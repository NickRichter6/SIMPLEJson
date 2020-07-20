//
//  DetailViewController.swift
//  SIMPLEJson
//
//  Created by Nick Ivanov on 19.07.2020.
//  Copyright © 2020 Nick Ivanov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailPresenterProtocolInput {
    
    var presenter: ConfigureDetailViewProtocolOutput!
    
    let textLabel: UILabel = {
        let textL = UILabel()
        textL.textAlignment = .center
        textL.translatesAutoresizingMaskIntoConstraints = false
        return textL
    }()
    
    let nameLabel: UILabel = {
        let nameL = UILabel()
        nameL.textAlignment = .center
        nameL.translatesAutoresizingMaskIntoConstraints = false
        return nameL
    }()
    
    let selectedIdLabel: UILabel = {
        let idL = UILabel()
        idL.textAlignment = .center
        idL.translatesAutoresizingMaskIntoConstraints = false
        return idL
    }()
    
    let idLabel: UILabel = {
        let idL = UILabel()
        idL.textAlignment = .center
        idL.numberOfLines = 0
        idL.translatesAutoresizingMaskIntoConstraints = false
        return idL
    }()
    
    let variantsTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 200).isActive = true
        img.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getImage { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        view.backgroundColor = .white
        
        view.addSubview(textLabel)
        textLabel.text = presenter.data?.text
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140).isActive = true
        
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        
        if let selectedId = presenter.data?.selectedId {
            view.addSubview(selectedIdLabel)
            selectedIdLabel.text = "\(selectedId)"
            selectedIdLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20).isActive = true
            selectedIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140).isActive = true
        }
        
        if let variants = presenter.data?.variants {
            var id: String = ""
            var text: String = ""
            view.addSubview(idLabel)
            idLabel.topAnchor.constraint(equalTo: selectedIdLabel.bottomAnchor, constant: 20).isActive = true
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140).isActive = true
            view.addSubview(variantsTextLabel)
            variantsTextLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20).isActive = true
            variantsTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140).isActive = true
            for i in variants {
                id += "\(i.id)\n"
                text += "\(String(describing: i.text))\n"
            }
            idLabel.text = id
            variantsTextLabel.text = text
        }
    }
}
