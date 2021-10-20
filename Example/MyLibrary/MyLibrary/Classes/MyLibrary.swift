//
//  MyLibrary.swift
//  MyLibrary-iOS
//
//  Created by François Rouault on 23/11/2020.
//

import AdManager
import Foundation

public enum MyLibrary {
  public static func initAdManager() {
    let adManager = AdManager.newAdManager()
    let bundle = Bundle(for: FWSlotConfiguration.self)

    guard let version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") else { abort() }

    print("👉 --> Current Freewheel SDK version: \(version)")
    print("👉 More Info:")
    print("👉 AdManager -> \(adManager)")
  }
}
