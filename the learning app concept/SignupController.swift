//
//  SignupController.swift
//  the learning app concept
//
//  Created by omar on 5/31/19.
//  Copyright © 2019 omarnader. All rights reserved.
//

import UIKit

class SignupController: UIViewController {
    
    let backButton = UIButton(type: .system)
    let purpleLayer = CAShapeLayer()
    let registerLabel = UILabel()
    let alreadyAMemberLabel = UILabel()
    let loginButton = UIButton(type: .system)
    let registerButton = UIButton(type: .system)
    
    let requiredInformation = ["Full Name" , "Email" , "Phone Number" , "Password" ]
    fileprivate func setupScreenLabels() {
        registerLabel.text = "Register"
        registerLabel.textColor = .white
        registerLabel.font = UIFont.boldSystemFont(ofSize: 22)
        registerLabel.frame = CGRect(x: view.center.x - 40 , y: 135, width: 100, height: 50)
        view.addSubview(registerLabel)
        
        alreadyAMemberLabel.text = "Already a Member?"
        alreadyAMemberLabel.frame = CGRect(x: view.center.x - 80, y: view.frame.height - 70, width: 200, height: 50)
        alreadyAMemberLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.addSubview(alreadyAMemberLabel)
        
        
    }
    
    fileprivate func setupTextFields(){
        requiredInformation.forEach { (textFieldName) in
            let textField = UITextField()
            textField.placeholder = "  \(textFieldName)"
            textField.frame.size = CGSize(width: view.frame.width - 50, height: 50)
            textField.layer.cornerRadius = textField.frame.height / 2
            
            textField.frame.origin = CGPoint(x: 20, y: 250 + (80 * requiredInformation.firstIndex(of: textFieldName)!))
            textField.backgroundColor = .white
            setIconForTextField(UIImage(named: textFieldName)!, textField: textField)
            view.addSubview(textField)
            
        }
    }
    
    fileprivate func setIconForTextField(_ image : UIImage , textField: UITextField) {
        let icon = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        icon.image = image
        icon.tintColor = .black
        
        let iconContainer = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainer.addSubview(icon)
        
        textField.leftView = iconContainer
        textField.leftViewMode = .always
    }
    
    
    fileprivate func setupScreenButtons () {
        backButton.frame.size = CGSize(width: 50, height: 50)
        //        i don't have the image so we will just let the button show the word back
        //        backButton.setBackgroundImage(UIImage.init(named: "backArrow"), for: .normal)
        backButton.setTitle("<--", for: .normal)
        backButton.backgroundColor = .clear
        backButton.addTarget(self, action: #selector(handleBackButtonTapped(sender:)), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backButton.setTitleColor(.white, for: .normal)
        backButton.frame.origin = CGPoint(x: 10, y: 30)
        view.addSubview(backButton)
        
        
        loginButton.frame = CGRect(x: view.center.x - 70, y: view.frame.height - 70, width: 250, height: 50)
        loginButton.backgroundColor = .clear
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(goToLoginPage(sender:)), for: .touchUpInside)
        loginButton.setTitleColor(UIColor.init(red: 94/255, green: 68/255, blue: 143/255, alpha: 1), for: .normal)
        
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        view.addSubview(loginButton)
        
        
        
        registerButton.frame = CGRect(x: 20, y: 570, width: 170, height: 80)
        registerButton.backgroundColor = UIColor.init(red: 94/255, green: 68/255, blue: 143/255, alpha: 1)
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(handleRegisteration(sender:)), for: .touchUpInside)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(registerButton)
        
    
    }
    
    fileprivate func setupUpperColorLayer() {
        purpleLayer.fillColor = UIColor.init(red: 94 / 255, green: 68/255, blue: 143/255, alpha: 1).cgColor
        
        purpleLayer.path = CGPath(roundedRect: CGRect.init(x: -50, y: -200, width: view.frame.width + 100, height: 400), cornerWidth: 210, cornerHeight: 210, transform: nil)
        
        view.layer.insertSublayer(purpleLayer, at: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
        
        setupUpperColorLayer()
        
        setupScreenButtons()
        
        setupGeustureRecognizer()
        
        setupScreenLabels()
        
        setupTextFields()
    }
    
    @objc fileprivate func handleBackButtonTapped(sender : UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.dismiss(animated: true, completion: nil)
            self.purpleLayer.opacity = 0
        }, completion: nil)
        
    }
    
    
    fileprivate func setupGeustureRecognizer() {
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFirstResponder(sender:)))
        view.addGestureRecognizer(tapGuestureRecognizer)
    }
    
    @objc func handleFirstResponder(sender : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @objc fileprivate func goToLoginPage(sender: UIButton){
        print("wants to login")
    }
    @objc fileprivate func handleRegisteration(sender : UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.dismiss(animated: true, completion: nil)
            self.purpleLayer.opacity = 0
        }, completion: nil)
    }
    
   
}
