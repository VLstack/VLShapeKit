import Foundation
import SwiftUI

@Observable
public final class VLTrianglePoints: Identifiable, Sendable
{
 public let id: String = UUID().uuidString

 public var topMiddle: CGPoint = .zero
 
 public var bottomRight: CGPoint = .zero
 
 public var bottomLeft: CGPoint = .zero
 
// public
// init()
// {
// }
}

//extension VLTrianglePoints: Equatable
//{
// public
// static func == (lhs: VLTrianglePoints, rhs: VLTrianglePoints) -> Bool
// {
//  return    lhs.topMiddle == rhs.topMiddle
//         && lhs.bottomRight == rhs.bottomRight
//         && lhs.bottomLeft == rhs.bottomLeft
// }
//}

//extension VLTrianglePoints: Hashable
//{
// func hash(into hasher: inout Hasher)
// {
//  hasher.combine(topMiddle.x)
//  hasher.combine(topMiddle.y)
//  hasher.combine(bottomRight.x)
//  hasher.combine(bottomRight.y)
//  hasher.combine(bottomLeft.x)
//  hasher.combine(bottomLeft.y)
// }
//}
