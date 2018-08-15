//
//  TemperatureFormatter.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 15.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

public struct TemperatureFormatter: TemperatureFormatterProtocol { // TODO: Add precision (as in number of relevant digits) with rounding
	public enum Format {
		case kelvin
		case celsius
		case fahrenheit
	}
	
	public let format: Format
	
	public func toString<T>(_ temperature: T) -> String where T : TemperatureProtocol {
		switch format {
		case .kelvin:
			return "\(temperature.kelvin) K"
		case .celsius:
			return "\(temperature.celsius) °C"
		case .fahrenheit:
			return "\(temperature.fahrenheit) °F"
		}
	}
}
