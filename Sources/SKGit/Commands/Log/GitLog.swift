//
//  GitLog.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 22/02/2020.
//

import Foundation

public enum GitLog: GitCommand {

    public var name: String { return "log" }
    public var parameters: GitCommitParameters.Type { return GitCommitParameters.self }

    case allCommits(branch: String, numberOfResults: Int)

    public var command: String {
        switch self {
        case .allCommits(let branch, let numberOfResults):
            let jsonFormat: String = parameters.getAllParametersInJsonFormat()
            return "commits=$(git log \(branch) \(Options.format(jsonFormat).parameter) \(Options.numberOfResults(numberOfResults).parameter)) ; echo [${commits%?}]"
        }
    }

    public enum Options: Hashable {
        case format(String)
        case numberOfResults(Int)
        case skipResults(Int)

        public var parameter: String {
            switch self {
            case .format(let format): return " --pretty=format:\"\(format)\""
            case .skipResults(let count): return  " --skip=\(count)"
            case .numberOfResults(let count): return " -n \(count)"
            }
        }
    }

}
