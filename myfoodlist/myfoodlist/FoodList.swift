//
//  ViewController.swift
//  myfoodlist
//
//  Created by Matheus Armando on 30/05/22.
//

import UIKit

class FoodList: UIViewController {

    // elementos
    lazy var myFoodListLabel: UILabel = {
        let mfll = UILabel()
        mfll.translatesAutoresizingMaskIntoConstraints = false
        mfll.text = "MyFoodList"
        mfll.textColor = .black
        mfll.font = UIFont.systemFont(ofSize: 18)
        mfll.textAlignment = .center
        return mfll
    }()
    
    lazy var addButton:UIButton = {
        let abt = UIButton()
        abt.translatesAutoresizingMaskIntoConstraints = false
        abt.setTitle("+", for: .normal)
        abt.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        abt.setTitleColor(.white, for: .normal)
        abt.clipsToBounds = true
        abt.layer.cornerRadius = 7.5
        abt.backgroundColor = .black
        abt.addTarget(self, action: #selector(addFunc), for: .touchUpInside)
        return abt
    }()
    
    
    
    
    // funcionalidades
    func setUpAllElements(){
        view.addSubview(myFoodListLabel)
        view.addSubview(addButton)
    }
    
    func setUpBackGroundColor(){
        view.backgroundColor = .systemGreen
    }
    
    @objc func addFunc(){
        let avc:FoodAdd = FoodAdd()
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
    
    // constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            myFoodListLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            myFoodListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            myFoodListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            addButton.leadingAnchor.constraint(equalTo: myFoodListLabel.trailingAnchor, constant: 2),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        
        ])
    }
    
    
    // ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackGroundColor()
        setUpAllElements()
        setUpConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

