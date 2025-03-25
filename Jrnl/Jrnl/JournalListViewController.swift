//
//  ViewController.swift
//  Jrnl
//
//  Created by Sean on 3/25/25.
//

import UIKit

class JournalListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func unwindNewEntryCancel(segue: UIStoryboardSegue) {
    
  }
}

extension JournalListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath)
  }
}

