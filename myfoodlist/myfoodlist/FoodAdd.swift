//
//  FoodAdd.swift
//  myfoodlist
//
//  Created by Matheus Armando on 30/05/22.
//

import UIKit

class FoodAdd: UIViewController {

    //elementos
    lazy var myFoodListLabel: UILabel = {
        let mfll = UILabel()
        mfll.translatesAutoresizingMaskIntoConstraints = false
        mfll.text = "MyFoodList"
        mfll.textColor = .white
        mfll.font = UIFont.boldSystemFont(ofSize: 24)
        mfll.textAlignment = .center
        return mfll
    }()
    
    lazy var foodDescription: UILabel = {
        let fdc = UILabel()
        fdc.translatesAutoresizingMaskIntoConstraints = false
        fdc.text = " Digite a baixo o nome da comida que quer adicionar a lista."
        fdc.textColor = .white
        fdc.numberOfLines = 2
        fdc.font = UIFont.systemFont(ofSize: 15)
        return fdc
    }()
    
    lazy var foodTextField: UITextField = {
        let ftf = UITextField()
        ftf.translatesAutoresizingMaskIntoConstraints = false
        ftf.textColor = .black
        ftf.backgroundColor = .white
        ftf.autocorrectionType = .no
        ftf.keyboardType = .alphabet
        ftf.placeholder = "Nome da comida."
        return ftf
    }()
    
    lazy var foodNoteLabel:UILabel = {
        let fnl = UILabel()
        fnl.translatesAutoresizingMaskIntoConstraints = false
        fnl.text = " Digite abaixo uma nota de 0 até 10 para a comida digitada a cima"
        fnl.textColor = .white
        fnl.numberOfLines = 2
        fnl.font = UIFont.systemFont(ofSize: 15)
        return fnl
    }()
    
    lazy var foodNoteTextFild: UITextField = {
        let fntf = UITextField()
        fntf.translatesAutoresizingMaskIntoConstraints = false
        fntf.textColor = .black
        fntf.backgroundColor = .white
        fntf.keyboardType = .numberPad
        fntf.placeholder = "apenas numeros de 0 até 10"
        return fntf
    }()
    
    
    lazy var adicionarButton:UIButton = {
        let abt = UIButton()
        abt.translatesAutoresizingMaskIntoConstraints = false
        abt.setTitle("Adicionar", for: .normal)
        abt.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        abt.setTitleColor(.white, for: .normal)
        abt.clipsToBounds = true
        abt.layer.cornerRadius = 7.5
        abt.backgroundColor = .systemGreen
        abt.addTarget(self, action: #selector(adicionarfunc), for: .touchUpInside)
        return abt
    }()
    
    lazy var cancelarButton:UIButton = {
        let abt = UIButton()
        abt.translatesAutoresizingMaskIntoConstraints = false
        abt.setTitle("Cancelar", for: .normal)
        abt.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        abt.setTitleColor(.white, for: .normal)
        abt.clipsToBounds = true
        abt.layer.cornerRadius = 7.5
        abt.backgroundColor = .systemRed
        abt.addTarget(self, action: #selector(cancelarfunc), for: .touchUpInside)
        return abt
    }()
    
    lazy var backButton: UIButton = {
        let bb = UIButton()
        bb.translatesAutoresizingMaskIntoConstraints = false
        bb.setTitle("<", for: .normal)
        bb.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        bb.setTitleColor(.black, for: .normal)
        bb.clipsToBounds = true
        bb.layer.cornerRadius = 7.5
        bb.backgroundColor = .white
        bb.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return bb
    }()
    
    
    //funcionalidades
    func setUpAllElements(){
        view.addSubview(myFoodListLabel)
        view.addSubview(foodDescription)
        view.addSubview(foodTextField)
        
        view.addSubview(foodNoteLabel)
        view.addSubview(foodNoteTextFild)
 
        view.addSubview(adicionarButton)
        view.addSubview(cancelarButton)
        view.addSubview(backButton)
    }
    
    func setUpBackGoundColor() {
       view.backgroundColor = .black
    }
    
    
    public func setUpTextFildDelegate(retorno:UITextFieldDelegate){
        foodTextField.delegate = retorno
        foodNoteTextFild.delegate = retorno
    }
    
    @objc func adicionarfunc(){
        validaTextFildRage(vf: true)
        validaTextFieldsVazios(vf: true)
        
        let nomeComida: String = foodTextField.text ?? ""
        let nota: String = foodNoteTextFild.text ?? ""
        
        
        let newdata:[DataUser] = [DataUser(comida: nomeComida, nota: nota)]

        
        let lfa:FoodList = FoodList()
        self.navigationController?.pushViewController(lfa, animated: true)
        lfa.data += newdata
        
        
        
        
    }
    
    @objc func cancelarfunc(){
        let campoVazio: String = ""
        foodTextField.text = campoVazio
        foodNoteTextFild.text = campoVazio
    }
    
    @objc func backButtonAction(){
        let lfa:FoodList = FoodList()
        self.navigationController?.pushViewController(lfa, animated: true)
    }
    
    func validaTextFildRage(vf: Bool){
        let nota: String = foodNoteTextFild.text ?? ""
       
        let notaInt = Int(nota)
        
        guard let notaInt = notaInt else {return}
        
        if ((notaInt <= 10) && (notaInt >= 0)) {
    
        }else{
            let alert: UIAlertController = UIAlertController(title: "Atenção", message: "\(notaInt) não está dentro do range que deve ser de 0 a 10", preferredStyle: .alert)
            let tentarNovamenteAlert: UIAlertAction = UIAlertAction(title: "Tentar novamente", style: .cancel)
            alert.addAction(tentarNovamenteAlert)
            present(alert, animated: true, completion: nil)
            
            foodNoteLabel.textColor = .red
            foodNoteLabel.text = "Digite abaixo uma nota de 0 até 10 para a comida digitada a cima!!!"
        }
        
    }
    
    func validaTextFieldsVazios(vf: Bool){
        let food: String = foodTextField.text ?? ""
        let nota: String = foodNoteTextFild.text ?? ""
        
        if food.isEmpty || nota.isEmpty {
            let alert: UIAlertController = UIAlertController(title: "Atenção", message: "um dos campos estão vazios, revise as informações", preferredStyle: .alert)
            let revisarDados: UIAlertAction = UIAlertAction(title: "Revisar dados", style: .cancel)
            alert.addAction(revisarDados)
            present(alert, animated: true, completion: nil)
        }else{
            
        }
        
    }
    
    //constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            myFoodListLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            myFoodListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            myFoodListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            myFoodListLabel.heightAnchor.constraint(equalToConstant: 40),
            

            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            backButton.trailingAnchor.constraint(equalTo: myFoodListLabel.leadingAnchor, constant: -10),
            
            
            foodDescription.topAnchor.constraint(equalTo: myFoodListLabel.bottomAnchor, constant: 80),
            foodDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            foodDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            foodTextField.topAnchor.constraint(equalTo: foodDescription.bottomAnchor, constant: 10),
            foodTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            foodTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            foodTextField.heightAnchor.constraint(equalToConstant: 35),
            
        
            foodNoteLabel.topAnchor.constraint(equalTo: foodTextField.bottomAnchor, constant: 10),
            foodNoteLabel.leadingAnchor.constraint(equalTo: foodDescription.leadingAnchor),
            foodNoteLabel.trailingAnchor.constraint(equalTo: foodDescription.trailingAnchor),
            
            foodNoteTextFild.topAnchor.constraint(equalTo: foodNoteLabel.bottomAnchor, constant: 10),
            foodNoteTextFild.leadingAnchor.constraint(equalTo: foodTextField.leadingAnchor),
            foodNoteTextFild.trailingAnchor.constraint(equalTo: foodTextField.trailingAnchor),
            foodNoteTextFild.heightAnchor.constraint(equalTo: foodTextField.heightAnchor),
            
            
            adicionarButton.topAnchor.constraint(equalTo: foodNoteTextFild.bottomAnchor, constant: 50),
            adicionarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            adicionarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            adicionarButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelarButton.topAnchor.constraint(equalTo: adicionarButton.bottomAnchor, constant: 10),
            cancelarButton.leadingAnchor.constraint(equalTo: adicionarButton.leadingAnchor),
            cancelarButton.trailingAnchor.constraint(equalTo: adicionarButton.trailingAnchor),
            cancelarButton.heightAnchor.constraint(equalTo: adicionarButton.heightAnchor)
            
        ])
    }
    
    
    //ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackGoundColor()
        setUpAllElements()
        setUpConstraints()
        setUpTextFildDelegate(retorno: self)
    }
}


extension FoodAdd: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        foodTextField.resignFirstResponder()
        foodNoteTextFild.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
