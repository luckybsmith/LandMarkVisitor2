//
//  MyPageViewController.swift
//  LandMarkVisitor
//
//  Created by Leesongeun on 2022/10/15.
//

import UIKit
import CoreData

enum PriorityLevel : Int64{
    case level1
    case level2
    case level3
    case level4
    case level5
    case level0
}
extension PriorityLevel{
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
        case .level0:
            return .black
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
        case .level0:
            return ""
        }
    }
}


class MyPageCell : UITableViewCell {
    
    @IBOutlet weak var lbLevel: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lbDate: UILabel!
    
}
class MyPageViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var todolist = [TodoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavi()

        fetchData()
        tableview.reloadData()
        tableview.rowHeight = UITableView.automaticDimension

    }
    
    
    func fetchData(){
        
        let fetchrequest : NSFetchRequest<TodoList> = TodoList.fetchRequest()
        //데이터 가져오기
        let context = appdelegate.persistentContainer.viewContext
        
        
        do {
            self.todolist = try context.fetch(fetchrequest)
            
        }catch{
            print(error)
        }
    }
    @objc func addNewTodo(){
        print("add")
        let detailVC = UploadViewController.init(nibName: "UploadViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true)
        
    }

    
    func makeNavi(){
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        navigationItem.rightBarButtonItem = item
    }
}


extension MyPageViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row != nil {
                return 100
            }

            return UITableView.automaticDimension
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todolist.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath) as! MyPageCell
    
        cell.lblName.text = todolist[indexPath.row].title
        
        if let hasDate = todolist[indexPath.row].date{
            let formatter = DateFormatter()
            
            formatter.dateFormat = "YYYY-MM-dd"
            let dataString = formatter.string(from: hasDate)
            
            cell.lbDate.text = dataString
            
        }
        else{
            cell.lbDate.text = ""
        }
   
        let priority = todolist[indexPath.row].priorityLevel
        let priorityColor = PriorityLevel(rawValue: priority)?.color
        let priorityText = PriorityLevel(rawValue: priority)?.text
        //cell.lbLevel.backgroundColor = priorityColor
        cell.lbLevel.text = priorityText
        cell.lbLevel.layer.cornerRadius = cell.lbLevel.bounds.height/2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //didSelectRowAt - 눌렀을 때
        todolist[indexPath.row]
        
        let showVC = ShowPlaceViewController(nibName: "ShowPlaceViewController", bundle: nil)
        showVC.selectedTodoList = todolist[indexPath.row]
        showVC.modalPresentationStyle = .fullScreen
        showVC.delegate2 = self
        self.present(showVC,animated: true)
        
    }
    
}


extension MyPageViewController : UploadViewControllerDelegate {
    func didFinishSaveData() {
        self.fetchData()
        self.tableview.reloadData()
    }
    
    
}

extension MyPageViewController : ShowPlaceViewControllerDelegate {
    func clickDelete() {
        self.fetchData()
        self.tableview.reloadData()
    }
    
    
}
