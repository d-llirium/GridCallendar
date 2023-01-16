////  ContentView.swift
//  GridCallendar
//
//  Created by Patricia Carlos on 16/01/23.
//  
//

import SwiftUI

struct ContentView: View
{
    let layout = [
        GridItem( .flexible( minimum: 40) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ) //  flexible option creates a column that takes up the available width it has. You must define a minimum width, and you can optionally specify a maximum width
    ]
    var body: some View
    {
        ScrollView
        {
            LazyVGrid(
                columns: layout,
                pinnedViews: [.sectionHeaders]
            ) {
                ForEach(
                    year, id: \.name
                ) { month in
                    Section(
                        header: Text( verbatim: month.name )
                            .font( .headline )
                    ) {
                        ForEach(
                           month.days
                        ) { day in
                            Capsule()
                                .overlay(
                                    Text("\(day.value)")
                                        .foregroundColor(.white)
                                )
                                .foregroundColor(.blue)
                                .frame(height: 40)
                        }
                    }
                }
                
            }
        }
    }
}
struct Day: Identifiable //  Identifiable prot requiresan id value that is unique
{
    let id = UUID() // using a ForEach structure to iterate through the days, we’ll need to assign a unique identifier
    let value: Int // store the order of each particular day of the month
}
struct Month
{
    let name: String
    let numberOfDays: Int
    var days: [ Day ]
    
    init(
        name: String,
        numberOfDays: Int
    ) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        for n in 1...numberOfDays
        {
            self.days.append(
                Day( value: n )
            )
        }
    }
}
let year = [
    Month(name: "January", numberOfDays: 31),
    Month(name: "February", numberOfDays: 28),
    Month(name: "March", numberOfDays: 31),
    Month(name: "April", numberOfDays: 30),
    Month(name: "May", numberOfDays: 31),
    Month(name: "June", numberOfDays: 30),
    Month(name: "July", numberOfDays: 31),
    Month(name: "August", numberOfDays: 31),
    Month(name: "September", numberOfDays: 30),
    Month(name: "October", numberOfDays: 31),
    Month(name: "November", numberOfDays: 30),
    Month(name: "December", numberOfDays: 31),
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
