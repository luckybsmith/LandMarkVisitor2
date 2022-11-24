//
//  ViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/07/12.
//

import UIKit
import Firebase
import FirebaseAuth

class FirstViewController : UIViewController {
    
    
    @IBOutlet weak var lbNickname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
    }
    
    func setting(){
        var str : String = "Hi, " + (Auth.auth().currentUser?.displayName ?? "")
        lbNickname.text = str
    }
    //크롤링해서 데이터 저장시킴
}


