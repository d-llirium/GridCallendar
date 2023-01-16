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
//        GridItem( .fixed(40) ), // a single fixed column of width 40
        GridItem( .flexible( minimum: 40) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ),
        GridItem( .flexible( minimum: 40 ) ) //  flexible option creates a column that takes up the available width it has. You must define a minimum width, and you can optionally specify a maximum width
//        GridItem( .adaptive(minimum: 80) ) // adaptive option fits multiple columns inside the width of a single GridItem
    ]
    var body: some View
    {
        ScrollView
        {
            LazyVGrid( columns: layout ) // Lazy in LazyVGrid and LazyHGrid refers to the fact that the elements of the grid aren’t created until they are needed to display in the view
            {
                ForEach(
                    year, id: \.name  //  iterates through all of the months of the year. we didn’t make the Month structure conform to Identifiable, so we need to specify a unique key path in the ForEach structure. As long as we don’t have the same name of the month in our year, we can use it as the unique id
                ) { month in
                    Section(
                        header: Text( verbatim: month.name ) // name of the month
                            .font( .headline )
                    ) {
                        ForEach(
                           month.days // days of that month
                        ) { day in // which is an array of Day instances
                            Capsule() // we create a Capsule with overlay text content that displays a string equal to the value property of the Day.
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
