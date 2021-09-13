//
//  ContentView.swift
//  We Split
//
//  Created by Giovanni Gaffé on 2021/9/13.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermionne","Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                    }
            }
            Text("You choose: \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
