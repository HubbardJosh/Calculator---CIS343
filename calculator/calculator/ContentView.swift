//
//  ContentView.swift
//  calculator
//
//  Created by Josh Hubbard on 4/14/20.
//  Copyright © 2020 Josh Hubbard. All rights reserved.
//

import SwiftUI

var sum = 0
var currentNum = 0
var values = [Int]()
var decValues = [String]()
var isAdd = false
var isSub = false
var isDiv = false
var isMult = false
var isExp = false
var decimalLevel = false
var usedOperator = ""
var preVal1 = 0
var preVal2 = 0
var expNum = 0
var tryToDivideByZero = false

struct ContentView: View {
    @State var currentNumString: String = "0"
    @State var runningCalcs: String = " "
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 10) {
            VStack(alignment: .trailing, spacing: 10) {
                ScrollView {
                    Text(self.runningCalcs)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(nil)
                        .frame(width: 190.0)
                        .foregroundColor(.blue)
                        .frame(maxHeight: .infinity, alignment: .trailing)
                    
                }
            }
            .frame(height: 200.0)
            Text(self.currentNumString)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
                .lineLimit(1)
                .frame(width: 190.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                
        
            HStack(alignment: .bottom, spacing: 10) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment: .bottom, spacing: 10) {
                        Button(action: {
                            seven()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("7")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            eight()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            
                            Text("8")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            nine()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("9")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                    }
                    
                    HStack(alignment: .bottom, spacing: 10) {
                        Button(action: {
                            four()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("4")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            five()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("5")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            six()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("6")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                    }
                    HStack(alignment: .bottom, spacing: 10) {
                        Button(action: {
                            one()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("1")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            two()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("2")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            three()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("3")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                    }
                    HStack(alignment: .bottom, spacing: 10) {
                        Button(action: {
                            exponent()
                        }) {
                            Text("^")
                                .foregroundColor(Color.blue)
                                .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            zero()
                            self.currentNumString = "\(currentNum)"
                        }) {
                            Text("0")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                        Button(action: {
                            compute()
                            self.currentNumString = "\(values[0])"
                            if (tryToDivideByZero) {
                                self.runningCalcs += "\nERROR: Can't divide by zero."
                                tryToDivideByZero = false
                            } else {
                                self.runningCalcs += "\n\(Int(preVal1)) \(usedOperator) \(Int(preVal2)) = \(Int(values[0]))"
                            }
                            
                        }) {
                            Text("=")
                                .foregroundColor(Color.blue)
                            .bold()
                                .padding(.all, 15.0)
                                .frame(width: 40.0, height: 40.0)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Button(action: {
                        div()
                        self.currentNumString = "\(values[0])"
                    }) {
                        Text("/")
                            .foregroundColor(Color.blue)
                        .bold()
                            .padding(.all, 15.0)
                            .frame(width: 40.0, height: 40.0)
                    }
                    Button(action: {
                        mult()
                        self.currentNumString = "\(values[0])"
                    }) {
                        Text("*")
                            .foregroundColor(Color.blue)
                        .bold()
                            .padding(.all, 15.0)
                            .frame(width: 40.0, height: 40.0)
                    }
                    Button(action: {
                        add()
                        self.currentNumString = "\(values[0])"
                    }) {
                        Text("+")
                            .foregroundColor(Color.blue)
                        .bold()
                            .padding(.all, 15.0)
                            .frame(width: 40.0, height: 40.0)
                    }
                    Button(action: {
                        sub()
                        self.currentNumString = "\(values[0])"
                    }) {
                        Text("-")
                            .foregroundColor(Color.blue)
                        .bold()
                            .padding(.all, 15.0)
                            .frame(width: 40.0, height: 40.0)
                    }
                    
                }
                
            }
            Button(action: {
                clear()
                self.currentNumString = "\(currentNum)"
            }) {
                Text("Clear")
                    .foregroundColor(Color.blue)
                .bold()
                    .padding(.all, 10.0)
                    .frame(width: 190.0, height: 40.0)
            }
        }
        .padding(.bottom, 10.0)
        .scaleEffect(1.5)
    }
    
}

func exponent() {
    values.append(currentNum)
    currentNum = 0
    isExp = true
    decimalLevel = false
    usedOperator = "^"
}
func add() {
    values.append(currentNum)
    currentNum = 0
    isAdd = true
    decimalLevel = false
    usedOperator = "+"
}
func sub() {
    values.append(currentNum)
    currentNum = 0
    isSub = true
    decimalLevel = false
    usedOperator = "-"
}
func div() {
    values.append(currentNum)
    currentNum = 0
    isDiv = true
    decimalLevel = false
    usedOperator = "/"
}
func mult() {
    values.append(currentNum)
    currentNum = 0
    isMult = true
    decimalLevel = false
    usedOperator = "*"
}
func compute() {
    values.append(currentNum)
    preVal1 = Int(values[0])
    preVal2 = Int(currentNum)
    if (isAdd) {
        values[0] += values.last!
    } else if (isSub) {
        values[0] -= values.last!
    } else if (isMult) {
        values[0] *= values.last!
    } else if (isDiv) {
        if (values.last! != 0) {
            values[0] /= values.last!
        } else {
            tryToDivideByZero = true
            print("Can't divide by 0")
            clear()
            values.append(preVal1)
        }
    } else if (isExp) {
        for _ in 0..<(Int(values.last!) - 1) {
            values[0] *= preVal1
        }
    }
    
    sum = values[0]
    print("Value of calculation: \(sum)")
    isAdd = false
    isSub = false
    isMult = false
    isDiv = false
    isExp = false
    sum = 0
    currentNum = 0
    
    decimalLevel = false
}
func clear() {
    sum = 0
    currentNum = 0
    values.removeAll()
    
    isAdd = false
    isSub = false
    isMult = false
    isDiv = false
    decimalLevel = false
}
func one() {
    currentNum *= 10
    currentNum += 1
}
func two() {
    currentNum *= 10
    currentNum += 2
}
func three() {
    currentNum *= 10
    currentNum += 3
}
func four() {
    currentNum *= 10
    currentNum += 4
}
func five() {
    currentNum *= 10
    currentNum += 5
}
func six() {
    currentNum *= 10
    currentNum += 6
}
func seven() {
    currentNum *= 10
    currentNum += 7
}
func eight() {
    currentNum *= 10
    currentNum += 8
}
func nine() {
    currentNum *= 10
    currentNum += 9
}
func zero() {
    currentNum *= 10
}

func dec() {
    decValues.append("\(currentNum).")
    decimalLevel = true
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


