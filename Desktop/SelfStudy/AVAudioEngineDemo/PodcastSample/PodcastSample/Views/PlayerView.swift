//
//  PlayerView.swift
//  PodcastDemo
//
//  Created by Soni Suman on 22/05/21.
//

import SwiftUI

struct PlayerView: View {
    @StateObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            Image.artwork
                .resizable()
                .aspectRatio(
                    nil,
                    contentMode: .fit)
                .padding()
                .layoutPriority(1)
            
            controlsView
                .padding(.bottom)
        }
    }
    
    private var controlsView: some View {
        VStack {
            ProgressView(value: viewModel.playerProgress)
                .progressViewStyle(
                    LinearProgressViewStyle(tint: .rwGreen))
                .padding(.bottom, 8)
            
            HStack {
                Text(viewModel.playerTime.elapsedText)
                
                Spacer()
                
                Text(viewModel.playerTime.remainingText)
            }
            .font(.system(size: 14, weight: .semibold))
            
            Spacer()
            
            audioControlButtons
                .disabled(!viewModel.isPlayerReady)
                .padding(.bottom)
            
            Spacer()
            
            adjustmentControlsView
        }
        .padding(.horizontal)
    }
    
    private var adjustmentControlsView: some View {
        VStack {
            HStack {
                Text("Playback speed")
                    .font(.system(size: 16, weight: .bold))
                
                Spacer()
            }
            
            Picker("Select a rate", selection: $viewModel.playbackRateIndex) {
                ForEach(0..<viewModel.allPlaybackRates.count) {
                    Text(viewModel.allPlaybackRates[$0].label)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .disabled(!viewModel.isPlayerReady)
            .padding(.bottom, 20)
            
            HStack {
                Text("Pitch adjustment")
                    .font(.system(size: 16, weight: .bold))
                
                Spacer()
            }
            
            Picker("Select a pitch", selection: $viewModel.playbackPitchIndex) {
                ForEach(0..<viewModel.allPlaybackPitches.count) {
                    Text(viewModel.allPlaybackPitches[$0].label)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .disabled(!viewModel.isPlayerReady)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.groupedBackground))
    }
    
    private var audioControlButtons: some View {
        HStack(spacing: 20) {
            Spacer()
            
            Button {
                viewModel.skip(forwards: false)
            } label: {
                Image.backward
            }
            .font(.system(size: 32))
            
            Spacer()
            
            Button {
                viewModel.playOrPause()
            } label: {
                ZStack {
                    Color.rwGreen
                        .frame(
                            width: 10,
                            height: 35 * CGFloat(viewModel.meterLevel))
                        .opacity(0.5)
                    
                    viewModel.isPlaying ? Image.pause : Image.play
                }
            }
            .frame(width: 40)
            .font(.system(size: 45))
            
            Spacer()
            
            Button {
                viewModel.skip(forwards: true)
            } label: {
                Image.forward
            }
            .font(.system(size: 32))
            
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.vertical, 20)
        .frame(height: 58)
    }
}
