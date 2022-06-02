//
//  UserDetailTableViewCell.swift
//  myfoodlist
//
//  Created by Matheus Armando on 01/06/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"

    //elements

    lazy var comidaLabel:UILabel = {
        let nl = UILabel()
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.textColor = .white
        return nl
    }()
    
    lazy var notaLabel:UILabel = {
        let nl = UILabel()
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.textColor = .white
        return nl
    }()
    
    

    
    // addAllElements
    func allElements(){
        contentView.addSubview(comidaLabel)
        contentView.addSubview(notaLabel)
    }
    
    public func setUpCell(data:DataUser){
        self.comidaLabel.text = data.comida
        self.notaLabel.text = data.nota
    }

    //constraints
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            comidaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            comidaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            comidaLabel.heightAnchor.constraint(equalToConstant: 90),
            comidaLabel.widthAnchor.constraint(equalToConstant: 90),
            
            notaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            notaLabel.leadingAnchor.constraint(equalTo: comidaLabel.trailingAnchor, constant: 150),
        
        ])
    }
    
    
    
    //initialazers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        allElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
