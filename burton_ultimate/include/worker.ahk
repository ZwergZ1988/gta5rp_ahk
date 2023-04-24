workItems := Array()

register_workitem(workItem) {
  global workItems
  workItems.Push(workItem)
}

work() {
  global workItems
  while (true) {
    for workItem in workItems {
      workItem()
    }
    Sleep 1000
  }
}