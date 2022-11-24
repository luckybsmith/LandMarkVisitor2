//
//  UpLoadViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/10/17.
//

import UIKit
import CoreData

protocol UploadViewControllerDelegate : AnyObject{
    func didFinishSaveData()
}

class UploadViewController: UIViewController, UINavigationControllerDelegate {
    
    weak var delegate : UploadViewControllerDelegate?
    
    @IBOutlet weak var btnLevel1: UIButton!
    @IBOutlet weak var btnLevel2: UIButton!
    @IBOutlet weak var btnLevel3: UIButton!
    @IBOutlet weak var btnLevel4: UIButton!
    @IBOutlet weak var btnLevel5: UIButton!
    
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var detailTF: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var arrPhotos: [TodoList]?
    
    var priority = PriorityLevel.init(rawValue: 5)
    var selectedTodoList : TodoList?

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList{
            titleTF.text = hasData.title
            locationTF.text = hasData.location
            detailTF.text = hasData.detail
            
            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            
            btnSave.setTitle("update", for: .normal)
        }else{
            btnSave.setTitle("save", for: .normal)
        }
        
        
    }
    @IBAction func LevelClick(_ sender: UIButton) {
        
            switch sender.tag{
            case 1:
                print("1")
                priority = .level1
            case 2:
                print("2")
                priority = .level2
            case 3:
                print("3")
                priority = .level3
            case 4:
                print("4")
                priority = .level4
            case 5:
                print("5")
                priority = .level5
            default :
                break
            }
            makePriorityBtn()
    }
        
        func makePriorityBtn(){
            
            
            btnLevel1.backgroundColor = .clear
            btnLevel2.backgroundColor = .clear
            btnLevel3.backgroundColor = .clear
            btnLevel4.backgroundColor = .clear
            btnLevel5.backgroundColor = .clear
            
            switch self.priority{
            case .level1:
                btnLevel1.backgroundColor = priority?.color
            case .level2:
                btnLevel2.backgroundColor = priority?.color
            case .level3:
                btnLevel3.backgroundColor = priority?.color
            case .level4:
                btnLevel4.backgroundColor = priority?.color
            case .level5:
                btnLevel5.backgroundColor = priority?.color
            default:
                break
            }
        }
        @IBAction func btnSave(_ sender: Any) {
            if titleTF.text == ""{
                let alert = UIAlertController(title: "Title을 입력해주세요", message: "", preferredStyle: .alert)
                           let close = UIAlertAction(title: "닫기", style: .default) { (action) in
                           //action구현
                           }
                           alert.addAction(close)
                           present(alert, animated: true, completion: nil)
            }else{
            if selectedTodoList != nil{
                updateTodo()
            }else{
                saveTodo()
            }
            
            delegate?.didFinishSaveData()
            self.dismiss(animated: true)
            }
            
        }
       
    
    @IBAction func addImage(_ sender: UIButton) {
        btnAddImage.setTitle(" ", for: .normal)
        self.openImagePicker()
    }
    
    func saveTodo(){
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else {return}
            
            guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else {return}
            //what is context
            
            object.title = titleTF.text
            object.location = locationTF.text
            object.detail = detailTF.text
            object.date = Date()
            object.uuid = UUID()
            
            object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        object.image = imageView.image?.pngData()
            
            //priority
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.saveContext()
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
           
            
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        func updateTodo(){
            
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
                loadedData.first?.title = titleTF.text
                loadedData.first?.location = locationTF.text
                loadedData.first?.detail = detailTF.text
                loadedData.first?.date = Date()
                loadedData.first?.priorityLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
                
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
                appDelegate.saveContext()
                
            }catch{
                print(error)
            }
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
            self.dismiss(animated: true)
            
        }
        
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title:  NSLocalizedString("done", comment: ""), style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

        titleTF.inputAccessoryView = doneToolbar
        locationTF.inputAccessoryView = doneToolbar
        detailTF.inputAccessoryView = doneToolbar

    }

    @objc func doneButtonAction(){
        titleTF.resignFirstResponder()
        locationTF.resignFirstResponder()
        detailTF.resignFirstResponder()
        
    }
}
extension UploadViewController: UIImagePickerControllerDelegate {
    func openImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true, completion: nil)
        if let img = info[.originalImage] as? UIImage {
            self.imageView.image = img
        }
    }
}
