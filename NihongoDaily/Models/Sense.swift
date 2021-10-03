//
//	Sense.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class Sense : NSManagedObject{

	@NSManaged var word : Word!
	@NSManaged var antonym : NSMutableSet!
	@NSManaged var appliesToKana : NSMutableSet!
	@NSManaged var appliesToKanji : NSMutableSet!
	@NSManaged var dialect : NSMutableSet!
	@NSManaged var field : NSMutableSet!
	@NSManaged var gloss : NSMutableSet!
	@NSManaged var info : NSMutableSet!
	@NSManaged var languageSource : NSMutableSet!
	@NSManaged var misc : NSMutableSet!
	@NSManaged var partOfSpeech : NSMutableSet!
	@NSManaged var related : NSMutableSet!

}
