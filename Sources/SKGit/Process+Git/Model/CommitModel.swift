//
//  CommitModel.swift
//  
//
//  Created by Κωνσταντίνος Στεφάνου on 24/02/2020.
//

import Foundation

struct CommitModel: Codable {

    let commitHash, treeHash, reflogIdentityName, reflogIdentityEmail, refNames,
    subject, body, commitNotes, commiterName, commiterEmail, authorName, authorEmail: String?

    let authorDate: String?
    let commiterDate: String?
}
