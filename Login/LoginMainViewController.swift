//
//  LoginMainViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/11/23.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func googleLogin(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] googleUser, error in
            if let error = error {
                print(error)
                return
            }
            guard let authentication = googleUser?.authentication, let idToken = authentication.idToken else {return}
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().fetchSignInMethods(forEmail: (googleUser?.profile?.email)!){(User ,error)in
                if User == nil{
                    Auth.auth().signIn(with: credential){authresult,error in
                        print(authresult)
                        self.performSegue(withIdentifier: "toMain", sender: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func emailLogin(_ sender: Any) {
    }
    
}
