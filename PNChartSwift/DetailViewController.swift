//
//  DetailViewController.swift
//  PNChartSwift
//
//  Created by YiChen Zhou on 8/14/17.
//

import UIKit

class DetailViewController: UIViewController {
    var chartName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let _chartName = self.chartName else {
            print("Invalid Chart Name")
            return
        }
        
        self.title = _chartName
        
        switch _chartName {
        case "Pie Chart":
            let pieChart = self.setPieChart()
            self.view.addSubview(pieChart)
        case "Bar Chart":
            let barChart = self.setBarChart()
            self.view.addSubview(barChart)
        case "Line Chart":
            let lineChart = self.setLineChart()
            self.view.addSubview(lineChart)
        default:
            break
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        for view in self.view.subviews {
//            view.removeFromSuperview()
//        }
//    }
    
    private func setPieChart() -> PNPieChart {
		let shadowOffset = CGSize(width: 0, height: 7)
        let item1 = PNPieChartDataItem(dateValue: 20, dateColor:  PNLightGreen, description: "Build")
		item1.shadow = PNPieChartDataItemShadow(withOpacity: 0.28, offset: shadowOffset, color: UIColor.black.cgColor, radius: 7)
        let item2 = PNPieChartDataItem(dateValue: 20, dateColor: PNFreshGreen, description: "I/O")
		item2.shadow = PNPieChartDataItemShadow(withOpacity: 0.28, offset: shadowOffset, color: UIColor.red.cgColor, radius: 7)
        let item3 = PNPieChartDataItem(dateValue: 45, dateColor: PNDeepGreen, description: "WWDC")
		item3.shadow = PNPieChartDataItemShadow(withOpacity: 0.28, offset: shadowOffset, color: UIColor.green.cgColor, radius: 7)
		
        let frame = CGRect(x: 40, y: 155, width: 150, height: 150)
        let items: [PNPieChartDataItem] = [item1, item2, item3]
        let pieChart = PNPieChart(frame: frame, items: items)
        pieChart.descriptionTextColor = UIColor.white
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 14)!
        pieChart.center = self.view.center
		
		// New Feature
		pieChart.maxSliceWidth = 40
		pieChart.fallingOffset = 2.5
		
        return pieChart
    }
    
    private func setBarChart() -> PNBarChart {
        let barChart = PNBarChart(frame: CGRect(x: 0, y: 135, width: 320, height: 200))
        barChart.backgroundColor = UIColor.clear
        barChart.animationType = .Waterfall
        barChart.labelMarginTop = 5.0
        barChart.xLabels = ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"]
        barChart.yValues = [1, 23, 12, 18, 30, 12, 21]
        barChart.strokeChart()
        barChart.center = self.view.center
        return barChart
    }

    private func setLineChart() -> PNLineChart {
        let lineChart = PNLineChart(frame: CGRect(x: 0, y: 135, width: 320, height: 250))
        lineChart.yLabelFormat = "%1.1f"
        lineChart.showLabel = true
        lineChart.backgroundColor = UIColor.clear
        lineChart.xLabels = ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"]
        lineChart.showCoordinateAxis = true
        lineChart.center = self.view.center
        
        let dataArr = [60.1, 160.1, 126.4, 232.2, 186.2, 127.2, 176.2]
        let data = PNLineChartData()
        data.color = PNGreen
        data.itemCount = dataArr.count
        data.inflexPointStyle = .None
        data.getData = ({
            (index: Int) -> PNLineChartDataItem in
            let yValue = CGFloat(dataArr[index])
            let item = PNLineChartDataItem(y: yValue)
            return item
        })
        
        lineChart.chartData = [data]
        lineChart.strokeChart()
        return lineChart
    }
}
