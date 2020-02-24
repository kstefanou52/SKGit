//
//  GitBranch.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 22/02/2020.
//

import Foundation

public enum GitBranch: GitCommand {
    var name: String { return "branch" }

    case all

    var command: String {
        switch self {
        case .all:
            return Git.name + name + Options.all.parameter
        }
    }

    public enum Options: Hashable {
        case all

        public var parameter: String {
            switch self {
            case .all: return " -a"
            }
        }
    }

}
