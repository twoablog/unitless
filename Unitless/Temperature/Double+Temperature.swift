//
//  Double+Temperature.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 13.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

extension Double {
	// MARK: Conversions
	
	public func kelvin<T: Temperature>() -> T? {
		return T(kelvin: self)
	}
	
	public func celsius<T: Temperature>() -> T? {
		return T(celsius: self)
	}
	
	public func fahrenheit<T: Temperature>() -> T? {
		return T(fahrenheit: self)
	}
}
