//
//  JournalEntry.swift
//  Jrnl
//
//  Created by Sean on 3/26/25.
//

import UIKit
// UIKit 안에 Foundation 있다.
import MapKit
import SwiftData

@Model
class JournalEntry {
  var id: UUID
  var date: Date
  var rating: Int
  var entryTitle: String
  var entryBody: String
  @Attribute(.externalStorage) var photoData: Data?
  var latitude: Double?
  var longitude: Double?
  
  init?(rating: Int, title: String, body: String, photo: UIImage? = nil, latitude: Double? = nil, longitude: Double? = nil) {
    if title.isEmpty || body.isEmpty || rating < 0 || rating > 5 {
      return nil
    }
    self.id = UUID()
    self.date = Date()
    self.rating = rating
    self.entryTitle = title
    self.entryBody = body
    self.photoData = photo?.jpegData(compressionQuality: 1.0)
    self.latitude = latitude
    self.longitude = longitude
  }
  
  @Transient
  var title: String? {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
  }
}

//struct SampleJournalEntryData {
//  var journalEntries: [JournalEntry] = []
//  
//  mutating func createSampleJournalEntryData() {
//    let photo1 = UIImage(systemName: "sun.max")
//    let photo2 = UIImage(systemName: "cloud")
//    let photo3 = UIImage(systemName: "cloud.sun")
//    guard let journalEntry1 = JournalEntry(rating: 5, title: "Good", body: "Today is a good day", photo: photo1) else {
//      fatalError("Unable to instantiate journalEntry1")
//    }
//    guard let journalEntry2 = JournalEntry(rating: 0, title: "Bad", body: "Today is a bad day", photo: photo2, latitude: 37.3318, longitude: -122.0312) else {
//      fatalError("Unable to instantiate journalEntry2")
//    }
//    guard let journalEntry3 = JournalEntry(rating: 3, title: "Ok", body: "Today is an Ok day", photo: photo3) else {
//      fatalError( "Unable to instantiate journalEntry3")
//    }
//    journalEntries += [journalEntry1, journalEntry2, journalEntry3]
//  }
//}
