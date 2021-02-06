//
//  DetailViewController.swift
//  JsonParsing
//
//  Created by Mobile Apps Team on 2/6/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fullText: UILabel!
    
    var fullTextValue : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullText.text = fullTextValue

        // Do any additional setup after loading the view.
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
