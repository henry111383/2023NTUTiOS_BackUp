//
//  DirectorDetail.swift
//  Lab4
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct DirectorDetail: View {
    var body: some View {
        ScrollView {
            VStack {
                DirImage()
                Text("新海誠")
                    .font(.title)
                Text("新海誠（日語：新海 誠／しんかい まこと Shinkai Makoto ，1973年2月9日－），本名新津誠（新津 誠／にいつ まこと Niitsu Makoto），是日本動畫作家和電影導演，長野縣南佐久郡小海町出身，現居東京。新海誠於2002年公開獨立製作的動畫短片《星之聲》後開始受到矚目。其執導的2016年動畫長片《你的名字》賣座，而成為繼宮崎駿之後第二位達成百億日圓票房的日本動畫導演；早先已有「新（世代）宮崎駿」（ポスト宮崎駿，the new Miyazaki）等稱呼，新海誠本人表示與宮崎駿齊名實則過譽。")
                    .padding(20)
            }
            
        }
        
    }
}

struct DirectorDetail_Previews: PreviewProvider {
    static var previews: some View {
        DirectorDetail()
    }
}

struct DirImage: View {
    var body: some View {
        Image("新海誠本人")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .padding(30)
    }
}
