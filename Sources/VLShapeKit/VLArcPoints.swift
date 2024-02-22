import SwiftUI

public
class VLArcPoints: ObservableObject
{
 @Published var center: CGPoint = .zero
 @Published var innerRadius: Double = 0
 @Published var innerStart: CGPoint = .zero
 @Published var innerEnd: CGPoint = .zero
 @Published var outerRadius: Double = 0
 @Published var outerStart: CGPoint = .zero
 @Published var outerEnd: CGPoint = .zero
}

extension VLArcPoints: Equatable
{
 public
 static func == (lhs: VLArcPoints, rhs: VLArcPoints) -> Bool
 {
  return    lhs.center == rhs.center
         && lhs.innerRadius == rhs.innerRadius
         && lhs.innerStart == rhs.innerStart
         && lhs.innerEnd == rhs.innerEnd
         && lhs.outerRadius == rhs.outerRadius
         && lhs.outerStart == rhs.outerStart
         && lhs.outerEnd == rhs.outerEnd
 }
}

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
