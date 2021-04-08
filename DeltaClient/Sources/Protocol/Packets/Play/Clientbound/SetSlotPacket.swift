//
//  SetSlotPacket.swift
//  DeltaClient
//
//  Created by Rohan van Klinken on 9/2/21.
//

import Foundation

struct SetSlotPacket: ClientboundPacket {
  static let id: Int = 0x16
  
  var windowId: Int8
  var slot: Int16
  var slotData: ItemStack
  
  init(from packetReader: inout PacketReader) throws {
    windowId = packetReader.readByte()
    slot = packetReader.readShort()
    slotData = try packetReader.readItemStack()
  }
}