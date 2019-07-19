//
//  NamesTableViewController.swift
//  FinalAssessment
//
//  Created by Leah Cluff on 7/19/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {
    
    var groupedNames: [[Names]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
    }

    // MARK: - Table view data source

    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Name", message: "Add someone new to the list", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Add a name..."
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let textField = alertController.textFields?.first else { print("There was an error in \(#function)"); return }
            guard let name = textField.text else { print("There was an error in \(#function)"); return }
            NamesController.sharedInstance.create()
            self.updateViews()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        updateViews()
    }
    
    @IBAction func rouletteButtonTapped(_ sender: Any) {
        
    }
    
    func updateViews() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groupedNames.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupedNames[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
 
   // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
