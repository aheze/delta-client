//
//  ViewState.swift
//  Minecraft
//
//  Created by Rohan van Klinken on 26/12/20.
//

import Foundation

class ViewState: ObservableObject {
  @Published var isPlaying = false
  @Published var selectedServer: Server?
  @Published var isErrored = false
  @Published var errorMessage: String?
  
  @Published var serverList: ServerList
  
  init(serverList: ServerList) {
    self.serverList = serverList
  }
  
  func updateServerList(newServerList: ServerList) {
    serverList = newServerList
  }
  
  func playServer(server: Server) {
    isPlaying = true
    selectedServer = server
    isErrored = false
    errorMessage = nil
  }
  
  func displayError(message: String) {
    isErrored = true
    isPlaying = false
    errorMessage = message
    selectedServer = nil
  }
}