import Foundation
import SwiftUI

@Observable
public final class VLArcPoints: Identifiable, Sendable
{
 public let id: String = UUID().uuidString

 public var center: CGPoint = .zero
 
 public var innerRadius: Double = 0
 
 public var innerStart: CGPoint = .zero
 
 public var innerEnd: CGPoint = .zero
 
 public var outerRadius: Double = 0
 
 public var outerStart: CGPoint = .zero
 
 public var outerEnd: CGPoint = .zero

 public init(center: CGPoint = .zero,
             innerRadius: Double = 0,
             innerStart: CGPoint = .zero,
             outerRadius: Double = 0,
             outerStart: CGPoint = .zero,
             outerEnd: CGPoint = .zero)
 {
  self.center = center
  self.innerRadius = innerRadius
  self.innerStart = innerStart
  self.outerRadius = outerRadius
  self.outerStart = outerStart
  self.outerEnd = outerEnd
 }
}
