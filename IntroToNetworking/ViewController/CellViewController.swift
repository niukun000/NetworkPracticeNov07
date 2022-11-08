//
//  CellViewController.swift
//  IntroToNetworking
//
//  Created by Kun Niu on 11/7/22.
//


import UIKit

class CellViewController: UITableViewCell {
    
    var network = NetworkManager()
//    var uiView =
    lazy var progImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "question-mark")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    lazy var progTopLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemCyan
        label.numberOfLines = 0
        label.text = "Top"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        self.contentView.backgroundColor = .systemGray6
//        self.contentView.heightAnchor.constraint(equalToConstant: 300)
//        self.contentView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10)
//        self.contentView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        
        self.contentView.addSubview(self.progImageView)
        self.contentView.addSubview(self.progTopLabel)
        
        self.progImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.progImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.progImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        self.progImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -28).isActive = true
        
    }
    func configure(){
        
        let frame = self.progImageView.frame
        
        
        self.network.fetchImageData(path: "https://picsum.photos/\(Int(frame.width))/\(Int(frame.height))"){
            data in
            guard let data = data else{return}
            //            print("call from network")
//                        print(self.network.tempID)
//                        self.id = self.network.tempID
//                        self.getID()
            
            DispatchQueue.main.async {
                self.progTopLabel.text = self.network.tempID
                self.progImageView.image = UIImage(data: data)
            }
            
            return 
        }
    }
    
    
    
}
