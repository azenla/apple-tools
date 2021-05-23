//
//  main.swift
//  itunes-duplicates
//
//  Created by Kenneth Endfinger on 5/22/21.
//

import iTunesLibrary

let library = try ITLibrary(apiVersion: "1.0")
let allMediaItems = library.allMediaItems

var uniqueMediaItems: [String:[ITLibMediaItem]] = [:]

for item in allMediaItems {
  guard item.mediaKind == .kindSong else {
    continue
  }

  let artistName = item.artist?.name
  let title = item.title

  let key = "\(title) by \(artistName ?? "__NONE__")"

  if uniqueMediaItems[key] == nil {
    uniqueMediaItems[key] = []
  }

  uniqueMediaItems[key]!.append(item)
}

print("Possible Duplicates:")
for key in uniqueMediaItems.keys {
  let items = uniqueMediaItems[key]!

  guard items.count > 1 else {
    continue
  }

  print("  \(key) (\(items.count) found)")
}
