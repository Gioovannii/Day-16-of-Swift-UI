//
//  ContentView.swift
//  We Split
//
//  Created by Giovanni Gaffé on 2021/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    @State var isZeroTips = false
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let numberOfPeople = Int(numberOfPeople) ?? 0
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalBill: Double {
        let peopleCount = Double(numberOfPeople + 2)

        let total = totalPerPerson
        return total * peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Montant", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Nombre de personnes", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) personnes")
                        }
                    }
                }
                
                Section(header: Text("Combien de pourboire voulez-vous laissez ?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Montant par personne")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Facture totale avec pourboire")) {
                    Text("$\(totalBill, specifier: "%.2f")")
                    
                }
            }
            .navigationBarTitle("On partage")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
