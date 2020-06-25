//
//  weatherFocusViewController.swift
//  hw2
//
//  Created by Jin Cho on 2/12/20.
//  Copyright © 2020 Jin Cho. All rights reserved.
//

import UIKit

class weatherFocusViewController: UIViewController {

    var weatherText:String = ""
    var weatherImage:UIImage?
    
    @IBOutlet weak var weLab: UILabel!
    @IBOutlet weak var weImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weLab.text = weatherText
        weImg.image = weatherImage
        
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
