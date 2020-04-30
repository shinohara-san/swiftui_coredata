//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Yuki Shinohara on 2020/04/10.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredList: View {
//    var fetchRequest: FetchRequest<Singer>
//    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
//
//    init(filter: String) {
//        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//        //lastNameがfilter変数で始まるものを表示してる
//    }
//
//    var body: some View {
//        List(fetchRequest.wrappedValue, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
