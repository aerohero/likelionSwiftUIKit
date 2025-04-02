//
//  SharedData.swift
//  Jrnl
//
//  Created by Sean on 3/29/25.
//

import Foundation
import SwiftData

class SharedData {
  // MARK: - Properties
  static let shared = SharedData()
  private var journalEntries: [JournalEntry]?
  
  var container: ModelContainer?
  var context: ModelContext?
  
  // MARK: - Initializer
  private init() {
    do {
      let schema = Schema([JournalEntry.self],
                          version: Schema.Version(1, 0, 0))
      let configuration = ModelConfiguration(
        schema: schema,
        groupContainer: ModelConfiguration.GroupContainer.identifier("group.kr.co.codegrove.Jrnl")
      )
      container = try ModelContainer(for: schema, configurations: configuration)
      if let container = container {
        context = ModelContext(container)
      }
    } catch {
      fatalError("Failed to create ModelContainer")
    }
  }
  
  // MARK: access methods
  
  var numberOfJournalEntries: Int {
    return journalEntries?.count ?? 0
  }
  
  // 전체 데이터 반환
  func getAllJournalEntries() -> [JournalEntry] {
    return journalEntries ?? []
  }
  
  func getJournalEntry(at index: Int) -> JournalEntry {
    return (journalEntries?[index])!
  }
  
  func fetchJournalEntries() {
    let descriptor = FetchDescriptor<JournalEntry>(sortBy: [SortDescriptor(\.date, order: .reverse)])
    do {
      if let context {
        journalEntries = try context.fetch(descriptor)
      }
    } catch {
      print("Failed to fetch journal entries: \(error.localizedDescription)")
      journalEntries = []
    }
  }
  
  // 데이터 추가
  func addJournalEntry(_ entry: JournalEntry) {
    if let context {
      context.insert(entry)
    }
  }
  
  // 데이터 삭제
  func removeSelected(journalEntry: JournalEntry) {
    if let context {
      context.delete(journalEntry)
    }
  }
}
