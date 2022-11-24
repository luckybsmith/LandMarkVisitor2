//
//  ShowPlaceViewController.swift
//  LandMarkVisitor
//
//  Created by Leesongeun on 2022/10/18.
//

import UIKit
import CoreData
import MessageUI
protocol  ShowPlaceViewControllerDelegate : AnyObject {
     func clickDelete()
}

class ShowPlaceViewController: UIViewController {

    weak var delegate : UploadViewControllerDelegate?

    weak var delegate2 : ShowPlaceViewControllerDelegate?
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbLevel: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    var priority = PriorityLevel.init(rawValue: 5)
    var selectedTodoList : TodoList?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var todolist = [TodoList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbLevel.backgroundColor = .clear
    }
    
    func setLevel(level : Int64) -> String{
        switch level{
        case 0:
            return "😍"
        case 1:
            return "😊"
        case 2:
            return "😳"
        case 3:
            return "😔"
        case 4:
            return "🤬"
        default:
            return ""
        }
        
    }
    
    func setColor(level : Int64) -> UIColor{
        switch level{
        case 0:
            return .systemBlue
        case 1:
            return .systemGreen
        case 2:
            return .systemYellow
        case 3:
            return .systemOrange
        case 4:
            return .systemRed
        default:
            return .black
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList{
            lbTitle.text = hasData.title
            lbLocation.text = hasData.location
            lbDescription.text = hasData.detail

            lbLevel.text = setLevel(level: hasData.priorityLevel)
            //lbLevel.backgroundColor = setColor(level: hasData.priorityLevel)
     
        }
        if let hasDate = selectedTodoList?.date{
                    let formatter = DateFormatter()
                    
                    formatter.dateFormat = "YYYY-MM-dd"
                    let dataString = formatter.string(from: hasDate)
            lbDate.text = dataString
                    
                    
        }
        if let hasImage =
            selectedTodoList?.image{
            imageview.image = UIImage(data: hasImage)
        }
    }

    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        deleteTodo()
    }
    
    func deleteTodo(){
        
        guard let hasData = selectedTodoList else{
            return
        }
        
        guard let hasUUID = hasData.uuid else{
            return
        }
        
        let fetchRequest: NSFetchRequest <TodoList> = TodoList.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do{
            let loadedData = try context.fetch(fetchRequest)
            
            if let loadFirstData = loadedData.first{
                context.delete(hasData)
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
                appDelegate.saveContext()
            }
        }catch{
            print(error)
        }
        
        delegate?.didFinishSaveData()
        delegate2?.clickDelete()
        self.dismiss(animated: true)
    }
    
    @IBAction func sendMail(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
                let composeViewController = MFMailComposeViewController()
                composeViewController.mailComposeDelegate = self
                
            let bodyString = "Title : " + (lbTitle.text ?? "") + "\n" + "Location : " + (lbLocation.text ?? "") + "\n" + "Description : " + (lbDescription.text ?? "none")
                
            let mailTitle : String = "[장소제안]" + "[LandMarkVisitor ver." + Version.getVersion() + "]"
            composeViewController.setToRecipients(["vs1707@naver.com"])
            composeViewController.setSubject(mailTitle)
            composeViewController.setMessageBody(bodyString, isHTML: false)
            
                self.present(composeViewController, animated: true, completion: nil)
         
            
            } else {
                let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "메일을 보내려면 'Mail' 앱이 필요합니다. App Store에서 해당 앱을 복원하거나 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
                let goAppStoreAction = UIAlertAction(title: "App Store로 이동하기", style: .default) { _ in
                    // 앱스토어로 이동하기(Mail)
                    if let url = URL(string: "https://apps.apple.com/kr/app/mail/id1108187098"), UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                }
                let cancleAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
                
                sendMailErrorAlert.addAction(goAppStoreAction)
                sendMailErrorAlert.addAction(cancleAction)
                self.present(sendMailErrorAlert, animated: true, completion: nil)
                
                
                
                
            }
    }
}

extension ShowPlaceViewController : MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}
class Version {

    /**
     # version
     - Note: 현재 번들 버전 반환
     */
    static func getVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
}

