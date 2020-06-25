//
//  myCustomTableViewController.swift
//  hw2
//
//  Created by Jin Cho on 2/12/20.
//  Copyright © 2020 Jin Cho. All rights reserved.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherLab: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class myCustomTableViewController: UITableViewController {
    
    var weather = ["Durham, 78, cloudy", "Chapel Hill, 78, sunny", "Carrboro, 77, sunny", "Morrisville, 80, cloudy", "Raleigh, 82, rain", "Cary, 81, rain", "Lexington, 77, rain"]
    var weatherImages = [UIImage(named: "cloud"), UIImage(named: "sun"), UIImage(named: "sun"), UIImage(named: "cloud"), UIImage(named: "rain"), UIImage(named: "rain"), UIImage(named: "rain")]

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
           return("Weather")
           
       }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weather.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! myCustomTableViewCell

        // Configure the cell...
        cell.weatherLab.text = weather[indexPath.row]
        cell.weatherImg.image = weatherImages[indexPath.row]

        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // and cast it to the correct class type (i.e. focusAnimalViewController)
        
        let destVC = segue.destination as! weatherFocusViewController
        
        // Pass the selected object to the new view controller.
        let myRow = tableView!.indexPathForSelectedRow
        let myCurrCell = tableView!.cellForRow(at: myRow!) as! myCustomTableViewCell
        
        // set the destVC variables from the selected row
        destVC.weatherText = (myCurrCell.weatherLab!.text)!
        destVC.weatherImage = (myCurrCell.weatherImg!.image)!
        
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

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
