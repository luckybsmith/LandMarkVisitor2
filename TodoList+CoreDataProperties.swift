//
//  TodoList+CoreDataProperties.swift
//  LandMarkVisitor
//
//  Created by Leesongeun on 2022/10/22.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var date: Date?
    @NSManaged public var detail: String?
    @NSManaged public var image: Data?
    @NSManaged public var location: String?
    @NSManaged public var priorityLevel: Int64
    @NSManaged public var title: String?
    @NSManaged public var uuid: UUID?

}

extension TodoList : Identifiable {

}
