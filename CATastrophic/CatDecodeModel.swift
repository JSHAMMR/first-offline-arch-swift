//
//  CatDecodeModel.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 21/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dCatDecodeModel = try DCatDecodeModel(json)

import Foundation

// MARK: - DCatDecodeModelElement
class DCatDecodeModelElement: Codable {
    var breeds: [DBreed]?
    var categories: [DCategory]?
    var id: String?
    var url: String?
    var width: Int?
    var height: Int?

    enum CodingKeys: String, CodingKey {
        case breeds
        case categories
        case id
        case url
        case width
        case height
    }

    init(breeds: [DBreed]?, categories: [DCategory]?, id: String?, url: String?, width: Int?, height: Int?) {
        self.breeds = breeds
        self.categories = categories
        self.id = id
        self.url = url
        self.width = width
        self.height = height
    }
}

// MARK: DCatDecodeModelElement convenience initializers and mutators

extension DCatDecodeModelElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DCatDecodeModelElement.self, from: data)
        self.init(breeds: me.breeds, categories: me.categories, id: me.id, url: me.url, width: me.width, height: me.height)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        breeds: [DBreed]?? = nil,
        categories: [DCategory]?? = nil,
        id: String?? = nil,
        url: String?? = nil,
        width: Int?? = nil,
        height: Int?? = nil
    ) -> DCatDecodeModelElement {
        return DCatDecodeModelElement(
            breeds: breeds ?? self.breeds,
            categories: categories ?? self.categories,
            id: id ?? self.id,
            url: url ?? self.url,
            width: width ?? self.width,
            height: height ?? self.height
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DBreed
class DBreed: Codable {
    var weight: DWeight?
    var id: String?
    var name: String?
    var vetstreetURL: String?
    var temperament: String?
    var origin: String?
    var countryCodes: String?
    var countryCode: String?
    var breedDescription: String?
    var lifeSpan: String?
    var indoor: Int?
    var lap: Int?
    var altNames: String?
    var adaptability: Int?
    var affectionLevel: Int?
    var childFriendly: Int?
    var dogFriendly: Int?
    var energyLevel: Int?
    var grooming: Int?
    var healthIssues: Int?
    var intelligence: Int?
    var sheddingLevel: Int?
    var socialNeeds: Int?
    var strangerFriendly: Int?
    var vocalisation: Int?
    var experimental: Int?
    var hairless: Int?
    var natural: Int?
    var rare: Int?
    var rex: Int?
    var suppressedTail: Int?
    var shortLegs: Int?
    var wikipediaURL: String?
    var hypoallergenic: Int?

    enum CodingKeys: String, CodingKey {
        case weight
        case id
        case name
        case vetstreetURL
        case temperament
        case origin
        case countryCodes
        case countryCode
        case breedDescription
        case lifeSpan
        case indoor
        case lap
        case altNames
        case adaptability
        case affectionLevel
        case childFriendly
        case dogFriendly
        case energyLevel
        case grooming
        case healthIssues
        case intelligence
        case sheddingLevel
        case socialNeeds
        case strangerFriendly
        case vocalisation
        case experimental
        case hairless
        case natural
        case rare
        case rex
        case suppressedTail
        case shortLegs
        case wikipediaURL
        case hypoallergenic
    }

    init(weight: DWeight?, id: String?, name: String?, vetstreetURL: String?, temperament: String?, origin: String?, countryCodes: String?, countryCode: String?, breedDescription: String?, lifeSpan: String?, indoor: Int?, lap: Int?, altNames: String?, adaptability: Int?, affectionLevel: Int?, childFriendly: Int?, dogFriendly: Int?, energyLevel: Int?, grooming: Int?, healthIssues: Int?, intelligence: Int?, sheddingLevel: Int?, socialNeeds: Int?, strangerFriendly: Int?, vocalisation: Int?, experimental: Int?, hairless: Int?, natural: Int?, rare: Int?, rex: Int?, suppressedTail: Int?, shortLegs: Int?, wikipediaURL: String?, hypoallergenic: Int?) {
        self.weight = weight
        self.id = id
        self.name = name
        self.vetstreetURL = vetstreetURL
        self.temperament = temperament
        self.origin = origin
        self.countryCodes = countryCodes
        self.countryCode = countryCode
        self.breedDescription = breedDescription
        self.lifeSpan = lifeSpan
        self.indoor = indoor
        self.lap = lap
        self.altNames = altNames
        self.adaptability = adaptability
        self.affectionLevel = affectionLevel
        self.childFriendly = childFriendly
        self.dogFriendly = dogFriendly
        self.energyLevel = energyLevel
        self.grooming = grooming
        self.healthIssues = healthIssues
        self.intelligence = intelligence
        self.sheddingLevel = sheddingLevel
        self.socialNeeds = socialNeeds
        self.strangerFriendly = strangerFriendly
        self.vocalisation = vocalisation
        self.experimental = experimental
        self.hairless = hairless
        self.natural = natural
        self.rare = rare
        self.rex = rex
        self.suppressedTail = suppressedTail
        self.shortLegs = shortLegs
        self.wikipediaURL = wikipediaURL
        self.hypoallergenic = hypoallergenic
    }
}

// MARK: DBreed convenience initializers and mutators

extension DBreed {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DBreed.self, from: data)
        self.init(weight: me.weight, id: me.id, name: me.name, vetstreetURL: me.vetstreetURL, temperament: me.temperament, origin: me.origin, countryCodes: me.countryCodes, countryCode: me.countryCode, breedDescription: me.breedDescription, lifeSpan: me.lifeSpan, indoor: me.indoor, lap: me.lap, altNames: me.altNames, adaptability: me.adaptability, affectionLevel: me.affectionLevel, childFriendly: me.childFriendly, dogFriendly: me.dogFriendly, energyLevel: me.energyLevel, grooming: me.grooming, healthIssues: me.healthIssues, intelligence: me.intelligence, sheddingLevel: me.sheddingLevel, socialNeeds: me.socialNeeds, strangerFriendly: me.strangerFriendly, vocalisation: me.vocalisation, experimental: me.experimental, hairless: me.hairless, natural: me.natural, rare: me.rare, rex: me.rex, suppressedTail: me.suppressedTail, shortLegs: me.shortLegs, wikipediaURL: me.wikipediaURL, hypoallergenic: me.hypoallergenic)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        weight: DWeight?? = nil,
        id: String?? = nil,
        name: String?? = nil,
        vetstreetURL: String?? = nil,
        temperament: String?? = nil,
        origin: String?? = nil,
        countryCodes: String?? = nil,
        countryCode: String?? = nil,
        breedDescription: String?? = nil,
        lifeSpan: String?? = nil,
        indoor: Int?? = nil,
        lap: Int?? = nil,
        altNames: String?? = nil,
        adaptability: Int?? = nil,
        affectionLevel: Int?? = nil,
        childFriendly: Int?? = nil,
        dogFriendly: Int?? = nil,
        energyLevel: Int?? = nil,
        grooming: Int?? = nil,
        healthIssues: Int?? = nil,
        intelligence: Int?? = nil,
        sheddingLevel: Int?? = nil,
        socialNeeds: Int?? = nil,
        strangerFriendly: Int?? = nil,
        vocalisation: Int?? = nil,
        experimental: Int?? = nil,
        hairless: Int?? = nil,
        natural: Int?? = nil,
        rare: Int?? = nil,
        rex: Int?? = nil,
        suppressedTail: Int?? = nil,
        shortLegs: Int?? = nil,
        wikipediaURL: String?? = nil,
        hypoallergenic: Int?? = nil
    ) -> DBreed {
        return DBreed(
            weight: weight ?? self.weight,
            id: id ?? self.id,
            name: name ?? self.name,
            vetstreetURL: vetstreetURL ?? self.vetstreetURL,
            temperament: temperament ?? self.temperament,
            origin: origin ?? self.origin,
            countryCodes: countryCodes ?? self.countryCodes,
            countryCode: countryCode ?? self.countryCode,
            breedDescription: breedDescription ?? self.breedDescription,
            lifeSpan: lifeSpan ?? self.lifeSpan,
            indoor: indoor ?? self.indoor,
            lap: lap ?? self.lap,
            altNames: altNames ?? self.altNames,
            adaptability: adaptability ?? self.adaptability,
            affectionLevel: affectionLevel ?? self.affectionLevel,
            childFriendly: childFriendly ?? self.childFriendly,
            dogFriendly: dogFriendly ?? self.dogFriendly,
            energyLevel: energyLevel ?? self.energyLevel,
            grooming: grooming ?? self.grooming,
            healthIssues: healthIssues ?? self.healthIssues,
            intelligence: intelligence ?? self.intelligence,
            sheddingLevel: sheddingLevel ?? self.sheddingLevel,
            socialNeeds: socialNeeds ?? self.socialNeeds,
            strangerFriendly: strangerFriendly ?? self.strangerFriendly,
            vocalisation: vocalisation ?? self.vocalisation,
            experimental: experimental ?? self.experimental,
            hairless: hairless ?? self.hairless,
            natural: natural ?? self.natural,
            rare: rare ?? self.rare,
            rex: rex ?? self.rex,
            suppressedTail: suppressedTail ?? self.suppressedTail,
            shortLegs: shortLegs ?? self.shortLegs,
            wikipediaURL: wikipediaURL ?? self.wikipediaURL,
            hypoallergenic: hypoallergenic ?? self.hypoallergenic
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DWeight
class DWeight: Codable {
    var imperial: String?
    var metric: String?

    enum CodingKeys: String, CodingKey {
        case imperial
        case metric
    }

    init(imperial: String?, metric: String?) {
        self.imperial = imperial
        self.metric = metric
    }
}

// MARK: DWeight convenience initializers and mutators

extension DWeight {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DWeight.self, from: data)
        self.init(imperial: me.imperial, metric: me.metric)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        imperial: String?? = nil,
        metric: String?? = nil
    ) -> DWeight {
        return DWeight(
            imperial: imperial ?? self.imperial,
            metric: metric ?? self.metric
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DCategory
class DCategory: Codable {
    var id: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

// MARK: DCategory convenience initializers and mutators

extension DCategory {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DCategory.self, from: data)
        self.init(id: me.id, name: me.name)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil
    ) -> DCategory {
        return DCategory(
            id: id ?? self.id,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

typealias DCatDecodeModel = [DCatDecodeModelElement]

extension Array where Element == DCatDecodeModel.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DCatDecodeModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
