import SwiftUI
//
//struct TabBar: View {
//    @State private var selectedIndex: Int = 0
//    @State private var backgroundGradient: [Color] = [.blue, .green] // Исходный градиентный цвет объекта в фоне
//
//    private let tabs = ["home", "search", "wallet", "profile"]
//
//    private func itemWidth(availableWidth: CGFloat) -> CGFloat {
//        availableWidth / CGFloat(tabs.count)
//    }
//
//    private func xOffsetForSelection(availableWidth: CGFloat) -> CGFloat {
//        itemWidth(availableWidth: availableWidth) * CGFloat(selectedIndex)
//    }
//
//    var body: some View {
//        GeometryReader { proxy in
//            ZStack(alignment: .leading) {
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(LinearGradient(gradient: Gradient(colors: backgroundGradient), startPoint: .leading, endPoint: .trailing))
//                    .frame(
//                        width: itemWidth(availableWidth: proxy.size.width),
//                        height: proxy.size.height
//                    )
//                    .offset(x: xOffsetForSelection(availableWidth: proxy.size.width))
//                    .padding(2)
//                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
//
//                HStack(spacing: 0) {
//                    ForEach(Array(tabs.enumerated()), id: \.element) { i, tab in
//                        Image(tab)
//                            .resizable()
//                            .frame(width: 30, height: 30)
////                            .font(.system(size: 14))
//                            .frame(maxWidth: .infinity)
//                            .foregroundColor(.white)
//                            .onTapGesture {
//                                withAnimation(
//                                    Animation.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)
//                                ) {
//                                    selectedIndex = i
//                                    // Обновляем градиентный цвет в зависимости от выбранной вкладки
//                                    switch i {
//                                    case 0:
//                                        NavigationLink {
//                                            AccountView()
//                                        } label: {
//                                            
//                                        }
//                                        backgroundGradient = [Color(hex: "2C3E50"), Color(hex: "34495E")]
//                                    case 1:
//                                        AccountView()
//                                        backgroundGradient = [Color(hex: "4E6640"), Color(hex: "5D735A")]
//                                    case 2:
//                                        backgroundGradient = [Color(hex: "7D3C33"), Color(hex: "944C45")]
//                                    case 3:
//                                        backgroundGradient = [Color(hex: "634D70"), Color(hex: "785C7F")]
//                                    default:
//                                        backgroundGradient = [Color(hex: "2C3E50"), Color(hex: "34495E")]
//                                    }
//                                }
//                            }
//                    }
//                }
//            }
//            .background(Color.mainColor.cornerRadius(30))
//        }
//        .padding(.horizontal)
//        .frame(height: 40)
//    }
//}
//
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
//
//extension Color {
//    init(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        var rgb: UInt64 = 0
//
//        Scanner(string: hexSanitized).scanHexInt64(&rgb)
//
//        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
//        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = Double(rgb & 0x0000FF) / 255.0
//
//        self.init(red: red, green: green, blue: blue)
//    }
//}

import SwiftUI

struct UserProfileView: View {
    @State private var profileColor = Color.blue
    @State private var isEditing = false

    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .padding(.top, 50)

            Text("John Doe")
                .font(.title)
                .padding()

            Button(action: {
                withAnimation {
                    self.profileColor = self.randomColor()
                }
            }) {
                Text("Change Color")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .background(profileColor)
        .edgesIgnoringSafeArea(.all)
    }

    private func randomColor() -> Color {
        let randomRed = Double.random(in: 0...1)
        let randomGreen = Double.random(in: 0...1)
        let randomBlue = Double.random(in: 0...1)
        return Color(red: randomRed, green: randomGreen, blue: randomBlue)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
