//
//  CellViewController.swift
//  IntroToNetworking
//
//  Created by Kun Niu on 11/7/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    let network = NetworkManager()
    
    var id : String?
    lazy var stockImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        
        return imageView
        
    }()
    lazy var stockLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "default"
        
        return label
        
    }()
    
    lazy var stockButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.stockButtonPressed(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 20
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        // Do any additional setup after loading the view.
    }

    func createUI(){
        
        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(self.stockImageView)
        self.view.addSubview(self.stockLabel)
        self.view.addSubview(self.stockButton)
        
        self.stockImageView.backgroundColor = .systemBlue
        self.stockImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.stockImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.stockImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -8).isActive = true
        
        self.stockLabel.backgroundColor = .systemGray5
//        self.stockLabel.topAnchor.constraint(equalTo: self.stockImageView.bottomAnchor, constant: 8).isActive = true
        self.stockLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.stockButton.backgroundColor = .systemCyan
        self.stockButton.topAnchor.constraint(equalTo: self.stockLabel.bottomAnchor, constant: 8).isActive = true
        self.stockButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.stockButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    
    func getID(){
        self.stockLabel.text = self.id
    }
    @objc func stockButtonPressed(_ sender: UIButton){
        print("button Pressed")
        let frame = self.stockImageView.frame
        
        
        self.network.fetchImageData(path: "https://picsum.photos/\(Int(frame.width))/\(Int(frame.height))"){
            data in
            guard let data = data else{return}
//            print("call from network")
//            print(self.network.tempID)
//            self.id = self.network.tempID
//            self.getID()
  
            DispatchQueue.main.async {
                self.stockLabel.text = self.network.tempID
                self.stockImageView.image = UIImage(data: data)
            }
        }
    }
}

