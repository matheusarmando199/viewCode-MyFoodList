//
//  ViewController.swift
//  myfoodlist
//
//  Created by Matheus Armando on 30/05/22.
//

import UIKit

class FoodList: UIViewController {
    
    // dados
    var data:[DataUser] = [
        DataUser(comida: "Comida", nota: "Nota"),
        DataUser(comida: "feijão", nota: "2"),
        DataUser(comida: "estrogonof", nota: "10")
       ]
    
    
    // elementos
    lazy var myFoodListLabel: UILabel = {
        let mfll = UILabel()
        mfll.translatesAutoresizingMaskIntoConstraints = false
        mfll.text = "MyFoodList"
        mfll.textColor = .black
        mfll.font = UIFont.boldSystemFont(ofSize: 24)
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
    
    lazy var foodTableView: UITableView = {
        let ftb = UITableView()
        ftb.translatesAutoresizingMaskIntoConstraints = false
        ftb.backgroundColor = .white
        ftb.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        return ftb
    }()
    
    
    // funcionalidades
    func setUpAllElements(){
        view.addSubview(myFoodListLabel)
        view.addSubview(addButton)
        view.addSubview(foodTableView)
    }
    
    func setUpBackGroundColor(){
        view.backgroundColor = .systemGreen
    }
    
    func setUpTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        foodTableView.delegate = delegate
        foodTableView.dataSource = dataSource
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
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
            foodTableView.topAnchor.constraint(equalTo: myFoodListLabel.bottomAnchor, constant: 20),
            foodTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            foodTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            foodTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
    
    // ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackGroundColor()
        setUpAllElements()
        setUpConstraints()
        setUpTableViewProtocols(delegate: self, dataSource: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

 // delegates protocolos e extensões

extension FoodList: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
           
           cell?.setUpCell(data: self.data[indexPath.row])
           return cell ?? UITableViewCell()
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120
      }
}





