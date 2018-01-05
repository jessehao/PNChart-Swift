//
//  PNPieChartDataItemShadow.swift
//  PNChartSwift
//
//  Created by Jesse Hao on 2018/1/5.
//

import UIKit

struct PNPieChartDataItemShadow {
	var opacity:Float
	var offset:CGSize
	var color:CGColor
	var radius:CGFloat
	
	init(withOpacity opacity:Float, offset:CGSize, color:CGColor, radius:CGFloat) {
		self.opacity = opacity
		self.offset = offset
		self.color = color
		self.radius = radius
	}
}
