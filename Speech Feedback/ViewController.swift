//
//  ViewController.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 9/18/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewController2Delegate {
    
    var timer = Timer()
    var count = 0
    //var passedDictionary: NSMutableDictionary = [:]
    //var passedCount = 0
    
    var dictionary = NSMutableDictionary()
    
    @IBOutlet weak var label: UILabel!
       
    //Rotate slider 90 degrees
    @IBOutlet weak var slider: UISlider! {
        didSet{
    slider.transform = CGAffineTransform(rotationAngle: 1.57)
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChanged(_ sender: AnyObject) {
        //snaps slider to interger values 
       let intValue = (Int) (slider.value)
        let rounded = Float(intValue)
        slider.setValue( rounded, animated: true)
    }
    @IBAction func timerStarted(_ sender: AnyObject) {
        //Stops timer in case button is pressed multiple times accidentally
        timer.invalidate()
        //Timer set to one second intervals, performing function defined in timerAction() method below
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }

    //Add current slider value to the dictionary at the current time, increment time and change the label
    func timerAction(){
        dictionary[count] = slider.value
        count+=1
        label.text =  String(count)
        
    }
    //Segues to ViewController2
    @IBAction func timerStopped(_ sender: AnyObject) {
        timer.invalidate()
        
        for index in 0...count {
            print( "\(index) : \(dictionary[index]) ")
        }
            
        
    }
    
    //sets up this instance of ViewController as the delegate member of the
    //post-segue instance of ViewController2 to perserve the values of count and dictionary
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "results"){
            let dest = segue.destination as! ViewController2
            dest.delegate = self
            
            
          
            
        }
    }
}

