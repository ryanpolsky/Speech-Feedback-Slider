//
//  ViewController2.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 10/1/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import UIKit
import Charts


protocol ViewController2Delegate {
    
    var dictionary: NSMutableDictionary {get set}
    var count: Int {get set}
    
}

class ViewController2: UIViewController, ChartViewDelegate {

    @IBOutlet var lineView: LineChartView!
    var delegate: ViewController2Delegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineView.delegate = self
        
        var x = [Double]()
        var y = [Double]()
        for index in 0...(self.delegate!.count-1){
            let doubleX = Double(index)
            x.append(doubleX)
            y.append(self.delegate!.dictionary[index] as! Double)
        }
        
        
        
        
    
        
        setChart(dataPoints: x,values: y)
        
    }
    
    
    func setChart(dataPoints: [Double], values: [Double]){
        lineView.noDataText = "No data to display"
        
        var dataEntries: [ChartDataEntry] = []
        //var d = ChartDataEntry(x: <#T##Double#>, y: <#T##Double#>)
        
        
        for i in 0..<dataPoints.count {
            
            
            let dataEntry = ChartDataEntry(x: dataPoints[i], y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let graphDataSet = LineChartDataSet(values: dataEntries, label: "Approval")
        let graphData = LineChartData(dataSet: graphDataSet)
        lineView.data = graphData
        
        
    }
}
