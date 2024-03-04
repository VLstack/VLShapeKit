// https://github.com/kieranb662/SwiftUI-Shapes/blob/master/Sources/Shapes/Triangles.swift
import SwiftUI

public struct VLArc: Shape
{
 var startAngle: Angle
 var endAngle: Angle
 var thickness: CGFloat = 0
 var strokeWidth: CGFloat = 0
 var points: VLArcPoints?

 public init(startAngle: Double,
             endAngle: Double,
             thickness: CGFloat,
             strokeWidth: CGFloat = 0,
             points: VLArcPoints? = nil)
 {
  let rotationAdjustment: Double = 90
  self.startAngle = .degrees(startAngle - rotationAdjustment)
  self.endAngle = .degrees(endAngle - rotationAdjustment)
  self.thickness = thickness + strokeWidth * 2
  self.strokeWidth = strokeWidth
  self.points = points
 }

 public func path(in rect: CGRect) -> Path
 {
  let outerRadius: Double = min(rect.width, rect.height) / 2 - strokeWidth / 2
  let innerRadius: Double = outerRadius - thickness

  let startRadians: CGFloat = CGFloat(startAngle.radians)
  let cosStartRadians: CGFloat = cos(startRadians)
  let sinStartRadians: CGFloat = sin(startRadians)

  let endRadians: CGFloat = CGFloat(endAngle.radians)
  let cosEndRadians: CGFloat = cos(endRadians)
  let sinEndRadians: CGFloat = sin(endRadians)

  let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
  let innerStart: CGPoint = CGPoint(x: rect.midX + innerRadius * cosStartRadians,
                                    y: rect.midY + innerRadius * sinStartRadians)
  let outerStart: CGPoint = CGPoint(x: rect.midX + outerRadius * cosStartRadians,
                                    y: rect.midY + outerRadius * sinStartRadians)
  let innerEnd: CGPoint = CGPoint(x: rect.midX + innerRadius * cosEndRadians,
                                  y: rect.midY + innerRadius * sinEndRadians)
  let outerEnd: CGPoint = CGPoint(x: rect.midX + outerRadius * cosEndRadians,
                                  y: rect.midY + outerRadius * sinEndRadians)

  var path = Path()

  path.move(to: outerStart)
  path.addArc(center: center,
              radius: outerRadius,
              startAngle: startAngle,
              endAngle: endAngle,
              clockwise: false)
  path.addArc(center: center,
              radius: innerRadius,
              startAngle: endAngle,
              endAngle: startAngle,
              clockwise: true)
  path.closeSubpath()
  
  if let points
  {
   Task
   {
    @MainActor
    [ points, center, innerRadius, innerStart, innerEnd, outerRadius, outerStart, outerEnd ] in
    points.center = center
    points.innerRadius = innerRadius
    points.innerStart = innerStart
    points.innerEnd = innerEnd
    points.outerRadius = outerRadius
    points.outerStart = outerStart
    points.outerEnd = outerEnd
   }
  }
  
  return path
 }
}

#if DEBUG
fileprivate struct VLArcWrapper: View
{
 @State private var startAngle: Double = 0
 @State private var endAngle: Double = 90
 @State private var thickness: Double = 20
 @State private var points = VLArcPoints()
 
 var body: some View
 {
  VStack
  {
   LabeledContent("Start")
   {
    Slider(value: $startAngle, in:0...90, step: 1)
   }
   LabeledContent("End")
   {
    Slider(value: $endAngle, in:0...90, step: 1)
   }
   LabeledContent("Thickness")
   {
    Slider(value: $thickness, in:1...100, step: 1)
   }
   
   Grid()
   {
    GridRow
    {
     Text("center")
     Text("\(points.center.x)")
     Text("\(points.center.y)")
    }
    GridRow
    {
     Text("outerEnd")
     Text("\(points.outerEnd.x)")
     Text("\(points.outerEnd.y)")
    }
    GridRow
    {
     Text("outerStart")
     Text("\(points.outerStart.x)")
     Text("\(points.outerStart.y)")
    }
    GridRow
    {
     Text("innerEnd")
     Text("\(points.innerEnd.x)")
     Text("\(points.innerEnd.y)")
    }
    GridRow
    {
     Text("innerStart")
     Text("\(points.innerStart.x)")
     Text("\(points.innerStart.y)")
    }
   }
   
   ZStack
   {
    VLArc(startAngle: startAngle,
          endAngle: endAngle,
          thickness: thickness,
          points: points)
     .fill(Color.red)
    VLArc(startAngle: 90,
          endAngle: 180,
          thickness: 40)
     .fill(Color.green)
    VLArc(startAngle: 180,
          endAngle: 270,
          thickness: 60)
     .fill(Color.blue)
    VLArc(startAngle: 270,
          endAngle: 0,
          thickness: 80)
     .fill(Color.purple)
   }
  }
  .padding()
 }
}

#Preview
{
 VLArcWrapper()
}
#endif

