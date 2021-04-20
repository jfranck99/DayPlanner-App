//
//  FirstViewController.swift
//  DayPlanner
//
//  Created by Jonathan Franck on 11/23/19


import UIKit

//Creates a global array that stores the task shown in the To Do List view and is able to be editied on the New Tasks view
var To_Do = ["Web Programming Homework", "Do Laundry ", "Workout", "Study Calc III", "Make Dinner"]


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var Tasks_table: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return (To_Do.count)
    }
    
    //Creates a table of tasks from the To_Do array
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let task = tableView.dequeueReusableCell(withIdentifier: "task")
        task?.textLabel?.text = To_Do[indexPath.row]
        
        return(task!)
    }
    
    
    //Allows reordering of cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = To_Do[sourceIndexPath.row]
        To_Do.remove(at: sourceIndexPath.row)
        To_Do.insert(item, at: destinationIndexPath.row)
    }
    
    //Enables or disables editing when button is clicked
    @IBAction func Edit(_ sender: Any) {
        Tasks_table.isEditing = !Tasks_table.isEditing
        
        switch Tasks_table.isEditing {
        case true:
            editButton.title = "Done"
        case false:
            editButton.title = "Edit"
            
        }
    }
    
    
    //Allow the user to delete entries by swiping left
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            To_Do.remove(at: indexPath.row)
            Tasks_table.reloadData()
        }
    }

    //Everytime user adds new entry, reload the Task View
    override func viewDidAppear(_ animated: Bool) {
        
        Tasks_table.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

