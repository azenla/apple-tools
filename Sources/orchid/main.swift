//
//  main.swift
//  orchid
//
//  Created by Kenneth Endfinger on 5/24/21.
//

import Foundation
import CoreImage
import QuickLookThumbnailing

let arguments = ProcessInfo.processInfo.arguments
guard arguments.count == 2 else {
  print("Usage: orchid <path>")
  exit(2)
}

let url = URL(fileURLWithPath: arguments[1])
let generator = QLThumbnailGenerator()
generator.generateBestRepresentation(for: .init(fileAt: url, size: CGSize(width: 2048, height: 2048), scale: 1.0, representationTypes: [.thumbnail])) { represent, error in
  if let error = error {
    print("\(error)")
    exit(1)
  }

  guard let represent = represent else {
    return
  }

  let coreGraphicsImage = represent.cgImage
  let image = CIImage(cgImage: coreGraphicsImage)

  let context = CIContext()
  let png = try! context.pngRepresentation(of: image, format: .ARGB8, colorSpace: .init(name: CGColorSpace.displayP3)!, options: [:])

  print("\u{1b}]1337;File=inline=1:\(png!.base64EncodedString())\u{7}")
  exit(0)
}

dispatchMain()
