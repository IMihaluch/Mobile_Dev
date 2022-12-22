function createNewPage(parent) {
    var component = Qt.createComponent("New_page.qml")
    var newWindow = component.createObject(parent)

    if (newWindow === null)
    {
        console.log("Error creating object.")
    }
}
