//
//  SavedViewController.swift
//  LandMarkVisitor
//
//  Created by Leesongeun on 2022/10/30.
//

import UIKit
import CoreData

protocol  SavedViewControllerDelegate : AnyObject {
     func clickDelete()
}

class SavedCell : UITableViewCell{
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCity: UILabel!
    @IBOutlet weak var lbArea: UILabel!
    @IBOutlet weak var lbType: UILabel!
    
}
class SavedViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var placelist = [PlaceList]()
    
    @IBOutlet weak var indi: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableview.reloadData()
        tableview.rowHeight = UITableView.automaticDimension
        indi.isHidden = true
        self.view.bringSubviewToFront(indi)

        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "PlaceList")
        fetch.sortDescriptors = [NSSortDescriptor(key: "cityType", ascending: true)]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        tableview.reloadData()
    }

    func fetchData(){
        
        let fetchrequest : NSFetchRequest<PlaceList> = PlaceList.fetchRequest()
        //데이터 가져오기
        let context = appdelegate.persistentContainer.viewContext
        do {
            self.placelist = try context.fetch(fetchrequest)
        }catch{
            print(error)
        }
    }
}

extension SavedViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row != nil {
                return 100
            }
            return UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath) as! SavedCell
    
        cell.lbTitle.text = placelist[indexPath.row].title
        cell.lbCity.text = placelist[indexPath.row].cityType
        cell.lbArea.text = placelist[indexPath.row].areaType
        cell.lbType.text = placelist[indexPath.row].businessType
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //didSelectRowAt - 눌렀을 때
        indi.isHidden = false
        indi.startAnimating()
        placelist[indexPath.row]
        
        let showVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        showVC.selectedTodoList = placelist[indexPath.row]
        showVC.modalPresentationStyle = .fullScreen
        showVC.urlAddress = placelist[indexPath.row].url!
        showVC.saveBtnMode = "delete"
        self.present(showVC,animated: true){
            self.indi.stopAnimating()
        }
        print(showVC.areatype)
        
    }
    
}



extension SavedViewController : DetailViewControllerDelegate {
    func clickDelete() {
        self.fetchData()
        self.tableview.reloadData()
        
    }
    func didFinishSaveData() {
        self.fetchData()
        self.tableview.reloadData()
    }
    
    
}
