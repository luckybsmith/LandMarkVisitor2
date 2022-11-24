//
//  DetailViewController.swift
//  LandMarkVisitor
//
//  Created by Leesongeun on 2022/10/23.
//

import UIKit
import SwiftSoup
import CoreData
enum LikeLevel : Int64{
    case level1
    case level2
    case level3
    case level4
    case level5
}
extension LikeLevel{
    var color : UIColor{
        switch self {
        case .level1:
            return .systemBlue
        case .level2:
            return .systemGreen
        case .level3:
            return .systemYellow
        case .level4:
            return .systemOrange
        case .level5:
            return .systemRed
        }
    }
    var text : String{
        switch self{
        case .level1:
            return "😍"
        case .level2:
            return "😊"
        case .level3:
            return "😳"
        case .level4:
            return "😔"
        case .level5:
            return "🤬"
        }
    }
}
protocol DetailViewControllerDelegate : AnyObject {
    func clickDelete()
    func didFinishSaveData()
}

class DetailViewController: UIViewController,UIScrollViewDelegate {
    
    var isChecked = false
    var likelevel = LikeLevel.init(rawValue: 0)
    @IBOutlet weak var level1: UIButton!
    @IBOutlet weak var level2: UIButton!
    @IBOutlet weak var level3: UIButton!
    @IBOutlet weak var level4: UIButton!
    @IBOutlet weak var level5: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    @IBOutlet weak var lbPhoneNumber: UILabel!
    
    @IBOutlet weak var TFMemo: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    var images = [UIImage]()
    var imageViews = [UIImageView]()
    var urlAddress : String = ""
    var areatype : String = ""
    var cityType : String = ""
    var saveBtnImg = UIImage()
    var saveBtnMode : String = "save"
    var selectedTodoList : PlaceList?
    var keyHeight: CGFloat?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    weak var delegate : DetailViewControllerDelegate?
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crawling(urlAddress: urlAddress)
        setting()
        makeBtnDelete()
        addDoneButtonOnKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList{
            TFMemo.text = hasData.memo
            likelevel = LikeLevel(rawValue: hasData.level)
            
            print(likelevel?.text,likelevel?.color)
            setBtn()
            //            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            
            //            btnSave.setTitle("update", for: .normal)
        }
    }
    
    
    func setBtn(){
        if let hasData = selectedTodoList{
            likelevel = LikeLevel(rawValue: hasData.level)
            switch likelevel{
            case .level1 :
                level1.backgroundColor = .systemBlue
            case .level2 :
                level2.backgroundColor = .systemGreen
            case .level3 :
                level3.backgroundColor = .systemYellow
            case .level4 :
                level4.backgroundColor = .systemOrange
            case .level5 :
                level5.backgroundColor = .systemRed
            case .none:
                level1.backgroundColor = .systemBlue
            }
            
        }
    }
    @IBAction func clickLevel(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            print("1")
            likelevel = .level1
        case 2:
            print("2")
            likelevel = .level2
        case 3:
            print("3")
            likelevel = .level3
        case 4:
            print("4")
            likelevel = .level4
        case 5:
            print("5")
            likelevel = .level5
        default :
            break
        }
        makePriorityBtn()
        
    }
    func makePriorityBtn(){
        
        
        level1.backgroundColor = .clear
        level2.backgroundColor = .clear
        level3.backgroundColor = .clear
        level4.backgroundColor = .clear
        level5.backgroundColor = .clear
        
        switch self.likelevel{
        case .level1:
            level1.backgroundColor = likelevel?.color
        case .level2:
            level2.backgroundColor = likelevel?.color
        case .level3:
            level3.backgroundColor = likelevel?.color
        case .level4:
            level4.backgroundColor = likelevel?.color
        case .level5:
            level5.backgroundColor = likelevel?.color
        default:
            break
        }
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title:  NSLocalizedString("done", comment: ""), style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        TFMemo.inputAccessoryView = doneToolbar
        TFMemo.resignFirstResponder()
        
        
    }
    
    @objc func doneButtonAction(){
        TFMemo.resignFirstResponder()
    }
    
    func setting(){
        addContentScrollView()
        setPageControl()
        scrollView.delegate = self
        scrollView.contentMode = .scaleAspectFill
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func crawling(urlAddress : String){
        let url = URL(string: urlAddress)
        var array = Array<Data>()
        do {
            let html = try String(contentsOf: url!, encoding : .utf8)
            let doc : Document = try SwiftSoup.parse(html)
            
            let title : Elements = try doc.select(".Fc1rA")
            let location : Elements = try doc.select(".IH7VW")
            let contents : Elements = try doc.select(".DJJvD")
            let phoneNumber : Elements = try doc.select(".dry01")
            let imagesrc = try doc.select(".BkqXt").select(".K0PDV")
            
            for i in title {
                self.lbTitle.text = try i.text()
                print("title: ", try i.text())
            }
            for i in location{
                self.lbLocation.text = try i.text()
                print("location: ", try i.text())
                
            }
            for i in contents{
                self.lbContents.text = try i.text()
                print("contents: ", try i.text())
            }
            for i in phoneNumber{
                self.lbPhoneNumber.text = try i.text()
                print("phoneNumber: ", try i.text())
                
                
                
                for i in imagesrc {
                    let stringImage = try i.attr("style").description
                    //get string
                    let stringItem = String(stringImage.split(separator: "\"")[1])
                    //get url
                    let urlImage = URL(string: stringItem)
                    //get data
                    let data = try Data(contentsOf: urlImage!)
                    //get image
                    
                    self.images.append(UIImage(data: data)!)
                    array.append(data)
                    print(array.count)
                }
            }
            
        } catch let error {
            print(error)
        }
        
    }
    
    private func addContentScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = scrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            imageView.contentMode = .scaleAspectFill
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
            scrollView.contentSize.height = imageView.frame.height
        }
        
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    @IBAction func btnSave(_ sender: UIButton) {
        if saveBtnMode == "save"{
            saveData()
            makeAlert(stringMode: "저장되었습니다")
        }
        else{
            deleteData()
            print("delete")
        }
    }
    func makeBtnDelete(){
        if saveBtnMode == "delete"{
            btnSave.setTitle("DELETE", for: .normal)
            //            btnSave.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            print(btnSave.titleLabel?.font!)
        }
    }
    func saveData(){
        print(areatype)
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "PlaceList", in: context) else {return}
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? PlaceList else {return}
        //what is context
        
        object.url = urlAddress
        object.title = lbTitle.text
        object.uuid = UUID()
        object.cityType = cityType
        object.areaType = areatype
        object.businessType = lbContents.text
        object.memo = TFMemo.text
        object.level = likelevel?.rawValue ?? LikeLevel.level1.rawValue
        
        
        //priority
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        print(object.areaType)
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(){
        guard let hasData = selectedTodoList else{
            return
        }
        print(hasData)
        guard let hasUUID = hasData.uuid else{
            return
        }
        
        print(hasUUID)
        let fetchRequest: NSFetchRequest <PlaceList> = PlaceList.fetchRequest()
        
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
        
        delegate?.clickDelete()
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
    func makeAlert(stringMode : String){
        let alert = UIAlertController(title: stringMode, message: "", preferredStyle: .alert)
        let close = UIAlertAction(title: "닫기", style: .default) { (action) in}
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @objc func keyboardWillShow(_ sender: Notification) {
        let userInfo:NSDictionary = sender.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        keyHeight = keyboardHeight
        
        self.view.frame.size.height -= keyboardHeight
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        
        self.view.frame.size.height += keyHeight!
    }
}
