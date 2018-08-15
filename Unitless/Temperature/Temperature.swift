//
//  Temperature.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 14.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

public struct Temperature: TemperatureProtocol {
	public let kelvin: Double
	
	public init?(kelvin: Double) {
		guard kelvin >= 0.0 else { return nil }
		self.kelvin = kelvin
	}
	
	public init?(celsius: Double) {
		self.init(kelvin: celsius + Temperature.kelvinWaterFreezingPoint)
	}
	
	public init?(fahrenheit: Double) {
		self.init(kelvin: (fahrenheit - Temperature.fahrenheitAbsoluteZero) / Temperature.fahrenheitToKelvinRatio)
	}
	
	public var celsius: Double {
		return kelvin - Temperature.kelvinWaterFreezingPoint
	}
	
	public var fahrenheit: Double {
		return (kelvin * Temperature.fahrenheitToKelvinRatio) + Temperature.fahrenheitAbsoluteZero
	}
	
	public static let absoluteZero = Temperature(kelvin: 0.0)!
	
	public static let waterFreezingPoint = Temperature(kelvin: kelvinWaterFreezingPoint)!
	
	public static let waterBoilingPoint = Temperature(kelvin: kelvinWaterFreezingPoint + 100.0)!
	
	public static let waterTriplePoint = Temperature(kelvin: kelvinWaterFreezingPoint + 0.01)!
	
	public static func < (lhs: Temperature, rhs: Temperature) -> Bool {
		return lhs.kelvin < rhs.kelvin
	}
}

fileprivate extension Temperature {
	static let kelvinWaterFreezingPoint: Double = 273.15
	static let fahrenheitAbsoluteZero: Double = -459.67
	static let fahrenheitToKelvinRatio: Double = 1.8
}
