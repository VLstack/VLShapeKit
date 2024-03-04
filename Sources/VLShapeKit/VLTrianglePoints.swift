import Foundation
import SwiftUI

@Observable
public final class VLTrianglePoints: Identifiable, Sendable
{
 public let id: String = UUID().uuidString

 public var topMiddle: CGPoint = .zero
 
 public var bottomRight: CGPoint = .zero
 
 public var bottomLeft: CGPoint = .zero
 
 public init(topMiddle: CGPoint = .zero,
             bottomRight: CGPoint = .zero,
             bottomLeft: CGPoint = .zero)
 {
  self.topMiddle = topMiddle
  self.bottomRight = bottomRight
  self.bottomLeft = bottomLeft
 }
}
