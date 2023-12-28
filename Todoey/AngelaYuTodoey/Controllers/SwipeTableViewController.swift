//
//  SwipeTableViewController.swift
//  AngelaYuTodoey
//
//  Created by Hyeonho So on 2023/12/28.
//

import UIKit
import SwipeCellKit
//14. Import the third party library

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
//15. Adopt the protocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Data Source Methods

//24. Create dataSource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//25. Change the cell idetntifier to "Cell"(Storyboard)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
               cell.delegate = self
         
               return cell
    }
    
    // MARK: - Delegate Methods

//16. Cut and paste the code from CategoryViewController
    
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
            guard orientation == .right else { return nil }

            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
                print("Delete Cell")
                
//27.
                self.updateModel(at: indexPath)
                
//17. Comment out the code specified a certain ViewController
//                if let categoryForDeletion = self.categories?[indexPath.row] {
//
//                    do {
//                        try self.realm.write {
//                            self.realm.delete(categoryForDeletion)
//                        }
//                    } catch {
//                        print("Error deleting category, \(error)")
//                    }
//
//                    //tableView.reloadData()
//                }
            }

            deleteAction.image = UIImage(named: "Delete")
            
            return [deleteAction]
        }
        
        func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
            var options = SwipeOptions()
            options.expansionStyle = .destructive
            return options
        }
    
//26.
    func updateModel(at indexPath: IndexPath) {
        
    }
}

//18. Make CategoryViewController inherit from SwipeTableViewController
//Head back to CategoryViewController
