//
//  Comment.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 10/9/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import Foundation
import AWSMobileHubHelper
import AWSDynamoDB

class Comment: AWSDynamoDBObjectModel {
    
    var poster = ""
    var post = ""
    var timeStr = ""
    var timeInt = 0
    

}
