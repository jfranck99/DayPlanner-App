//
//  ReminderViewController.swift
//  DayPlanner
//
//  Created by Jonathan Franck on 11/26/19.


import UIKit
import AVFoundation

class ReminderViewController: UIViewController {
    
    
    @IBOutlet weak var lbl_Min: UILabel!
    @IBOutlet weak var lbl_Sec: UILabel!
    
    var secs = 0
    var mins = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    //Set the label and minute counter equal to the value of the slider
    @IBAction func minSlider(_ sender: UISlider) {
        mins = Int(sender.value)
        lbl_Min.text = String(mins) + " mins"
        
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    
    //Action triggered by user pressing the Start button
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ReminderViewController.counter), userInfo: nil, repeats: true)
        
        //Hides slider and disables Start button while counting down
        sliderOutlet.isHidden = true
        startOutlet.isEnabled = false
        
    }
    
    //Controls the countdown of the timer
    func counter(){
        //If the time runs out
        if(mins==0) && (secs == 0){
            
            timer.invalidate()
            
            //Plays the alarm audio
            audioPlayer.play()
            
        }
        //Count down by second
        else if(secs > 0){
            secs -= 1
            lbl_Sec.text = String(secs) + " secs"
        }
        //Decrease the minute counter by 1 and reset seconds to 59
        else{
            mins -= 1
            lbl_Min.text = String(mins) + " mins"
            secs += 59
            lbl_Sec.text = String(secs) + " secs"
        }
        
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    
    //Action triggered by user pressing the Stop button
    @IBAction func stop(_ sender: Any) {
        //Stops the timer
        timer.invalidate()
        
        //resets label and slider to default (30 mins 0 seconds)
        mins = 30
        secs = 0
        sliderOutlet.setValue(30, animated: true)
        lbl_Min.text = "30 mins"
        lbl_Sec.text = "0 secs"
        
        //Stop alarm
        audioPlayer.stop()
        
        //Unhides slider and re-ensables Start button while counting down
        sliderOutlet.isHidden = false
        startOutlet.isEnabled = true
        
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        do{
            let audioPath = Bundle.main.path(forResource: "Alarm1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
                
        }
            
        catch{
            //Error
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
