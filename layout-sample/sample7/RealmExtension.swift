//import Foundation
//import RealmSwift
//
//protocol RealmProtocol { }
//extension Object: RealmProtocol { }
//
//extension RealmProtocol where Self: Object {
//
//    static func get() -> Results<Self>? {
//        do {
//            let realm = try Realm()
//            return realm.objects(self)
//        } catch {
//            return nil
//        }
//    }
//
//    static func get(_ filter: NSPredicate) -> Results<Self>? {
//        do {
//            let realm = try Realm()
//            return realm.objects(self).filter(filter)
//        } catch {
//            return nil
//        }
//    }
//
//    static func get<KeyType>(forPrimaryKey key: KeyType) -> Self? {
//        do {
//            let realm = try Realm()
//            return realm.object(ofType: self, forPrimaryKey: key)
//        } catch {
//            return nil
//        }
//    }
//
//    static func delete() {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                if let results = get(), !results.isEmpty {
//                    realm.delete(results)
//                }
//            }
//        } catch let error as NSError {
//            print(error)
//        }
//    }
//
//    static func delete(_ filter: NSPredicate) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                if let results = get(filter), !results.isEmpty {
//                    realm.delete(results)
//                }
//            }
//        } catch let error as NSError {
//            print(error)
//        }
//    }
//
//    static func delete<KeyType>(forPrimaryKey key: KeyType) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                if let object = get(forPrimaryKey: key) {
//                    realm.delete(object)
//                }
//            }
//        } catch let error as NSError {
//            print(error)
//        }
//    }
//
//    func add(update: Bool = false) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(self, update: update)
//            }
//        } catch let error as NSError {
//            print(error)
//        }
//    }
//}
