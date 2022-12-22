import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "Several_figs.js" as Figures

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Lesson_5_JS")

    ComboBox{
        id: comboBox
        anchors.top: parent.top
        anchors.topMargin: height / 4
        anchors.horizontalCenter: parent.horizontalCenter
        model: [qsTr("star"), qsTr("ring"), qsTr("house"), qsTr("sandclock")]

        onCurrentIndexChanged: {
            canv.requestPaint()
        }
    }

    Canvas {
        id: canv
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: comboBox.bottom
        anchors.margins: 10

        onPaint: {

            Figures.choosing_figure(comboBox.currentIndex, getContext("2d"),
                parent.width/2, parent.height/2, parent.width/7, parent.width, parent.height)
        }
    }
}
