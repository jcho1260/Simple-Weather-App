//
//  WeatherTableViewController.swift
//  homework2
//
//  Created by Connie Wu on 2/8/20.
//  Copyright © 2020 Connie Wu. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    var weatherLocation = ["Durham", "Chapel Hill", "Carrboro", "Morrisville", "Raleigh", "Cary", "Charlotte"]

    var weatherData = ["78°F", "78°F", "77°F", "80°F", "82°F", "81°F", "90°F"]
           
    var weatherDescription =  ["Cloudy", "Sunny", "Sunny", "Cloudy", "Rain", "Rain", "Sunny"]
    
    var images = [UIImage(named:"cloudy"), UIImage(named:"sunny"), UIImage(named:"sunny"), UIImage(named:"cloudy"), UIImage(named:"rainy"), UIImage(named:"rainy"), UIImage(named:"sunny")]
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func startEditing(_ sender: Any) {
        isEditing = !isEditing
        if (isEditing) {
            editButton.title = "Done"
        }
        else {
            editButton.title = "Edit"
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            weatherLocation.remove(at: indexPath.row)
            weatherData.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            weatherDescription.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //Give the Section a header with some text
        return("North Carolina Weather")
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell

        // Configure the cell...
        cell.weatherHeader.text = weatherLocation[indexPath.row]
        cell.weatherLabel.text = weatherData[indexPath.row]
        cell.weatherImage.image = images[indexPath.row]
        cell.weatherDescript.text = weatherDescription[indexPath.row]
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destination as! WeatherViewController
        
        // Pass the selected object to the new view controller.
        let myRow = tableView!.indexPathForSelectedRow
        let myCurrCell = tableView!.cellForRow(at: myRow!) as! WeatherTableViewCell
        
        // set the destVC String variable to the text from the selected row
        destVC.weatherHeader = (myCurrCell.weatherHeader.text)!
        destVC.weatherText = (myCurrCell.weatherLabel.text)!
        destVC.weatherImage = (myCurrCell.weatherImage.image)!
        destVC.weatherData = (myCurrCell.weatherDescript.text)!
        
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let locationToMove = weatherLocation[sourceIndexPath.row]
        weatherLocation.remove(at: sourceIndexPath.row)
        weatherLocation.insert(locationToMove, at: destinationIndexPath.row)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

}
