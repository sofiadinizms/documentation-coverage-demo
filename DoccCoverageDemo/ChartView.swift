//
//  ContentView.swift
//  DoccCoverageDemo
//
//  Created by Sofia Diniz Melo Santos on 04/04/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    @State private var docItems: [DocItem] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Documentation Coverage")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            if docItems.isEmpty {
                ProgressView("Loading...")
            } else {
                Chart {
                    ForEach(docItems) { item in
                        BarMark(
                            x: .value("Title", item.title),
                            y: .value("Count", item.kindSpecificData.associatedValue.documented)
                        )
                        .foregroundStyle(by: .value("Metric", "Documented"))
                        
                        BarMark(
                            x: .value("Title", item.title),
                            y: .value("Count", item.kindSpecificData.associatedValue.total)
                        )
                        .foregroundStyle(by: .value("Metric", "Total"))
                    }
                }
                .frame(height: 300)
                .chartLegend(.visible)
            }
        }
        .padding()
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
            print("Failed to find items.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([DocItem].self, from: data)
            docItems = decoded
        } catch {
            print("Failed to decode docItems: \(error)")
        }
    }
}

#Preview {
    ChartView()
}
