//
//  Double+TemperatureProtocol.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 13.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

extension Double {
	
	// MARK: Conversions
	
	public func kelvin<T: TemperatureProtocol>() -> T? {
		return T(kelvin: self)
	}
	
	public func celsius<T: TemperatureProtocol>() -> T? {
		return T(celsius: self)
	}
	
	public func fahrenheit<T: TemperatureProtocol>() -> T? {
		return T(fahrenheit: self)
	}
}
