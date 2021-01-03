import SwiftUI

struct HistoryRowView: View {
    var formatter: DateFormatter
    var contraction: Contraction
    var body: some View {
        HStack {
            Text(formatter.string(from: contraction.end))
            Text("(\(contraction.durationInSeconds)s)")
        }
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView(
            formatter: historyDateFormatter(),
            contraction: Contraction(
                id: 0,
                start: Date(),
                end: Date(),
                durationInSeconds: 0
            )
        )
    }
}
