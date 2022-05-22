//
//  ContentView.swift
//  Calculator
//
//  Created by Faiq on 12/10/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK:- Constants
    let rows = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "−"],
        [".", "0", "=", "+"]
    ] // Array with button titles for each
    
    
    // MARK:- Properties
    /// State variables which will be used as view binding to automatically update the UI whenever their value changes.
    @State var finalValue: String = "Digital Curry Recpie"
    @State var calExpression: [String] = []  //user entered expression
    @State var noBeingEntered: String = "" //save user entered number
    
    
    // MARK:- Helper Functions
    func flattenTheExpression(exps: [String]) -> String {
        /**
         This function take in the expression array and return a string with all the items appended one after another.
         */
        var calExp = ""
        for exp in exps {
            calExp.append(exp)
        }
        
        return calExp
    }
    
    func getBackground(str:String) -> Color {
        /**Return differnt font sizes for operators and numbers.*/
        if checkIfOperator(str: str) {
            return primaryColor
        }
        return Color.black
    }
    
    func getFontSize(btnTxt: String) -> CGFloat {
        /**Return differnt font sizes for operators and numbers.*/
        if checkIfOperator(str: btnTxt) {
            return 42
        }
        return 24
    }
    
    func checkIfOperator(str:String) -> Bool {
        /**This function returns if the passed argument is a operator or not.*/
        if str == "÷" || str == "×" || str == "−" || str == "+" || str == "=" {
            return true
        }
        return false
    }
    
    func processExpression(exp: [String]) -> String {
        //Expression doesn't have the second
        if exp.count < 3 {
            return "0.0"
        }
        
        var a = Double(exp[0])  // Get the first no
        var c = Double("0.0")   // Init the second no
        
        for i in (1...exp.count-2) {
            c = Double(exp[i+1])
            
            switch exp[i] {
            case "+":
                a! += c!
            case "−":
                a! -= c!
            case "×":
                a! *= c!
            case "÷":
                a! /= c!
            default:
                print("skipping the rest")
            }
        }
        
        return String(format: "%.1f", a!)
    }
    
    // MARK:- Body
    var body: some View {
        VStack {
            VStack {
                // MARK:- Display Result
                Text(self.finalValue)
                    .font(Font.custom("HelveticaNeue-Thin", size: 78))
                    .foregroundColor(.white)
                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                
                // MARK:- Display Expression
                Text(flattenTheExpression(exps: calExpression))
                    .font(Font.custom("HelveticaNeue-Thin", size: 24))
                    .frame(alignment: Alignment.bottomTrailing)
                    .foregroundColor(Color.white)
                
                Spacer()
            } //: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(primaryColor)
            
            // MARK:- Number Pad
            VStack {
                Spacer(minLength: 48)
                VStack {
                    ForEach(rows, id: \.self) {row in
                        HStack(alignment: .top, spacing: 0) {
                            Spacer(minLength: 13)
                            ForEach(row, id: \.self) { column in
                                Button(action: {
                                    if column == "=" {
                                        self.calExpression = []
                                        self.noBeingEntered = ""
                                        return
                                    } else if checkIfOperator(str: column)  {
                                        self.calExpression.append(column)
                                        self.noBeingEntered = ""
                                    } else {
                                        self.noBeingEntered.append(column)
                                        if self.calExpression.count == 0 {
                                            self.calExpression.append(self.noBeingEntered)
                                        } else {
                                            if !checkIfOperator(str: self.calExpression[self.calExpression.count-1]) {
                                                self.calExpression.remove(at: self.calExpression.count-1)
                                            }
                                            
                                            self.calExpression.append(self.noBeingEntered)
                                        }
                                    }
                                    
                                    self.finalValue = processExpression(exp: self.calExpression)
                                    // This code ensures that future operations are done on evaluated result rather than evaluating the expression from scratch.
                                    if self.calExpression.count > 3 {
                                        self.calExpression = [self.finalValue, self.calExpression[self.calExpression.count - 1]]
                                    }
                                }, label: {
                                    Text(column)
                                        .font(.system(size: getFontSize(btnTxt: column)))
                                        .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                })
                                .foregroundColor(Color.white)
                                .background(getBackground(str: column))
                                .mask(CustomShape(radius: 40, value: column))
                            }
                        }
                        
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 414, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.black)
        } //: VSTACK
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
