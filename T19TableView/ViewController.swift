//
//  ViewController.swift
//  T19TableView
//
//  Created by NeonApps on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {
   
    var tableView = UITableView()
    var safeArea : UILayoutGuide!
    let sortButton = UIButton()
    var cellList = ["First VC","Second VC", "Third VC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        setDefaultSize(view: view)
        view.backgroundColor = .white
        createUI()
    }
    
    func createUI() {
        createTableView()
      
    }
    
    func createTableView() {
        view.addSubview(tableView)
        view.addSubview(sortButton)
       
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0.05 * screenHeight, width: 1 * screenWidth, height: 1 * screenHeight)
        
        
        sortButton.frame = CGRect(x: 0.4 * screenWidth, y: 0.4 * screenHeight, width: 0.2 * screenWidth, height: 30)
        sortButton.setTitle("Sort", for: .normal)
        sortButton.setTitleColor(.white, for: .normal)
        sortButton.backgroundColor = .systemPink
        sortButton.addTarget(self, action: #selector(sortClicked), for: .touchUpInside)
        sortButton.layer.cornerRadius = 13
       
        
        
        
        
    }


  

}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let list = cellList[indexPath.row]
        cell.textLabel?.text = list
        return cell
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            cellList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = DetailsViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.titleLbl.text = cellList[indexPath.row]
        present(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        cellList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
        
    
    @objc func sortClicked() {
        if tableView.isEditing {
            tableView.isEditing = false
        }
        else {
            tableView.isEditing = true
        }
    }
    
  
        
   
    
    
    
    
}

