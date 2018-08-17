//
//  TemperatureFormatter.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 15.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

public struct TemperatureFormatter: TemperatureFormatterProtocol {
	public enum Format {
		case kelvin
		case celsius
		case fahrenheit
	}
	
	public let format: Format
	public let numberFormatter: NumberFormatter
	
	public static let defaultNumberFormatter: NumberFormatter = {
		var result = NumberFormatter()
		result.numberStyle = .decimal
		result.localizesFormat = false
		result.roundingMode = .halfUp
		result.minimumFractionDigits = 1
		return result
	}()
	
	init(format: Format, numberFormatter: NumberFormatter = TemperatureFormatter.defaultNumberFormatter) {
		self.format = format
		self.numberFormatter = numberFormatter
	}
	
	private func formattedValue(_ value: Double) -> String {
		return numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
	}
	
	public func toString<T>(_ temperature: T) -> String where T : TemperatureProtocol {
		switch format {
		case .kelvin:
			return formattedValue(temperature.kelvin) + " K"
		case .celsius:
			return formattedValue(temperature.celsius) + " °C"
		case .fahrenheit:
			return formattedValue(temperature.fahrenheit) + " °F"
		}
	}
}
