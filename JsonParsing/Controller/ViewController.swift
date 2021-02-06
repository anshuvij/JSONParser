//
//  ViewController.swift
//  JsonParsing
//
//  Created by Mobile Apps Team on 2/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    var jSONManager = JSONManager()
    var jSONData = [JSONData]()
    var vSpinner : UIView?
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
    }
    
    func setupUI() {
        
        tableView.register(UINib(nibName: "JSONViewCell", bundle: nil), forCellReuseIdentifier: "JSONViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        jSONManager.delegate = self
        
        self.showSpinner(onView: self.view)
        jSONManager.getData()
        
        
    }


}

extension ViewController : UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return jSONData.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
        }
    
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JSONViewCell", for: indexPath) as? JSONViewCell
        
        cell?.name.text = jSONData[indexPath.section].name
        cell?.email.text = jSONData[indexPath.section].email
        cell?.body.text = jSONData[indexPath.section].body
        
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.borderWidth = 1
        cell?.layer.cornerRadius = 8
        cell?.clipsToBounds = true
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nav = DetailViewController()
        nav.fullTextValue = jSONData[indexPath.section].body
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    
}

extension ViewController : JSONManagerDelegate {
    
    func getList(_ Manager: JSONManager, Data: [JSONData]) {
        
        jSONData = Data
        
        DispatchQueue.main.async {
            self.removeSpinner()
            self.tableView.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
        
    }
    
    
}

extension ViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        self.vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}




