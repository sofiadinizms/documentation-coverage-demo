//
//  Models.swift
//  DoccCoverageDemo
//
//  Created by Sofia Diniz Melo Santos on 07/04/25.
//

import Foundation

struct DocItem: Codable, Identifiable {
    var id: String { usr }
    let usr: String
    let title: String
    let sourceLanguage: SourceLanguage
    let hasAbstract: Bool
    let kind: Kind
    let availability: [String]
    let hasCodeListing: Bool
    let availableSourceLanguages: [SourceLanguage]
    let kindSpecificData: KindSpecificData
    let isCurated: Bool
}


struct SourceLanguage: Codable {
    let name: String
    let linkDisambiguationID: String
    let id: String
}

struct Kind: Codable {
    let isSymbol: Bool
    let name: String
    let id: String
}

struct KindSpecificData: Codable {
    let discriminant: String
    let associatedValue: AssociatedValue
}

struct AssociatedValue: Codable {
    let total: Int
    let documented: Int
}
