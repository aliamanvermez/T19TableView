//
//  DetailsViewController.swift
//  T19TableView
//
//  Created by NeonApps on 14.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    let titleLbl = UILabel()
    let previousButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       createUI()
    }
    
    func createUI(){
        view.backgroundColor = .red
        titleLbl.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        titleLbl.textColor = .white
        titleLbl.center = view.center
        titleLbl.textAlignment = .center
    
        
        previousButton.frame = CGRect(x: 0.3 * screenWidth, y: 0.6 * screenHeight, width: 0.4 * screenWidth, height: 50)
        previousButton.setTitle("Back", for: .normal)
        previousButton.backgroundColor = .white
        previousButton.setTitleColor(.systemPink, for: .normal)
        previousButton.layer.cornerRadius = 13
        previousButton.addTarget(self, action: #selector(previousbtnClicked), for: .touchUpInside)
        
        view.addSubview(previousButton)
        view.addSubview(titleLbl)
    }
    
    @objc func previousbtnClicked() {
        let destinationVC = ViewController()
        present(destinationVC, animated: true)
        destinationVC.modalPresentationStyle = .fullScreen
  
    }
}
