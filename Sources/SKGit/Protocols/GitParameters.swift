//
//  GitParameters.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 22/02/2020.
//

import Foundation

protocol GitParameters: RawRepresentable, CaseIterable {
    var param: String { get }
}
