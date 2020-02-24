//
//  Git.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 21/02/2020.
//

import Foundation

public enum Git {

    static var name: String { return "git" }

    static public var branch: GitBranch.Type { return GitBranch.self }
    static public var log: GitLog.Type { return GitLog.self }
}
