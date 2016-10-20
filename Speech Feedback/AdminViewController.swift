//
//  AdminViewController.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 10/4/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import AWSMobileHubHelper
import AWSDynamoDB


class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func post(_ sender: AnyObject) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        
        let itemToCreate = Comment()
        
        itemToCreate?.poster = AWSIdentityManager.defaultIdentityManager().identityId!
        itemToCreate?.post = "note-1"
        itemToCreate?.timeStr = "6"
        itemToCreate?.timeInt = 2016
        
        objectMapper.save(itemToCreate!, completionHandler: {(error: Error?) -> Void in
            if let error = error {
                print("Amazon DynamoDB Save Error: \(error)")
                return
            }
            print("Item saved.")
        })
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
