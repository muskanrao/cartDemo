//
//  LoginViewController.swift
//  cartDemo
//
//  Created by Muskan on 17/09/22.
//

import UIKit
import FirebaseAuth
import FacebookCore
import FacebookLogin
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!


        override func viewDidLoad() {
            super.viewDidLoad()
        
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
            if let token = AccessToken.current,
                   !token.isExpired {
                   performSegue(withIdentifier: "login", sender: self)
            }
        }
    


    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = emailText.text ,  let password =  passwordText.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error
                in
                if error != nil{
                    var alert = UIAlertController()
                    var action = UIAlertAction()
                    alert = .init(title: "LogIn Error", message: "Error while logging In.", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Error accured while logging in the user.")
                    })
                    alert.addAction(action)
                    self!.present(alert, animated: true, completion: nil)
                    
                }else{
                    self!.performSegue(withIdentifier: "login", sender: self)
                    
                }
            
            }
        }
    }
    

    @IBAction func googleLoginPressed(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            let config = GIDConfiguration(clientID: clientID)

            GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

              if let error = error {
              
                return
              }
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
          
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                var alert = UIAlertController()
                var action = UIAlertAction()
                alert = .init(title: "LogIn Error", message: "Error while logging In.", preferredStyle: .alert)
                action = .init(title: "OK", style: .default, handler: { (action) in
                    print("Error accured while logging in the user.")
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
              } else {
       
                return
              }
              // ...
              return
            }
            performSegue(withIdentifier: "login", sender: self)
        }
        
    }
    }

    

        
    
       
    
    
  
    


}
