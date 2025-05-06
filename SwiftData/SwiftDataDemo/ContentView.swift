//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Ani on 06/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var notes:[Note]
    
    @State private var isAlertShowing : Bool = false
    @State private var title : String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes){ note in
                    Text(note.title)
                        .font(.title.weight(.light))
                        .padding(.vertical,2)
                        .swipeActions {
                            Button("Delete", role: .destructive){
                                modelContext.delete(note)
                            }
                        }
                }
            }// List
            .navigationTitle("Notes ")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    Button {
                        isAlertShowing.toggle()
                        
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if notes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(notes.count) note\(notes.count > 1 ? "s" : "")")
                    }
                }
            }
            .alert("Add a New Notes", isPresented: $isAlertShowing){
                TextField("Enter new Notes", text: $title)
                Button {
                    modelContext.insert(Note(title: title))
                    title = ""
                } label:{
                    Text("Save")
                }
            }
            
            .overlay {
                if notes.isEmpty {
                    ContentUnavailableView("Notes List", systemImage:"pencil.and.list.clipboard", description: Text("No notes yet, add new note and show list of notes"))
                }
            }
        }
    }
    //Sample Data for Preview
    func previewContainer() -> ModelContainer {
        let container = try! ModelContainer(for: Note.self,configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(Note(title: "Note title 1"))
        container.mainContext.insert(Note(title: "Note title 2"))
        container.mainContext.insert(Note(title: "Note title 3"))
        container.mainContext.insert(Note(title: "Note title 4"))
        container.mainContext.insert(Note(title: "Note title 5"))
        return container
    }
}


#Preview ("Sample Data Note List"){
    ContentView().modelContainer(ContentView().previewContainer())
}

#Preview ("Empty List"){
    ContentView().modelContainer(for:Note.self, inMemory:true)
}
