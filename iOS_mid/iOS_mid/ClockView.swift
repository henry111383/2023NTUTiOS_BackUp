//
//  ClockView.swift
//  iOS_mid
//
//  Created by Jing Han on 2023/5/11.
//

import SwiftUI

struct ClockView: View {
    @State private var currentTime: Date = Date()

    private let clockFrameSize: CGFloat = 250

    var body: some View {
        VStack {
            Text("現在時間")
                .font(.largeTitle)
                .bold()
                .padding([.bottom], 5)
            Text(currentTime, style: .time)
                .font(.largeTitle)
                .bold()
                .padding([.bottom], 10)

            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: clockFrameSize, height: clockFrameSize)

                ForEach(0..<12) { index in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 4, height: index % 3 == 0 ? 15 : 7)
                        .offset(y: (clockFrameSize/2) - 30)
                        .rotationEffect(.degrees(Double(index) * 30))
                }

                ForEach(0..<60) { index in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: index % 5 == 0 ? 10 : 5)
                        .offset(y: (clockFrameSize/2) - 15)
                        .rotationEffect(.degrees(Double(index) * 6))
                }
                // 時針
                let Hdeg = Double(Calendar.current.component(.hour, from: currentTime)) * 30 + Double(Calendar.current.component(.minute, from: currentTime)) / 3
                Path { path in
                    path.move(to: CGPoint(x: clockFrameSize/2, y: clockFrameSize/2))
                    path.addLine(to: CGPoint(x: clockFrameSize/2, y: 60))
                }
                .stroke(Color.black, lineWidth: 2)
                .rotationEffect(.degrees(Hdeg))
                
                // 分針
                let Mdeg = Double(Calendar.current.component(.minute, from: currentTime)) * 6 + Double(Calendar.current.component(.second, from: currentTime)) / 10
                Path { path in
                    path.move(to: CGPoint(x: clockFrameSize/2, y: clockFrameSize/2))
                    path.addLine(to: CGPoint(x: clockFrameSize/2, y: 40))
                }
                .stroke(Color.black, lineWidth: 1)
                .rotationEffect(.degrees(Mdeg))
                
                // 秒針
                Path { path in
                    path.move(to: CGPoint(x: clockFrameSize/2, y: clockFrameSize/2))
                    path.addLine(to: CGPoint(x: clockFrameSize/2, y: 30))
                }
                .stroke(Color.black, lineWidth: 1)
                .rotationEffect(.degrees(Double(Calendar.current.component(.second, from: currentTime)) * 6))

            }
            .frame(width: clockFrameSize, height: clockFrameSize)
            .padding()

            Spacer()
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                currentTime = Date()
            }
            timer.fire()
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
