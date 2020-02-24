//
//  GitCommand.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 22/02/2020.
//

import Foundation

protocol GitCommand {
    var name: String { get }
    var command: String { get }
}
