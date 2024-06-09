//
//  main.swift
//  Minibox
//
//  Created by Gavin Gichini on 6/8/24.
//

import Foundation
import ArgumentParser

// Define program constants
let version: Float = 1.0
let versionReleaseType: String = "Preview"
let versionString = String(version) + versionReleaseType
let fancyVersionString = String(version) + " " + versionReleaseType

@main
struct Minibox: ParsableCommand {
    // Command Configuration
    static var configuration = CommandConfiguration(
        abstract: "Manage containers using a box system",
        version: fancyVersionString,
        subcommands: [Create.self]
    )
    // Global options
    struct Options: ParsableArguments {
        @Flag(name: .shortAndLong, help: "Show more information when managing a box") var verbose = false // Optional; default to false
        @Option(name: .shortAndLong, help: "The name of the box") var name: String // Required; No default
    }
}
