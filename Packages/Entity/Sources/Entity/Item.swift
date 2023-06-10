//
//  Item.swift
//  
//
//  Created by Yuki Okudera on 2022/11/23.
//

import Foundation

public struct Item: Decodable, Equatable, Sendable {

    public let coediting: Bool
    public let commentsCount: Int
    public let createdAt: String?
    public let group: Group?
    public let id: String
    public let likesCount: Int
    public let `private`: Bool
    public let reactionsCount: Int
    public let stocksCount: Int
    public let tags: [Tag]
    public let title: String
    public let updatedAt: String?
    public let url: String
    public let user: User
    public let pageViewsCount: Int?
    public let teamMembership: TeamMembership?
}

// MARK: - Group
public struct Group: Decodable, Equatable, Sendable {

    public let createdAt: String?
    public let description: String
    public let name: String
    public let `private`: Bool
    public let updatedAt: String?
    public let urlName: String
}

// MARK: - Tag
public struct Tag: Decodable, Equatable, Sendable {

    public let name: String
    public let versions: [String]
}

// MARK: - TeamMembership
public struct TeamMembership: Decodable, Equatable, Sendable {

    public let name: String
}
