// https://github.com/kieranb662/SwiftUI-Shapes/blob/master/Sources/Shapes/Triangles.swift
import SwiftUI

public
struct VLArc: Shape
{
 var startAngle: Angle
 var endAngle: Angle
 var thickness: CGFloat = 0
 var strokeWidth: CGFloat = 0
 @Binding var points: VLArcPoints

 public
 init(startAngle: Double,
      endAngle: Double,
      thickness: CGFloat,
      strokeWidth: CGFloat = 0,
      points: Binding<VLArcPoints>? = nil)
 {
  let rotationAdjustment: Double = 90
  self.startAngle = .degrees(startAngle - rotationAdjustment)
  self.endAngle = .degrees(endAngle - rotationAdjustment)
  self.thickness = thickness + strokeWidth * 2
  self.strokeWidth = strokeWidth
  self._points = points ?? Binding<VLArcPoints>(get: { .init() },
                                                set: { _ in })
 }

 public
 func path(in rect: CGRect) -> Path
 {
  let pts = VLArcPoints()
  pts.outerRadius = min(rect.width, rect.height) / 2 - strokeWidth / 2
  pts.innerRadius = pts.outerRadius - thickness

  let startRadians = CGFloat(startAngle.radians)
  let cosStartRadians = cos(startRadians)
  let sinStartRadians = sin(startRadians)

  let endRadians = CGFloat(endAngle.radians)
  let cosEndRadians = cos(endRadians)
  let sinEndRadians = sin(endRadians)

  pts.center = CGPoint(x: rect.midX, y: rect.midY)
  pts.innerStart = CGPoint(x: rect.midX + pts.innerRadius * cosStartRadians,
                              y: rect.midY + pts.innerRadius * sinStartRadians)
  pts.outerStart = CGPoint(x: rect.midX + pts.outerRadius * cosStartRadians,
                              y: rect.midY + pts.outerRadius * sinStartRadians)
  pts.innerEnd = CGPoint(x: rect.midX + pts.innerRadius * cosEndRadians,
                            y: rect.midY + pts.innerRadius * sinEndRadians)
  pts.outerEnd = CGPoint(x: rect.midX + pts.outerRadius * cosEndRadians,
                            y: rect.midY + pts.outerRadius * sinEndRadians)

  var path = Path()

  path.move(to: pts.outerStart)
  path.addArc(center: pts.center,
              radius: pts.outerRadius,
              startAngle: startAngle,
              endAngle: endAngle,
              clockwise: false)
  path.addArc(center: pts.center,
              radius: pts.innerRadius,
              startAngle: endAngle,
              endAngle: startAngle,
              clockwise: true)
  path.closeSubpath()
  
  Task
  {
   @MainActor in
   points = pts
  }
  
//  _points.wrappedValue = pts
  
  return path
 }
}

//#if DEBUG
//struct VLArcWrapper: View
//{
// @State private var startAngle: Double = 0
// @State private var endAngle: Double = 90
// @State private var thickness: Double = 20
// @State private var points = VLArcPoints()
// 
// var body: some View
// {
//  VStack
//  {
//   LabeledContent("Start")
//   {
//    Slider(value: $startAngle, in:0...90, step: 1)
//   }
//   LabeledContent("End")
//   {
//    Slider(value: $endAngle, in:0...90, step: 1)
//   }
//   LabeledContent("Thickness")
//   {
//    Slider(value: $thickness, in:1...100, step: 1)
//   }
//   
//   Grid()
//   {
//    GridRow
//    {
//     Text("center")
//     Text("\(points.center.x)")
//     Text("\(points.center.y)")
//    }
//    GridRow
//    {
//     Text("outerEnd")
//     Text("\(points.outerEnd.x)")
//     Text("\(points.outerEnd.y)")
//    }
//    GridRow
//    {
//     Text("outerStart")
//     Text("\(points.outerStart.x)")
//     Text("\(points.outerStart.y)")
//    }
//    GridRow
//    {
//     Text("innerEnd")
//     Text("\(points.innerEnd.x)")
//     Text("\(points.innerEnd.y)")
//    }
//    GridRow
//    {
//     Text("innerStart")
//     Text("\(points.innerStart.x)")
//     Text("\(points.innerStart.y)")
//    }
//   }
//   
//   ZStack
//   {
//    VLArc(startAngle: startAngle,
//          endAngle: endAngle,
//          thickness: thickness,
//          points: $points)
//     .fill(Color.red)
//    VLArc(startAngle: 90,
//          endAngle: 180,
//          thickness: 40)
//     .fill(Color.green)
//    VLArc(startAngle: 180,
//          endAngle: 270,
//          thickness: 60)
//     .fill(Color.blue)
//    VLArc(startAngle: 270,
//          endAngle: 0,
//          thickness: 80)
//     .fill(Color.purple)
//   }
//  }
//  .padding()
// }
//}
//
//struct VLArc_Previews: PreviewProvider
//{
// static var previews: some View
// {
//  VLArcWrapper()
// }
//}
//#endif
//
