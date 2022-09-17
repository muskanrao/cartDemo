//
//  RegisterViewController.swift
//  cartDemo
//
//  Created by Muskan on 16/09/22.
//

import UIKit
import AuthenticationServices
import FirebaseAuth
import GoogleSignIn
import Firebase
import FacebookLogin


class RegisterViewController: UIViewController{
 
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        let signupButton = FBLoginButton()
        signupButton.center = view.center
        signupButton.permissions = ["public_profile", "email"]
        view.addSubview(signupButton)
        if let token = AccessToken.current,
               !token.isExpired {
               performSegue(withIdentifier: "register", sender: self)
        }
     
        
    }


    
    @IBAction func RegisterPressed(_ sender: UIButton) {
        
        if let email = emailText.text , let password = passwordText.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    var alert = UIAlertController()
                    var action  = UIAlertAction()
                    alert = .init(title: "Error", message: "Error while registering the user.", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("OK pressed.")
                    })
                }else{
                    self.performSegue(withIdentifier: "register", sender: self)
                }
            }
        }
    }
    
    
    @IBAction func GooglePressed(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            let config = GIDConfiguration(clientID: clientID)

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
             
                self.performSegue(withIdentifier: "register", sender: self)
        
            }
            
          }
    
    @IBAction func faceBook(_ sender: UIButton) {
       
    }
    @IBAction func appleIdPressed(_ sender: ASAuthorizationAppleIDButton) {
    
    }
    
}
