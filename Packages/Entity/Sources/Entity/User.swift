//
//  User.swift
//  
//
//  Created by Yuki Okudera on 2022/11/23.
//

import Foundation

public struct User: Decodable, Equatable, Sendable {

    public let description: String?
    public let facebookId: String?
    public let followeesCount: Int
    public let followersCount: Int
    public let githubLoginName: String?
    public let id: String
    public let itemsCount: Int
    public let linkedinId: String?
    public let location: String?
    public let name: String
    public let organization: String?
    public let permanentId: Int
    public let profileImageUrl: String
    public let teamOnly: Bool
    public let twitterScreenName: String?
    public let websiteUrl: String?

    public init(
        description: String?,
        facebookId: String?,
        followeesCount: Int,
        followersCount: Int,
        githubLoginName: String?,
        id: String,
        itemsCount: Int,
        linkedinId: String?,
        location: String?,
        name: String,
        organization: String?,
        permanentId: Int,
        profileImageUrl: String,
        teamOnly: Bool,
        twitterScreenName: String?,
        websiteUrl: String?
    ) {
        self.description = description
        self.facebookId = facebookId
        self.followeesCount = followeesCount
        self.followersCount = followersCount
        self.githubLoginName = githubLoginName
        self.id = id
        self.itemsCount = itemsCount
        self.linkedinId = linkedinId
        self.location = location
        self.name = name
        self.organization = organization
        self.permanentId = permanentId
        self.profileImageUrl = profileImageUrl
        self.teamOnly = teamOnly
        self.twitterScreenName = twitterScreenName
        self.websiteUrl = websiteUrl
    }
}
