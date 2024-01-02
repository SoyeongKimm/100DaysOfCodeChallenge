//
//  TodoListViewController.swift
//  AngelaYuTodoey
//
//  Created by Soyeong Kim on 2023/12/05.
//

import UIKit
import RealmSwift
import ChameleonSwift
//41. Import statement

//29. <Subclass SwipeTableViewController>
//class TodoListViewController: UITableViewController {
class TodoListViewController: SwipeTableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
//45. Modify the properties of searchBar > Make IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(dataFilePath)
        
//        loadItems()
        
//33. <Expand cell hight>
// Add the code here or in superClass
        //tableView.rowHeight = 80
        
//41.
        tableView.separatorStyle = .none
        
//43.
        //navigationController?.navigationBar.barTintColor = UIColor(hexString: selectedCategory.color)
        
//        if let colorHex = selectedCategory?.color {
//            navigationController?.navigationBar.barTintColor = UIColor(hexString: colorHex)
//        }
    }

//44. Move the code to viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        title = selectedCategory!.name
        
        if let colorHex = selectedCategory?.color {
            guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
            
            //navBar.barTintColor = UIColor(hexString: colorHex)
            
//47.
            //navBar.tintColor = ContrastColorOf(UIColor(hexString: colorHex), returnFlat: true)
            
//46.
            //searchBar.barTintColor = UIColor(hexString: colorHex)
            
            
//48. Optional binding
            if let navBarColor = UIColor(hexString: colorHex) {
                navBar.barTintColor = navBarColor
                navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
                navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(navBarColor, returnFlat: true)]
                searchBar.barTintColor = navBarColor
            }
            
//49. Change the barButtonItem tint color to default (Storyboard)
//50. Go to CategoryViewController
        }
    }
    
    // MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
//30.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            
//40.
            //cell.backgroundColor = FlatSkyBlue().darken(byPercentage: CGFloat(indexPath.row / todoItems?.count))
//            if let color = FlatSkyBlue().darken(byPercentage: CGFloat(indexPath.row) / CGFloat(todoItems!.count)) {
//                cell.backgroundColor = color
//                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
//            }
            
//41. Match the color with the category
            if let color = UIColor(hexString: selectedCategory!.color)?.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(todoItems!.count)) {
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
            
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Items Added"
        }
        
        return cell
    }
    
//31.
// Storyboard > Item scene > cell > Identity inspector > Class SwipeTableViewCell, Module SwipeCellKit
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
//                    realm.delete(item)
                    item.done = !item.done
                }
            } catch {
                print("Error saving done status, \(error)")
            }
        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving new items")
                }
            }
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Model Manupulation Methods
    
    func loadItems() {

        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
//32.
    override func updateModel(at indexPath: IndexPath) {
       
        if let itemForDeletion = self.todoItems?[indexPath.row] {
            
            do {
                try self.realm.write {
                    self.realm.delete(itemForDeletion)
                }
            } catch {
                print("Error deleting item, \(error)")
            }
        }
    }
    
}

// MARK: - SearchBar Delegate Methods

extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
//        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        }
    }
}


//42. Prefers Large Titles
// Storyboard > Navigation Controller Scene > Navigation Bar > Attributes inspector > Prefers Large Titles checked



