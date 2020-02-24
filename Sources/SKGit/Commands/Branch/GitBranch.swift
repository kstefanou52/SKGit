//
//  GitBranch.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 22/02/2020.
//

import Foundation
import SKBashTask

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

    func run<T>(completion: @escaping (T?, GitError?) -> Void) {
        BashTaskManager.run(with: self.command) { (response, status) in
            guard status == SKBashTaskStatus.success else { return }

            switch self {
            case .all:
                let branches : [URL] = response.components(separatedBy: "\n  ").compactMap({ URL(string: $0) })
                completion(branches as! T, nil)
            }
        }
    }

}
