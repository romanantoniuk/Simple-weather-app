//
//  RealmManager.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private let realm: Realm
    
    private init() {
        guard let realmURL = Realm.Configuration.defaultConfiguration.fileURL else {
            fatalError("Default Realm configuration not found.")
        }
        print("Realm file URL:", realmURL)
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    func addObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Error adding object to Realm: \(error.localizedDescription)")
        }
    }
    
    func updateObject<T: Object>(_ object: T, with properties: [String: Any]) {
        do {
            try realm.write {
                for (key, value) in properties {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            print("Error updating object in Realm: \(error.localizedDescription)")
        }
    }
    
    func deleteObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("Error deleting object from Realm: \(error.localizedDescription)")
        }
    }
    
    func getAllObjects<T: Object>(ofType type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    func observeObject<T: Object>(_ object: T, completion: @escaping (T?) -> Void) -> NotificationToken {
        return object.observe { change in
            switch change {
            case .change:
                completion(object)
            case .deleted:
                completion(nil)
            case .error(let error):
                print("Error observing object: \(error)")
            }
        }
    }
    
}
