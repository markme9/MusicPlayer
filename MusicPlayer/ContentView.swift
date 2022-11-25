//
//  ContentView.swift
//  MusicPlayer
//
//  Created by mark me on 11/23/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("MusicPlayer")
                    .font(.system(size: 45, weight: .heavy))
                    .foregroundColor(Color.white)
                
                HStack {
                    Button {
                        self.audioPlayer.play()
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.pink)
                            .padding(.trailing, 30)
                    }
                    Button {
                        self.audioPlayer.pause()
                    } label: {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.pink)
                            
                    }
                    Button {
                        
                        if self.count < 4 {
                            self.count += 1
                
                        }else {
                            self.count = 1
                        }
                        
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        
                        self.audioPlayer.play()
                    } label: {
                        Image(systemName: "forward.end")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.pink)
                            .padding(.leading, 30)
                    }

                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
            self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
