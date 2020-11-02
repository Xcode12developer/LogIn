//
//  ViewController.swift
//  Log In
//
//

import UIKit

class ViewController: UIViewController {

  let usernames = ["username1", "username2", "username3",]
  let passwords = ["password1", "password2", "password3",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.frame = CGRect(x: 80, y: 250, width: 300, height: 40)
        passwordField.frame = CGRect(x: 80, y: 300, width: 300, height: 40)
        loginButton.frame = CGRect(x: 80, y: 350, width: 300, height: 50)
        usernameField.delegate = self
        passwordField.delegate = self
        loginButton.addTarget(self, action: #selector(Login), for: .touchUpInside)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)

        
    }

    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    @objc func Login() {
        passwordField.resignFirstResponder()
        
        if (usernameField.text!.count) < 6 || (passwordField.text!.count) < 6 {
            
            let alert = UIAlertController(title: "Whoops",
                                          message: "Please enter all information to log in.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Dismiss",
                                          style: .cancel, handler: nil))
            present(alert, animated: true)
        }
            
        else if usernameField.text == usernames[0] && passwordField.text == passwords[0] {
            print("success")
        }
        else if usernameField.text == usernames[1] && passwordField.text == passwords[1] {
            print("success")
        }
        else if usernameField.text == usernames[2] && passwordField.text == passwords[2] {
            print("success")
        }
        else {
            let alert = UIAlertController(title: "Incorrect!",
                                          message: "Incorrect Username or Password! Please Try Again.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Dismiss",
                                          style: .cancel, handler: nil))
            present(alert, animated: true)
        }
        }

}
    
    
    
    
    


extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == usernameField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            Login()
        }

        return true
    }
}

