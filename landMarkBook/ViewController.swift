//
//  ViewController.swift
//  landMarkBook
//
//  Created by MERT on 14.07.2021.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate, UITableViewDataSource, UITableViewDelegate{
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenlandmarkName = ""
    var chosenlandmarImages = UIImage()
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //landmark book data
        
        landmarkNames.append("Collesium")
        landmarkNames.append("Dolmabahce")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        
        
        landmarkImages.append(UIImage(named: "collesium.jpg")!)
        landmarkImages.append(UIImage(named: "dolmabahce.jpg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        
        navigationItem.title = "Landmark Book"
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         chosenlandmarkName = landmarkNames[indexPath.row]
         chosenlandmarImages = landmarkImages[indexPath.row]
        
        
        performSegue(withIdentifier: "toimageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toimageViewController"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedlandmarkName = chosenlandmarkName
            destinationVC.selectedlandmarkImage = chosenlandmarImages
    }


}

}
