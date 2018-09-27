//
//  ViewController.swift
//  Todoey
//
//  Created by Admin on 05/07/1940 Saka.
//  Copyright © 1940 Kapil. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Mark - Tableview DataSource Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
           tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
   // Mark - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the add item button on our UIAlert
            self.itemArray.append(textfield.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = " Create new item"
            alertTextfield.textAlignment = .center
            textfield = alertTextfield
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

