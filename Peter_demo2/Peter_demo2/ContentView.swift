//
//  ContentView.swift
//  Peter_demo2
//
//  Created by Jing Han on 2023/4/17.
//

import SwiftUI

//struct ContentView: View {
//    var isRain = true
//
//    var body: some View {
//        VStack {
//            if isRain {
//                Image(systemName: "cloud.rain.fill")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                Text("我們淋著大雨不知何時才能放晴")
//            } else {
//                Image(systemName: "sun.max.fill")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                Text("太陽公公出來了，他對我呀笑呀笑")
//            }
//            Button {
//
//            } label: {
//                Text("今天天氣如何 ?")
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var isRain = true
//
//    var body: some View {
//        VStack {
//            Image(systemName: isRain ? "cloud.rain.fill" : "sun.max.fill")
//                .resizable()
//                .frame(width: 100, height: 100)
//            Text(isRain ? "我們淋著大雨不知何時才能放晴" : "太陽公公出來了，他對我呀笑呀笑")
//            Button {
//                isRain = Bool.random()
//            } label: {
//                Text("今天天氣如何 ?")
//            }
//        }
//    }
//}

// Binding
//struct ContentView: View {
//    @State private var DiceNumber:Int = 1
//    var DiceName = ["die.face.1.fill",
//                    "die.face.2.fill",
//                    "die.face.3.fill",
//                    "die.face.4.fill",
//                    "die.face.5.fill",
//                    "die.face.6.fill"]
//    var body: some View {
//        VStack{
//            Image(systemName: DiceName[DiceNumber-1])
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .onTapGesture{
//                    DiceNumber = Int.random(in: 1...6)
//                }
//            DiceButton(DiceNumber: $DiceNumber)
//        }
//    }
//}
//
//struct DiceButton: View {
//    @Binding var DiceNumber:Int
//    var body: some View {
//        Button("Dice"){
//            DiceNumber = Int.random(in: 1...6)
//        }.font(.title)
//    }
//}

//struct ContentView: View {
//    @State private var isRain = true
//
//    var body: some View {
//        VStack {
//            Image(systemName: isRain ? "cloud.rain.fill" : "sun.max.fill")
//                .resizable()
//                .frame(width: 100, height: 100)
//            Text(isRain ? "我們淋著大雨不知何時才能放晴" : "太陽公公出來了，他對我呀笑呀笑")
//            Toggle(isOn: $isRain) {
//                Text("今天下雨嗎?")
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var scale: Double = 1
//
//    var body: some View {
//        VStack {
//            Image("hook")
//                .resizable()
//                .scaleEffect(scale)
//            Slider(value: $scale, in: 0...1)
//                .tint(.orange)
//            Text("\(scale, specifier: "%.2f")")
//            let scaleString = scale.formatted(.number.precision(.fractionLength(2)))
//            Text(scaleString)
//        }
//    }
//}

// Slide
//struct ContentView: View {
//  @State private var age: Double = 18
//
//  var body: some View {
//     VStack {
//         let ageString = age.formatted(.number.precision(.fractionLength(0)))
//         Text("彼得潘的真實年紀:\(ageString)")
//        Slider(value: $age, in: 18...20, step: 1) {
//            Text("age")
//        } minimumValueLabel: {
////            Text("18")
//            Image(systemName: "18.circle")
//        } maximumValueLabel: {
////            Text("20")
//            Image(systemName: "20.circle")
//        }
//     }
//   }
//}

// Date
//struct ContentView: View {
//    @State private var snackTime = Date()
//    @State private var birthday = Date()
//    @State private var studyTime = Date()
//
//    var body: some View {
//        VStack {
//            Group{
//                DatePicker("工具人送宵夜的時間", selection: $snackTime)
//                Text(snackTime.formatted(.dateTime))
//                Text(snackTime.formatted(.dateTime.year().month()))
//                Text(snackTime.formatted(date: .complete, time: .standard))
//                Text(snackTime, style: .date)
//                Text(snackTime, style: .time)
//            }
//            Group{
//                DatePicker("記得在這天送我生日禮物", selection: $birthday, displayedComponents: .date)
//                DatePicker("記得在這天送我生日禮物", selection: $birthday, displayedComponents: .hourAndMinute)
//                Text(birthday.formatted(date: .long, time: .omitted))
//            }
//            Group{
//                DatePicker("我要在這一天開始認真寫 App", selection: $studyTime, in: Date()..., displayedComponents: .date)
//                Text(studyTime.formatted(date: .long, time: .omitted))
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var studyTime = Date()
//    var dateRange: ClosedRange<Date> {
//        Date()...DateComponents(calendar: .current, year: 2024, month: 12, day: 31).date!
//    }
//    @State private var firstKissDay = Date()
//
//    var body: some View {
//        VStack {
//            DatePicker("我要在這一天開始認真寫 App", selection: $studyTime, in: dateRange, displayedComponents: .date)
//            Text(studyTime.formatted(date: .long, time: .omitted))
//
//            DatePicker("我的初吻發生在", selection: $firstKissDay, in: ...Date(), displayedComponents: .date)
//            Text(firstKissDay.formatted(date: .long, time: .omitted))
//        }
//    }
//}

// TextField
struct ContentView: View {
    @State private var name = ""
//    @State private var age = ""
    @State private var age: Int?

    var body: some View {
        VStack{
            TextField("你的名字", text: $name, prompt: Text("你的名字"))
                .padding()
            Button("印出名字") {
                print(name)
            }
//            TextField("你的年紀", text: $age, prompt: Text("你的年紀"))
            TextField("你的年紀", value: $age, format: .number, prompt: Text("你的年紀"))
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .overlay(textFieldBorder)
                .padding()
//            Button("印出年紀") {
//                            if let age = Int(age) {
//                                print(age)
//                            } else {
//                                print("not number")
//                            }
//                        }
        }
    }

    var textFieldBorder: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 5)
    }
}

//struct ContentView: View {
//    @State private var message = ""
//
//    var body: some View {
//        TextEditor(text: $message)
//            .frame(height: 300)
//            .padding()
//            .border(.black, width: 5)
//            .padding()
//    }
//}

// 讓輸入的文字變成小圓點。
//struct ContentView: View {
//    @State private var password = ""
//    @State private var name = ""
//
//    var body: some View {
//        VStack{
//            SecureField("password", text: $password, prompt: Text("password"))
//                .textFieldStyle(.roundedBorder)
//                .padding()
//            TextField("你的名字", text: $name, prompt: Text("你的名字"))
//                .textFieldStyle(.roundedBorder)
//                .padding()
//                .onSubmit {
//                    print(name)
//                }
//                .submitLabel(.next)//利用 submitLabel 設定 return 鍵的文字。
//        }
//    }
//}

// Alert
//struct ContentView: View {
//    @State private var showAlert = false
//    @State private var alertTitle = ""
//    var body: some View {
//        Button {
//            showAlert = true
//            alertTitle = ["愛", "不愛"].randomElement()!
//        } label: {
//            VStack {
//                Image("rabbit")
//                    .resizable()
//                    .scaledToFit()
//                Text("你還愛我嗎")
//            }
//        }
//        .alert(alertTitle, isPresented: $showAlert, actions: {
//            Button("OK") {
//            }
//            Button("Cancel", role: .cancel) {
//            }
//            Button("Destructive", role: .destructive) {
//            }
//        }, message: {
//            Text("真心不騙")
//        })
//    }
//}

// Picker
//struct ContentView: View {
//    let roles = ["李白", "李嘉誠", "彼得潘", "奇妙仙子"]
//    @State private var selectedIndex = 0
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedIndex) {
////                Text(roles[0]).tag(0)
////                Text(roles[1]).tag(1)
////                Text(roles[2]).tag(2)
////                Text(roles[3]).tag(3)
//                ForEach(roles.indices) { item in
//                    Text(roles[item])
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(roles[selectedIndex])")
//        }
//    }
//}

//struct Role {
//    let name: String
//    let gender: String
//}
//struct ContentView: View {
//    let roles = [
//        Role(name: "李白", gender: "男"),
//        Role(name: "李嘉誠", gender: "男"),
//        Role(name: "彼得潘", gender: "男"),
//        Role(name: "奇妙仙子", gender: "女")
//    ]
//    @State private var selectedIndex = 0
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedIndex) {
//                ForEach(roles.indices) { item in
//                    Text(roles[item].name)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(roles[selectedIndex].name)")
//        }
//    }
//}

//struct ContentView: View {
//    @State private var loveAge = 2
//
//    var body: some View {
//        VStack {
//            Picker(selection: $loveAge) {
//                ForEach(18..<100) { age in
//                    Text("\(age)歲")
//                }
//            } label: {
//                Text("age")
//            }
//            Text("適合談戀愛的年紀: \(18 + loveAge) 歲")
//        }
//    }
//}

//struct ContentView: View {
//    let roles = ["李白", "李嘉誠", "彼得潘", "奇妙仙子"]
//    @State private var selectedName = "李白"
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedName) {
//                ForEach(roles, id: \.self) { role in
//                    Text(role)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(selectedName)")
//        }
//    }
//}


//struct Role {
//    let name: String
//    let gender: String
//}
//struct ContentView: View {
//    let roles = [
//        Role(name: "李白", gender: "男"),
//        Role(name: "李嘉誠", gender: "男"),
//        Role(name: "彼得潘", gender: "男"),
//        Role(name: "奇妙仙子", gender: "女")
//    ]
//    @State private var selectedName = "李白"
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedName) {
//                ForEach(roles, id: \.name) { role in
//                    Text(role.name)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(selectedName)")
//        }
//    }
//}


// Hashable
//struct Role: Hashable {
//    let name: String
//    let gender: String
//
//    static let roles = [
//        Role(name: "李白", gender: "男"),
//        Role(name: "李嘉誠", gender: "男"),
//        Role(name: "彼得潘", gender: "男"),
//        Role(name: "奇妙仙子", gender: "女")
//    ]
//}
//struct ContentView: View {
//
//    @State private var selectedRole = Role.roles[0]
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedRole) {
//
//                ForEach(Role.roles, id: \.self) { role in
//                    Text(role.name)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(selectedRole.name)")
//        }
//    }
//}

//extension String: Identifiable {
//    public var id: String { self }
//}
//struct ContentView: View {
//    let roles = ["李白", "李嘉誠", "彼得潘", "奇妙仙子"]
//    @State private var selectedName = "李白"
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedName) {
//                ForEach(roles) { role in
//                    Text(role)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//
//            Text("要是能重來，我要選\(selectedName)")
//        }
//    }
//}

//struct Role: Identifiable {
//    let name: String
//    let gender: String
//    var id: String { name }
//}
//struct ContentView: View {
//    let roles = [
//        Role(name: "李白", gender: "男"),
//        Role(name: "李嘉誠", gender: "男"),
//        Role(name: "彼得潘", gender: "男"),
//        Role(name: "奇妙仙子", gender: "女")
//    ]
//    @State private var selectedName = "李白"
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedName) {
//                ForEach(roles) { role in
//                    Text(role.name)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(selectedName)")
//        }
//    }
//}

//struct Role: Hashable, Identifiable {
//    let name: String
//    let gender: String
//    var id: Role { self }
//
//    static let roles = [
//        Role(name: "李白", gender: "男"),
//        Role(name: "李嘉誠", gender: "男"),
//        Role(name: "彼得潘", gender: "男"),
//        Role(name: "奇妙仙子", gender: "女")
//    ]
//}
//struct ContentView: View {
//    @State private var selectedRole = Role.roles[0]
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedRole) {
//                ForEach(Role.roles) { role in
//                    Text(role.name)
//                }
//            } label: {
//                Text("選擇角色")
//            }
//            Text("要是能重來，我要選\(selectedRole.name)")
//        }
//    }
//}

// enum
//enum Animal: String, CaseIterable, Identifiable {
//    case cat
//    case dog
//    case rabbit
//    var id: Animal { self }
//}
//struct ContentView: View {
//    @State private var selectAnimal = Animal.cat
//
//    var body: some View {
//
//        VStack {
//            Picker(selection: $selectAnimal) {
//                ForEach(Animal.allCases) { animal in
//                    Text(animal.rawValue)
//                }
//            } label: {
//                Text("選擇動物")
//            }
//            Text("要是能重來，我要選 \(selectAnimal.rawValue)")
//        }
//
//    }
//}

//struct ContentView: View {
//    let roles = ["李白", "李嘉誠", "彼得潘", "奇妙仙子"]
//    @State private var selectedIndex = 0
//
//    var body: some View {
//        VStack {
//            Picker(selection: $selectedIndex) {
//                ForEach(roles.indices) { item in
//                    Text(roles[item])
//                }
//            } label: {
//                Text("選擇角色")
//            }
////            .pickerStyle(.automatic)
////            .pickerStyle(.menu)
//            .pickerStyle(.wheel)
////            .pickerStyle(.segmented)
////            .pickerStyle(.inline)
//            Text("要是能重來，我要選\(roles[selectedIndex])")
//        }
//    }
//}

// sheet
//struct ContentView: View {
//    @State private var showSecondPage = false
//    var body: some View {
//        Button("show second page") {
//            showSecondPage = true
//        }.sheet(isPresented: $showSecondPage) {
//            SecondView(showSecondPage: $showSecondPage)
//        }
//    }
//}
//
//struct SecondView: View {
//    @Binding var showSecondPage: Bool
//    var body: some View {
//        Button("close") {
//            showSecondPage = false
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(showSecondPage: .constant(true))
//    }
//}

//
//struct ContentView: View {
//
//    @State private var moveDistance: Double = 0
//    @State private var opacity: Double = 1
//
//    var body: some View {
//
//        VStack {
//            Button("奔跑吧，hook") {
//                moveDistance += 100
//                opacity -= 0.3
//            }
//            .font(.title)
//            HStack {
//                Image("hook")
//                    .offset(x: moveDistance, y: 0)
//                    .opacity(opacity)
////                    .animation(.easeOut, value: opacity)
////                    .animation(.easeOut, value: moveDistance)
//                    .animation(.spring(dampingFraction: 0.1).speed(2), value: moveDistance)
//                    .animation(.spring(dampingFraction: 0.1).speed(2), value: opacity)
////                    .animation(.spring(dampingFraction: 0.1).speed(2).repeatCount(3, autoreverses: false), value: moveDistance)
//                Spacer()
//            }
//        }
//
//    }
//}

//struct ContentView: View {
//
//    @State private var moveDistance: Double = 0
//    @State private var opacity: Double = 1
//
//    var body: some View {
//
//        VStack {
//            Button("奔跑吧，hook") {
//                moveDistance += 100
//            }
//            .font(.title)
//            HStack {
//                Image("hook")
//                    .offset(x: moveDistance, y: 0)
//                    .opacity(opacity)
//                    .animation(.default, value: opacity)
//                Spacer()
//            }
//        }
//
//    }
//}
//

// Animate
//struct ContentView: View {
//
//    @State private var rotateDegree: Double = 0
//
//    var body: some View {
//
//        VStack {
//            Button("轉吧，hook") {
//                rotateDegree = 360
//            }
//            .font(.title)
//            Image("hook")
//                .rotationEffect(.degrees(rotateDegree))
//                .animation(
//                    .linear(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//                    .delay(2),
////                    .repeatForever(autoreverses: false),
//                    value: rotateDegree
//                )
//                .onAppear {
//                    rotateDegree = 360
//                }
//
//        }
//    }
//}

//
//struct ContentView: View {
//    @State private var show = false
//    var scaleAndOpacityTransition: AnyTransition {
//        .scale(scale: 3).combined(with: .opacity)}
//    var body: some View {
//        VStack {
//            if show {
//                Image("hook")
////                    .transition(.opacity)
////                    .transition(.scale(scale: 3))
////                    .transition(.scale(scale:3).combined(with: .opacity))
//                    .transition(scaleAndOpacityTransition)
//            }
//        }
////        .animation(.easeInOut(duration: 5), value: show)
//        .onAppear {
//            withAnimation(.easeInOut(duration: 5)){
//                show = true
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var show = false
//
//    var body: some View {
//        VStack {
//            Button(show ? "Hide" : "Show"){
//                show.toggle()
//            }
//                .animation(nil, value: show)
//            if show {
//                Image("hook")
////                    .transition(.opacity)
//                    .transition(.asymmetric(insertion: .scale, removal: .slide))
//            } else {
//                Image("hook")
//                    .hidden()
//            }
//        }
//        .animation(.easeInOut(duration: 2), value: show)
//    }
//}
//
//extension AnyTransition {
//    static var customTransition: Self {
//        let insertion = AnyTransition.move(edge: .trailing)
//            .combined(with: .opacity)
//        let removal = AnyTransition.offset(x: 200, y: 200)
//            .combined(with: .opacity)
//        return .asymmetric(insertion: insertion, removal: removal)
//    }
//}
//
//struct ContentView: View {
//    @State private var show = false
//    var body: some View {
//        VStack {
//            Button(show ? "hide" : "show") {
//                show.toggle()
//            }
//                .animation(nil, value: show)
//            if show {
//                Image("hook")
//                    .transition(.customTransition)
//            } else {
//                Image("hook")
//                    .hidden()
//            }
//        }
//        .animation(.easeInOut(duration: 5), value: show)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
