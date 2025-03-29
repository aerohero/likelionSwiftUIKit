//
//  JournalEntry.swift
//  Jrnl
//
//  Created by Sean on 3/26/25.
//

import UIKit
// UIKit 안에 Foundation 있다.
import MapKit

class JournalEntry: NSObject, MKAnnotation, Codable {
  
  let dateString: String
  let rating: Int
  let entryTitle: String
  let entryBody: String
  let photoData: Data?
  let latitude: Double?
  let longitude: Double?
  
  init?(rating: Int, title: String, body: String, photo: UIImage? = nil, latitude: Double? = nil, longitude: Double? = nil) {
    if title.isEmpty || body.isEmpty || rating < 0 || rating > 5 {
      return nil
    }
    let formatter = DateFormatter()
        formatter.dateStyle = .medium
        self.dateString = formatter.string(from: Date())
    self.rating = rating
    self.entryTitle = title
    self.entryBody = body
    self.photoData = photo?.jpegData(compressionQuality: 1.0)
    self.latitude = latitude
    self.longitude = longitude
  }
  
  // MARK: - MKAnnotation
  var title: String? {
    dateString
  }
  
  var subtitle: String? {
    entryTitle
  }
  
  var coordinate: CLLocationCoordinate2D {
    guard let latitude = latitude, let longitude = longitude else {
      return CLLocationCoordinate2D()
    }
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
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
