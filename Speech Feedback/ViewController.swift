//
//  ViewController.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 9/18/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewController2Delegate, UITableViewDelegate, UITableViewDataSource {
    
    //Temporary hard-coded posts and posters, later data will come form users
    let posters = ["Poster a","Poster b","Poster c","Poster d"]
    let posts = ["Post a","Post b","Post c","Post d"]
    var postCounter = 0
    var timer = Timer()
    //Timer value
    var count = 0
    //Maps time to slider value
    var dictionary = NSMutableDictionary()
    //Displays timer time
    @IBOutlet weak var label: UILabel!
    //Displays comment loop
    @IBOutlet weak var tableView: UITableView!
       
    //Rotate slider 90 degrees
    @IBOutlet weak var slider: UISlider! {
        didSet{
    slider.transform = CGAffineTransform(rotationAngle: 1.57)
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    @IBAction func valueChanged(_ sender: AnyObject) {
    //snaps slider to interger values
       //let intValue = (Int) (slider.value)
        //let rounded = Float(intValue)
        //slider.setValue( rounded, animated: true)
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
        //every 5 seconds, we increment commentCounter to display next item in the array
        if(count%5 == 0){
            postCounter+=1
        }
        //Once commentCounter is larger then the number of elements in the array, we rest to 0
        if(postCounter == posts.count){
            postCounter = 0
        }
        tableView.reloadData()
        
        
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
    
    //The following methods allow ViewController to conform to the UITableViewDelegate
    //and UITableViewDataSource protocols

    //Only want one section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentLoop", for: cellForRowAt)
        cell.textLabel?.text = posters[postCounter]
        cell.detailTextLabel?.text = posts[postCounter]
        return cell
        
    }
    
    //We only want one row
    func tableView(_: UITableView, numberOfRowsInSection: Int) -> Int{
        return 1
    }
    

    
    
    
}

