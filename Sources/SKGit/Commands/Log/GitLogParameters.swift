//
//  GitCommitParameters.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 22/02/2020.
//

import Foundation

public enum GitCommitParameters: String, GitParameters {

    static let tag: String = "^^^^-^^^"

    case commitHash
    case treeHash
    case authorName
    case authorEmail
    case authorDate
    case commiterName
    case commiterEmail
    case commiterDate
    case refNames
    case subject
    case body
    case commitNotes
    case reflogIdentityName
    case reflogIdentityEmail

    public var param: String {
        switch self {
        case .commitHash : return "%H"
        case .treeHash : return "%T"
        case .authorName : return "%aN"
        case .authorEmail : return "%aE"
        case .authorDate : return "%aI"
        case .commiterName : return "%cN"
        case .commiterEmail : return "%cE"
        case .commiterDate : return "%cI"
        case .refNames : return "%d"
        case .subject : return "%s"
        case .body : return "%b"
        case .commitNotes : return "%N"
        case .reflogIdentityName : return "%gN"
        case .reflogIdentityEmail : return "%gE"
        }
    }

    static func getAllParametersInJsonFormat() -> String {
        var exportString: String = "{"
        for param in GitCommitParameters.allCases {
            exportString.append(GitCommitParameters.tag + param.rawValue + GitCommitParameters.tag + ":")
            exportString.append(GitCommitParameters.tag + param.param + GitCommitParameters.tag)
            if param != GitCommitParameters.allCases.last { exportString.append(",") }
        }
        exportString.append("},")
        return exportString
    }
}
