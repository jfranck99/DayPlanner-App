//
//  SecondViewController.swift
//  DayPlanner
//
//  Created by Jonathan Franck on 11/23/19.


import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var entry: UITextField!
    
    //Sends user's input into the global To_Do array (declared in FirstViewController.swift)
    @IBAction func addEntry(_ sender: Any) {
        
        if (entry.text != ""){
            
        
            To_Do.append(entry.text!)
            entry.text = ""
        }
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

