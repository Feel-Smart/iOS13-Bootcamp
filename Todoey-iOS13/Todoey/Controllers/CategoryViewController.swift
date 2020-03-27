//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Matthew Musgrove on 3/18/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    var categories : Results<Category>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
        guard let bgColor = UIColor(hexString: "1D9BF6") else {fatalError()}
        navBar.backgroundColor = bgColor
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(bgColor, returnFlat: true)]
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let category = categories?[indexPath.row] {
            guard let categoryColor = UIColor(hexString: category.bgColor) else {fatalError()}
            cell.backgroundColor = categoryColor
            cell.textLabel?.text = category.name
            cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
        }
        
        return cell
    }
    
    //MARK: Data Manipulation Methods
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    func loadCategories() {

        categories = realm.objects(Category.self)
        
        tableView.reloadData()
        
    }
    
    //MARK: - Delete Data From Swipe
    
    override func updateModel(at indexPath: IndexPath){
        
        if let category = self.categories?[indexPath.row]{
            do {
                try self.realm.write {
                    self.realm.delete(category)
                }
            } catch {
                print("Error saving context \(error)")
            }

        }
        
    }
    
    //MARK: - Add New Categories
    // use add button pressed to add new categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
                
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
                
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks add item button on our alert
                    
            let newCategory = Category()
            newCategory.name = textField.text!
            
            let bgColor = UIColor(randomFlatColorOf:.light)
            
            newCategory.bgColor = bgColor.hexValue()
                    
            self.save(category: newCategory)

        }
                
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
                
        alert.addAction(action)
            
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        } else {
            
        }
    }
    
    
}
