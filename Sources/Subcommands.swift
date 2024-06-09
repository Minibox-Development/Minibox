//
//  Subcommands.swift
//
//
//  Created by Gavin Gichini on 6/9/24.
//

import Foundation
import ArgumentParser

extension Minibox {
    struct Create: ParsableCommand {
        @OptionGroup var options: Minibox.Options
        static let configuration = CommandConfiguration(
            abstract: "Create a box",
            aliases: ["c"]
        )
        mutating func run() {
            print("Creating box \"" + options.name + "\"")
            // `do` allows us to watch for errors while running a function. In the future, we could add specific error messages by giving each of the functions a do-catch
            do {
                // Set containerURL to file:///Users/username/.minibox/boxes/boxname
                // Error if there is no home directory; yes, that's possible
                let containerURL = try URL(string: "file://" + String(contentsOf: FileManager.default.homeDirectoryForCurrentUser) + ".minibox/boxes/" + options.name + "/")!
                // Make a directory at containerURL
                // Error if there is nothing in containerURL somehow
                try FileManager.default.createDirectory(at: containerURL, withIntermediateDirectories: true)
                if options.verbose == true {
                    // Error, again, if there is nothing in containerURL
                    try print("Creating directory at " + String(contentsOf: containerURL))
                }
            } catch {
                // And if there's an error
                print("Sorry, an error has occured. Please try again or make a new issue at https://github.com/wannafedor4/Minibox")
            }
        }
    }
}
