//
//  CalendarViewModel.swift
//  HomeWork3
//
//  Created by Александр Андреев on 01.07.2024.
//

import Foundation


class CalendarViewModel {
    
    private var toDosModel:[TodoItem] = [] {
        willSet {
            setupDict()
            setupKeys()
        }
    }
    
    init(toDosModel: [TodoItem] = [
        TodoItem(
            text: "Купить продукты",
            importance: .important,
            deadline: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Завершить проект",
            importance: .ordinary,
            deadline: Calendar.current.date(byAdding: .day, value: 7, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Позвонить маме",
            importance: .important,
            deadline: nil,
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Забрать посылку",
            importance: .unimportant,
            deadline: Calendar.current.date(byAdding: .day, value: 3, to: Date()),
            isTaskDone: true,
            creationDate: Date(),
            modifiedDate: Date()
        ),
        TodoItem(
            text: "Прочитать книгу",
            importance: .ordinary,
            deadline: nil,
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Починить велосипед",
            importance: .important,
            deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Поздравить друга с днем рождения",
            importance: .important,
            deadline: Calendar.current.date(byAdding: .day, value: 5, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Посетить врача",
            importance: .ordinary,
            deadline: Calendar.current.date(byAdding: .day, value: 10, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Пойти в спортзал",
            importance: .unimportant,
            deadline: Calendar.current.date(byAdding: .day, value: 4, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Сходить в кино",
            importance: .ordinary,
            deadline: nil,
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Посетить концерт",
            importance: .important,
            deadline: Calendar.current.date(byAdding: .day, value: 15, to: Date()),
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        ),
        TodoItem(
            text: "Сделать уборку в доме",
            importance: .unimportant,
            deadline: nil,
            isTaskDone: false,
            creationDate: Date(),
            modifiedDate: nil
        )
    ]) {
        self.toDosModel = toDosModel
        setupDict()
        setupKeys()
    }
    
    public var dict: [String: [TodoItem]] = [:]
    
    public var keysArray: [String] = []
    
    public func setupKeys() {
        keysArray = []
        var deadlines = toDosModel.filter({$0.deadline != nil}).map { $0.deadline! }
        deadlines = deadlines.sorted { item1, item2 in
            return item1 < item2
        }
        
        for i in deadlines {
            keysArray.append(i.getDayMonthFormatted())
        }
        keysArray.append("Другие")
    }
    
    public func setupDict() {
        var tempDict: [String: [TodoItem]] = [:]
        
        for item in toDosModel {
            if let deadline = item.deadline?.getDayMonthFormatted() {
                if tempDict[deadline] == nil {
                    tempDict[deadline] = []
                }
                tempDict[deadline]?.append(item)
            } else {
                if tempDict["Другие"] == nil {
                    tempDict["Другие"] = []
                }
                tempDict["Другие"]?.append(item)
            }
        }
        print(tempDict.keys)
        self.dict = tempDict
    }
}
