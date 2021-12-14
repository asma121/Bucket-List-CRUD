//
//  ViewController.swift
//  Bucket List CRUD
//
//  Created by admin on 14/12/2021.
//

import UIKit

class ViewController:UITableViewController , CancelSaveDelegate {
  
    
    var bucketList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketCell", for: indexPath)
        cell.textLabel?.text = bucketList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        bucketList.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSegue" {
         let navgationController = segue.destination as! UINavigationController
         let destination = navgationController.topViewController as! SecondTableViewController
         destination.delegate = self
        } else if segue.identifier == "EditSegue"{
            let navgationController = segue.destination as! UINavigationController
            let destination = navgationController.topViewController as! SecondTableViewController
            destination.delegate = self
            
            let indexpath = sender as! NSIndexPath
            let item = bucketList[indexpath.row]
            destination.item = item
            destination.indexPath = indexpath
        }
    }
    
    func cancelButtonPressed(viewcontroller: SecondTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonPressed(viewcontroller: SecondTableViewController , text:String , indexpath:NSIndexPath?) {
        if let ip = indexpath {
            bucketList[ip.row] = text
        }else{
            bucketList.append(text)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

