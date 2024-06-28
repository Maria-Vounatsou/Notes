//
//  ContentView.swift
//  WordScramble
//
//  Created by Maria Vounatsou on 10/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    //Split that string up into an array of strings in order that we can pick one randomly with components(separatedBy:)
    
    func testStrings() {
        let input = """
        a
        b
        c
        """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        ///Swift doesn’t know if the array contains a value.As a result, the randomElement() method returns an optional string, which we must either unwrap or use with nil coalescing.
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        //Removes white space, tabb , lines
    }
    //Check for misspelled words
    func testStringsTwo() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Lists

//let people = ["Finn", "Leia", "Luke", "Rey"]
//
//var body: some View {
//        List(people, id: \.self) {
//            Text($0)
//        }
//
//    List {
//        Text("Static Row")
//
//        ForEach(people, id: \.self) {
//            Text($0)
//        }
//
//        Text("Static Row")
//    }
//
// }
//}

//App Bundle

//var body: some View {
//    VStack {
//        Image(systemName: "globe")
//            .imageScale(.large)
//            .foregroundColor(.accentColor)
//        Text("Hello, world!")
//    }
//    .padding()
//}
////Loading a file from an appbundle into a string
////AppBumdle Definition: When Xcode builds your iOS app, it creates something called a “bundle”. This happens on all of Apple’s platforms, including macOS, and it allows the system to store all the files for a single app in one place – the binary code (the actual compiled Swift stuff we wrote), all the artwork, plus any extra files we need all in one place.
//
//func testBundles() {
//    if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
//
//        if let fileContents = try? String(contentsOf: fileURL) {
//            //we loaded the file into a string!
//        }
//    }
//}
