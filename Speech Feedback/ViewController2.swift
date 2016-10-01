//
//  ViewController2.swift
//  Speech Feedback
//
//  Created by Ryan Polsky on 10/1/16.
//  Copyright © 2016 Ryan Polsky. All rights reserved.
//

import UIKit
import Charts

class ViewController2: UIViewController, ChartViewDelegate {

    @IBOutlet var lineView: LineChartView!
    var dataDictionary = NSMutableDictionary()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineView.delegate = self
        //print(dest.count)
        
        var x = [Double]()
        var y = [Double]()
        for (index, value) in dataDictionary{
            x.append(index as! Double)
            y.append(value as! Double)
        }
        
        
        //x = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
        //y = [2,4,1,3,5,4,2,3,1,2]
        
    
        
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
