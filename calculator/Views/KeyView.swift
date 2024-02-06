//
//  KeyView.swift
//  calculator
//
//  Created by KJ on 12/27/22.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber: Double = 0
    @State var cuurentOperation: Operation = .none
    @State private var changeColor = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ?
                                     Color("num").opacity(0.3): Color.pink.opacity(0.2))
                    .scaleEffect(changeColor  ? 1.5 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut
                        .speed(0.17).repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.gray)
                )
            }.padding()
            ForEach(buttons, id: \.self){ row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self){ elem in
                        Button {
                            self.didTap(button: elem)
                        } label: {
                            Text(elem.rawValue)
                                .font(.system(size: 30))
                                .frame(width: self.getWidth(elem: elem), height: self.getHeight(elem: elem))
                                .background(elem.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(getWidth(elem: elem)/2)
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }

                    }
                }
            }.padding(.bottom, 4)
        }
    }
    
    func getWidth(elem: Keys) -> CGFloat {
        if elem == .zero {
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }
        
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    
    func getHeight(elem: Keys) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    
    func didTap(button: Keys){
        switch  button {
        case .add, .substract, .multiply, .divide, .equal:
            if button == .add {
                self.cuurentOperation = .add
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .substract {
                self.cuurentOperation = .substract
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .multiply {
                self.cuurentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .divide {
                self.cuurentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0
                
                switch self.cuurentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .substract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                self.value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
