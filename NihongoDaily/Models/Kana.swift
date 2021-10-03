//
//	Kana.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class Kana : NSManagedObject{

	@NSManaged var word : Word!
	@NSManaged var appliesToKanji : NSMutableSet!
	@NSManaged var common : Bool
	@NSManaged var tags : NSMutableSet!
	@NSManaged var text : String!

}
