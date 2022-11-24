//
//  ProfileMainViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/11/23.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileMainViewController: UIViewController {
    
    @IBOutlet weak var lbEmail: UILabel!
    
    @IBOutlet weak var lbNickname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetting()
        // Do any additional setup after loading the view.
    }
    
    func UISetting(){
        lbEmail.text = Auth.auth().currentUser?.email
        lbNickname.text = Auth.auth().currentUser?.displayName
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
