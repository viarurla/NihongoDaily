import Foundation
import CoreData

class Word : NSManagedObject{

	@NSManaged var id : String!
	@NSManaged var kana : [Kana]?
	@NSManaged var kanji : NSMutableSet!
	@NSManaged var sense : [Sense]?


}
