//
//  ViewController.swift
//  Todoey
//
//  Created by vijayvallabhaneni on 4/7/18.
//  Copyright © 2018 FCG. All rights reserved.
//

import UIKit

class TodolistViewController: UITableViewController {

    var itemArray = ["Workout" , "Breakfast" , "coffee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        
        tableView.deselectRow(at: indexPath, animated: true)
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        //tableView.cellForRow(at: indexPath)?.
            
    }
    
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        //MARK - what should happen when addbuttonpressed
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        // what happens when user clicks additem
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}
