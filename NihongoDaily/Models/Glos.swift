//
//	Glos.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class Glos : NSManagedObject{

	@NSManaged var sense : Sense!
	@NSManaged var lang : String!
	@NSManaged var text : String!
	@NSManaged var type : String!
}
