//
//  WeatherViewController.swift
//  homework2
//
//  Created by Connie Wu on 2/8/20.
//  Copyright © 2020 Connie Wu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherText:String = ""
    var weatherImage: UIImage?
    var weatherHeader:String = ""
    var weatherData:String = ""
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherPicture: UIImageView!
    @IBOutlet weak var weatherHead: UILabel!
    @IBOutlet weak var weatherDescript: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        weatherHead.text = weatherHeader
        weatherLabel.text = weatherText
        weatherPicture.image = weatherImage
        weatherDescript.text = weatherData
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
