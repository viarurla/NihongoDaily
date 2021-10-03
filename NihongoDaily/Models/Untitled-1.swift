//
//	Untitled-1.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class Untitled-1 : NSManagedObject{

	@NSManaged var words : NSMutableSet!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any], context: NSManagedObjectContext)	{
		let entity = NSEntityDescription.entityForName("Untitled-1", inManagedObjectContext: context)!
		super.init(entity: entity, insertIntoManagedObjectContext: context)
		if let wordsArray = dictionary["words"] as? [[String:Any]]{
			var wordsSet = NSMutableSet()
			for dic in wordsArray{
				let value = Word(fromDictionary: dic, context:context)
				wordsSet.addObject(value)
			}
			words = wordsSet
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if words != nil{
			var dictionaryElements = [[String:Any]]()
			for wordsElement in words {
				dictionaryElements.append(wordsElement.toDictionary())
			}
			dictionary["words"] = dictionaryElements
		}
		return dictionary
	}

}