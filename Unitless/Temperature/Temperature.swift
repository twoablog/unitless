//
//  Temperature.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 13.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

public protocol Temperature: Comparable, Hashable {
	// MARK: Conversions
	
	var kelvin: Double { get }
	var celsius: Double { get }
	var fahrenheit: Double { get }
	
	// MARK: Initializers
	
	init?(kelvin: Double)
	init?(celsius: Double)
	init?(fahrenheit: Double)
	
	// MARK: Constants
	
	static var absoluteZero: Self { get }
	static var waterFreezingPoint: Self { get }
	static var waterBoilingPoint: Self { get }
}
