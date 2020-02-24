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

    func run<T>(completion: @escaping(T?) -> Void)
}

extension GitCommand {
    func run<T>(completion: @escaping(T?) -> Void) {
        completion("kostis" as! T)
    }
}
