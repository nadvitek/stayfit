import SwiftUI

struct SFTrainingItemView: View {
    
    // MARK: - Properties
    
    let trainingItem: TrainingItem
    
    // MARK: - UI
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 52, height: 52)
                .overlay {
                    trainingItem.trainingType.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(trainingItem.trainingType.rawValue)
                    .font(.semiMedium2)
                
                HStack(spacing: 0) {
                    Text(trainingItem.place)
                    
                    Spacer()
                    
                    Text(formattedDate)
                }
                .font(.semiSmall)
            }
            .padding(.trailing, 50)
        }
        .foregroundStyle(.black)
        .padding(.vertical, 8)
        .padding(.leading, 12)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.15), radius: 10)
        }
    }
    
    // MARK: - Private helpers
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: trainingItem.date)
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    SFTrainingItemView(trainingItem: .mock())
}

#endif
