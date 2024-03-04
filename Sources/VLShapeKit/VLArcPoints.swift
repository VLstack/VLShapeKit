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
// public init()
// {
// }
}

//extension VLArcPoints: Equatable
//{
// public static func == (lhs: VLArcPoints, rhs: VLArcPoints) -> Bool
// {
//  return    lhs.center == rhs.center
//         && lhs.innerRadius == rhs.innerRadius
//         && lhs.innerStart == rhs.innerStart
//         && lhs.innerEnd == rhs.innerEnd
//         && lhs.outerRadius == rhs.outerRadius
//         && lhs.outerStart == rhs.outerStart
//         && lhs.outerEnd == rhs.outerEnd
// }
//}

//extension VLArcPoints: Hashable
//{
// func hash(into hasher: inout Hasher)
// {
//  hasher.combine(center.x)
//  hasher.combine(center.y)
//  hasher.combine(innerRadius)
//  hasher.combine(innerStart.x)
//  hasher.combine(innerStart.y)
//  hasher.combine(innerEnd.x)
//  hasher.combine(innerEnd.y)
//  hasher.combine(outerRadius)
//  hasher.combine(outerStart.x)
//  hasher.combine(outerStart.y)
//  hasher.combine(outerEnd.x)
//  hasher.combine(outerEnd.y)
// }
//}
