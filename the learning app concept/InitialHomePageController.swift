//
//  InitialHomePageController.swift
//  the learning app concept
//
//  Created by omar on 5/31/19.
//  Copyright © 2019 omarnader. All rights reserved.
//

import UIKit

class InitialHomePageController: UIViewController {

    let purpleLayer = CAShapeLayer()
    
    let welcomeLabel = UILabel()
    let theLearningAppLabel = UILabel()
    let loginButton = UIButton(type: .system)
    let signupButton = UIButton(type: .system)
    
    fileprivate func setupUpperColorLayer() {
        purpleLayer.fillColor = UIColor.init(red: 94 / 255, green: 68/255, blue: 143/255, alpha: 1).cgColor
        
        purpleLayer.path = CGPath(roundedRect: CGRect.init(x: -50, y: -200, width: view.frame.width + 100, height: 400), cornerWidth: 210, cornerHeight: 210, transform: nil)
        
        view.layer.insertSublayer(purpleLayer, at: 0)
    }
    
    fileprivate func setupWelcomeLabels() {
        
        // setting up the welcome label
        welcomeLabel.text = "Welcome To"
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 22)
        welcomeLabel.frame = CGRect(x: view.center.x - 60 , y: 150, width: 125, height: 50)
        view.addSubview(welcomeLabel)
        
        theLearningAppLabel.text = "The Learning App"
        theLearningAppLabel.textColor = .black
        theLearningAppLabel.font = UIFont.boldSystemFont(ofSize: 25)
        theLearningAppLabel.frame = CGRect(x: view.center.x - 100 , y: 190, width: 250, height: 50)
        view.addSubview(theLearningAppLabel)
        
    }
    
    fileprivate func setupLoginButton(){
        loginButton.frame = CGRect(x: 20, y: 350, width: view.frame.width - 40, height: 80)
        loginButton.backgroundColor = UIColor.init(red: 94/255, green: 68/255, blue: 143/255, alpha: 1)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(handleLoginButtonTapped(sender:)), for: .touchUpInside)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(loginButton)
        
        signupButton.frame = CGRect(x: 20, y: 450, width: view.frame.width - 40, height: 80)
        signupButton.backgroundColor = UIColor.init(red: 94/255, green: 68/255, blue: 143/255, alpha: 1)
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.addTarget(self, action: #selector(handleSignupButtonTapped(sender:)), for: .touchUpInside)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.layer.cornerRadius = signupButton.frame.height / 2
        signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(signupButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
        
        setupUpperColorLayer()
        
        setupWelcomeLabels()
        
        setupLoginButton()
        
    }
    
    fileprivate func setupTransitionAnimation(sender : UIButton) {
       sender.setTitle("", for: .normal)
        view.bringSubviewToFront(sender)
        UIView.animate(withDuration: 0.5, animations: {
            sender.transform = CGAffineTransform(scaleX: 50, y: 50)
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                
                if sender == self.loginButton {
                     self.present(LoginScreenController(), animated: true , completion: nil)
                }
                else if sender == self.signupButton {
                     self.present(SignupController(), animated: true , completion: nil)
                }
               
                sender.transform = .identity
                
            }, completion: { (true) in
                
                if sender == self.loginButton {
                    sender.setTitle("Login", for: .normal)
                }
                else if sender == self.signupButton {
                    sender.setTitle("Sign Up", for: .normal)
                }
                
                
            })
        }
        
    }
    
    @objc fileprivate func handleLoginButtonTapped(sender : UIButton){
        setupTransitionAnimation(sender: loginButton)
       
        
        
    }
    
    @objc fileprivate func handleSignupButtonTapped(sender : UIButton){
        setupTransitionAnimation(sender: signupButton)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }
    override func viewWillAppear(_ animated: Bool) {
       
        
    }

}
