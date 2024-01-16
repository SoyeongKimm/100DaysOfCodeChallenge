//
//  WordTableViewController.swift
//  MyWordBookStoryboard
//
//  Created by Hyeonho So on 2024/01/16.
//

import UIKit

class WordTableViewController: UITableViewController {
    
    var wordArray = ["one", "two", "three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        cell.textLabel?.text = wordArray[indexPath.row]
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(wordArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Word", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default) { action in
            print("Cancel!")
        }
        let success = UIAlertAction(title: "Add word", style: .default) { action in
            print("Success!")
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "New Word"
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Meaning"
        }
            
            alert.addAction(cancel)
            alert.addAction(success)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    

