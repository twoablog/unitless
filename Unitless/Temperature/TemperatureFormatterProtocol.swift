//
//  TemperatureFormatterProtocol.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 15.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import Foundation

public protocol TemperatureFormatterProtocol {
	func toString<T>(_ temperature: T) -> String where T : TemperatureProtocol
}
