//
//  ViewController.swift
//  the learning app concept
//
//  Created by omar on 5/31/19.
//  Copyright © 2019 omarnader. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {
    
    let backButton = UIButton(type: .system)
    let purpleLayer = CAShapeLayer()
    let loginLabel = UILabel()
    let welcomeLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let forgetPasswordButton = UIButton(type: .system)
    let dontHaveAccountLabel = UILabel()
    let creatAccountButton = UIButton(type: .system)
    
    fileprivate func setupScreenButton() {
        // setting up the back button on the upper left corner of the screen
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
        
        /**********************************************/
        
        loginButton.frame = CGRect(x: 20, y: 510, width: 170, height: 80)
        loginButton.backgroundColor = UIColor.init(red: 94/255, green: 68/255, blue: 143/255, alpha: 1)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(handleLoginButtonTapped(sender:)), for: .touchUpInside)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(loginButton)
        
        /**********************************************/
        
        forgetPasswordButton.frame = CGRect(x: 210, y: 520, width: 130, height: 50)
        forgetPasswordButton.backgroundColor = .clear
        forgetPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgetPasswordButton.addTarget(self, action: #selector(userForgotHisPassword(sender:)), for: .touchUpInside)
        forgetPasswordButton.setTitleColor(.gray, for: .normal)
        
        forgetPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(forgetPasswordButton)
        
        
        
        creatAccountButton.frame = CGRect(x: view.center.x - 50, y: view.frame.height - 70, width: 250, height: 50)
        creatAccountButton.backgroundColor = .clear
        creatAccountButton.setTitle("Create One For Yourself", for: .normal)
        creatAccountButton.addTarget(self, action: #selector(userWantToCreatAccount(sender:)), for: .touchUpInside)
        creatAccountButton.setTitleColor(UIColor.init(red: 94/255, green: 68/255, blue: 143/255, alpha: 1), for: .normal)
        
        creatAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        view.addSubview(creatAccountButton)
        
    }
    
    fileprivate func setupUpperColorLayer() {
        purpleLayer.fillColor = UIColor.init(red: 94 / 255, green: 68/255, blue: 143/255, alpha: 1).cgColor
        
        purpleLayer.path = CGPath(roundedRect: CGRect.init(x: -50, y: -200, width: view.frame.width + 100, height: 400), cornerWidth: 210, cornerHeight: 210, transform: nil)
        
        view.layer.insertSublayer(purpleLayer, at: 0)
    }
    
    fileprivate func setupLabelsInScreen() {
        
        // setting up the login label
        loginLabel.text = "Login"
        loginLabel.textColor = .white
        loginLabel.font = UIFont.boldSystemFont(ofSize: 22)
        loginLabel.frame = CGRect(x: view.center.x - 25 , y: 125, width: 100, height: 50)
        view.addSubview(loginLabel)
        
        
        
        // setting up the welcome label
        
        welcomeLabel.text = "Welcome To                The Learning App"
        welcomeLabel.numberOfLines = 2
        welcomeLabel.textAlignment = .center
        
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        welcomeLabel.textColor = .black
        welcomeLabel.frame = CGRect(x: view.center.x - 110, y: 225, width: 220, height: 100)
        
        view.addSubview(welcomeLabel)
        
        
        /***********************/
        
        dontHaveAccountLabel.text = "don't have an account?"
        dontHaveAccountLabel.frame = CGRect(x: 40, y: view.frame.height - 70, width: 200, height: 50)
        dontHaveAccountLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.addSubview(dontHaveAccountLabel)
        
        
    }
    
    
    fileprivate func  setupTextFields() {
        
        emailTextField.frame = CGRect(x: 20, y: 350, width: view.frame.width - 50, height: 50)
        emailTextField.placeholder = "   email"
        emailTextField.layer.cornerRadius = emailTextField.frame.height / 2
        emailTextField.backgroundColor = .white
        
        passwordTextField.frame = CGRect(x: 20, y: 430, width: view.frame.width - 50, height: 50)
        passwordTextField.placeholder = "    password"
        
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        
        setIconForTextField(#imageLiteral(resourceName: "Email")  , textField: emailTextField)
        setIconForTextField(#imageLiteral(resourceName: "Password"), textField: passwordTextField)
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
        
        setupScreenButton()
        
        setupUpperColorLayer()
        
        setupLabelsInScreen()
        
        setupTextFields()
        
        setupGeustureRecognizer()
    }
    
    
    // function that will handle the backButton should be an Objc function so we add @objc before the function
    
    @objc fileprivate func handleBackButtonTapped(sender : UIButton) {
        UIView.animate(withDuration: 1, animations: {
             self.dismiss(animated: true, completion: nil)
            self.purpleLayer.opacity = 0
        }, completion: nil)
       
    }
    
    @objc fileprivate func handleLoginButtonTapped(sender: UIButton) {
        
    }
    
    @objc fileprivate func userForgotHisPassword(sender : UIButton) {
        print("forgot password ")
    }
    
    @objc fileprivate func userWantToCreatAccount(sender : UIButton) {
        present(SignupController(), animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    
    fileprivate func setupGeustureRecognizer() {
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFirstResponder(sender:)))
        view.addGestureRecognizer(tapGuestureRecognizer)
    }
    
    @objc func handleFirstResponder(sender : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    


}

