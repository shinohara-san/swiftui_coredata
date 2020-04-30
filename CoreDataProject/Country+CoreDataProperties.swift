//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Yuki Shinohara on 2020/04/10.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var shortName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var candy: NSSet? // Objective-C data type that is equivalent to Swift’s Set, but we can’t use it with SwiftUI’s ForEach.
    
    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }

    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
//    NSSetのcandyをSwiftUIで使えるように配列に変換する処理
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}
