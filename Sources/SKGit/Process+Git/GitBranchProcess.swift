//
//  GitBranchProcess.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 24/02/2020.
//

import Foundation
import SKBashTask

struct GitBranchProcess {

    static func run<T>(param: GitBranch, completion: @escaping (T?, GitError?) -> Void) {
        BashTaskManager.run(with: param.command) { (response, status) in
            guard status == SKBashTaskStatus.success else { return }

            switch param {
            case .all:
                let branches : [URL] = response.components(separatedBy: "\n  ").compactMap({ URL(string: $0) })
                completion(branches as! T, nil)
            }
        }
    }
}
