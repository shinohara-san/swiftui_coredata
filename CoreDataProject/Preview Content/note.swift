//https://www.hackingwithswift.com/books/ios-swiftui/why-does-self-work-for-foreach

//                      HashableはCodableと似てるような感じ

//struct Student: Hashable {
//    let name: String
//}
//
//struct ContentView: View {
//    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
//
//    var body: some View {
//        List(students, id: \.self) { student in
//            Text(student.name)
//        }
//    }
//}

//https://www.hackingwithswift.com/books/ios-swiftui/creating-nsmanagedobject-subclasses

//CoreDataのアンラッピングあたりのこと

//import Foundation
//import CoreData
//
//extension Movie {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
//        return NSFetchRequest<Movie>(entityName: "Movie")
//    }
//
//    @NSManaged public var title: String?
//    @NSManaged public var director: String?
//    @NSManaged public var year: Int16
//
//    public var wrappedTitle: String {
//        title ?? "Unknown Title"
//    }
//}

//https://www.hackingwithswift.com/books/ios-swiftui/conditional-saving-of-nsmanagedobjectcontext

//              変わったところだけ保存
//if self.moc.hasChanges {
//    try? self.moc.save()
//}

//https://www.hackingwithswift.com/books/ios-swiftui/ensuring-core-data-objects-are-unique-using-constraints
//                  SceneDelegateの変更も忘れずに！
//context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
       //同じデータを一つにまとめる

//struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//
//    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
//
//    var body: some View {
//        VStack {
//            List(wizards, id: \.self) { wizard in
//                Text(wizard.name ?? "Unknown")
//            }
//
//            Button("Add") {
//                let wizard = Wizard(context: self.moc)
//                wizard.name = "Harry Potter"
//            }
//
//            Button("Save") {
//                do {
//                    try self.moc.save()
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//}

//https://www.hackingwithswift.com/books/ios-swiftui/filtering-fetchrequest-using-nspredicate

//import CoreData
//import SwiftUI

//sortDescriptors　は表示されるデータの並び替え
//NSPredicate　は表示されるデータの選別

//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
////    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: nil) var ships: FetchedResults<Ship>
//    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
//
////    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var ships: FetchedResults<Ship>
////    NSPredicate(format: "universe == %@", "Star Wars"))
////    NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
////    NSPredicate(format: "name BEGINSWITH %@", "E"))
////    NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
////    NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))
//
//    var body: some View {
//        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//
//            Button("Add Examples") {
//                let ship1 = Ship(context: self.moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//
//                let ship2 = Ship(context: self.moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//
//                let ship3 = Ship(context: self.moc)
//                ship3.name = "Millennium Falcon"
//                ship3.universe = "Star Wars"
//
//                let ship4 = Ship(context: self.moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//
//                try? self.moc.save()
//            }
//        }
//    }
//}


//https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-fetchrequest-with-swiftui

//  @Environment(\.managedObjectContext) var moc
//    @State private var lastNameFilter = "A"
//
//    var body: some View {
//        VStack {
//
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
////            FilteredList(filter: lastNameFilter)
//            // list of matching singers
//
//            Button("Add Examples") {
//                let taylor = Singer(context: self.moc)
//                taylor.firstName = "Taylor"
//                taylor.lastName = "Swift"
//
//                let ed = Singer(context: self.moc)
//                ed.firstName = "Ed"
//                ed.lastName = "Sheeran"
//
//                let adele = Singer(context: self.moc)
//                adele.firstName = "Adele"
//                adele.lastName = "Adkins"
//
//                try? self.moc.save()
//            }
//
//            Button("Show A") {
//                self.lastNameFilter = "A"
//            }
//
//            Button("Show S") {
//                self.lastNameFilter = "S"
//            }
//        }
//    }
//}


//https://www.hackingwithswift.com/books/ios-swiftui/one-to-many-relationships-with-core-data-swiftui-and-fetchrequest
