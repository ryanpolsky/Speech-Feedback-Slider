//
//  ViewController.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 9/18/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var count = 0
    
    
    var dictionary = NSMutableDictionary()
    
    @IBOutlet weak var label: UILabel! {
        didSet{
            
        }
    }
    
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
        
       let intValue = (Int) (slider.value)
        let rounded = Float(intValue)
        slider.setValue( rounded, animated: true)
    }
    @IBAction func timerStarted(_ sender: AnyObject) {
        
        timer.invalidate()
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }

    func timerAction(){

        dictionary[count] = slider.value
        count+=1
        label.text =  String(count)
        
    }
    @IBAction func timerStopped(_ sender: AnyObject) {
        timer.invalidate()
        
        for index in 0...count {
            print( "\(index) : \(dictionary[index]) ")
        }
            
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "result"){
            let dest = segue.destination as? ViewController2
            dest?.dataDictionary = self.dictionary
            dest?.count = self.count
            
        }
    }
}

