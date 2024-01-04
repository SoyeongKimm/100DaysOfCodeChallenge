//
//  CategoryViewController.swift
//  AngelaYuTodoey
//
//  Created by Soyeong Kim on 2023/12/12.
//

import UIKit
import RealmSwift
//import SwipeCellKit
//1. import SwipeCellKit
//20. Delete import SwipeCellKit
import ChameleonSwift


//19. Subclass SwipeTableViewController
//class CategoryViewController: UITableViewController {
class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
//10. Increase the size of the cell for image and text
//  Move this code to superClass
        //tableView.rowHeight = 80

//35. Remove the separator
        tableView.separatorStyle = .none
    }
    
    
//50. NavigationBar background color
    override func viewWillAppear(_ animated: Bool) {
     
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist.")
        }
        
        navBar.backgroundColor = UIColor(hexString: "#1D9BF6")
    }
    
    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
//2. Set the delegate property on SwipeTableViewCell
//  Code from the documentation.
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
//
//  Referring to the code above, the existing code should be modified.
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
//        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet."
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//21. get rid of all of the mentions of SwipeCellKit
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet."
        
//22. get rid of all of the mentions of SwipeCellKit
//        cell.delegate = self
  
//23. Create the superclass tableView(cellForRowAt indexPath)
//Head over to the SwipeTableViewController
        
        
//34. Change cell background color using Chameleon
        //cell.backgroundColor = UIColor.randomFlat()

//38. Set the default color
        //cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].color ?? "B6D9E2")
        
//39. Optional binding
//        if let category = categories?[indexPath.row] {
//            cell.textLabel?.text = category.name
//            cell.backgroundColor = UIColor(hexString: category.color)
//        }

//51. Add code to 39
        if let category = categories?[indexPath.row] {
            //cell.textLabel?.text = category.name
            
            guard let categoryColor = UIColor(hexString: category.color) else {fatalError()}
            
            cell.backgroundColor = categoryColor
            cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
        }
        return cell
    }
//9. Downcasting error. Change the cell's class and module.
//  Storyboard > Todoey Scene > Category Cell > Identity Inspector > Custom Class > Class SwipeTableViewCell > Module SwipeCellKit

    
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
        
    }

    
    // MARK: - Model Manipulation Methods
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category, \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
         
        tableView.reloadData()
    }
    
    // MARK: - Delete Data From Swipe
//28. Override the method for deletion
    override func updateModel(at indexPath: IndexPath) {
        
        //super.updateModel(at: indexPath)
        
        if let categoryForDeletion = self.categories?[indexPath.row] {
            
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
//29. Head over to TodoListViewController

    
    // MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { action in
            print("Success!")
            
            let newCategory = Category()
            newCategory.name = textField.text!

//37.
            newCategory.color = UIColor.randomFlat().hexValue()
            
            self.save(category: newCategory)
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

////4. Make a pragma MARK
//// MARK: - Swipe Cell Delegate Methods
//
//
////3. Adopt the SwipeTableViewCellDelegate protocol
////Create an extension to modularize and split up the functionality
//extension CategoryViewController: SwipeTableViewCellDelegate {
//
////5. Add the delegate methods
////  Copy from the documentation(what should happen when a user actually swipes on the cells?)
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
//        guard orientation == .right else { return nil }
//        //Orientation of the swipe is from the right to the left
//
////11. Implement action after swiped and clicked
//// Action: Delete the selected category in the category array
//// Optional binding
//        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
//        //Handle what should happen when the cell gets swiped and clicked
//        //title is the text underneath that Delete image
//        
//            if let categoryForDeletion = self.categories?[indexPath.row] {
//               
//                do {
//                    try self.realm.write {
//                        self.realm.delete(categoryForDeletion)
//                    }
//                } catch {
//                    print("Error deleting category, \(error)")
//                }
//                
//                //tableView.reloadData()
//            }
//        }
//
////8. Match the name with the image name
//        deleteAction.image = UIImage(named: "Delete")
//        //Customize the action appearance
//
////6. Get the image of "delete(trash)" and drag it into my Assets.xcassets folder
////  File path: https://github.com/SwipeCellKit/SwipeCellKit/blob/develop/Example/MailExample/Assets.xcassets/Trash.imageset/Trash%20Icon.png
//
////7. Rename the image with no space in-bewteen the two words if there is any spaces
////  Place the image in 2x position
//        
//        return [deleteAction]
//    }
//    
////12. Expansion style for destructive(Swipe further then deleted)
//    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
//        var options = SwipeOptions()
//        options.expansionStyle = .destructive
//        return options
//    }
//}
//
//
////13. Make the cell in TodoListViewController also swipable
////  Copy and paste the code(X) Create a superClass with the repeated code(O)
////  Controllers > New File > Cocoa Touch Class > Class SwipeTableViewController, Subclass of UITableViewController
////  Move on to SwipeTableViewController
