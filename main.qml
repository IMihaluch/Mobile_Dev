import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window
{
    width: 480
    height: 380
    visible: true
    title: qsTr("Area according coordinates of the vertices
of the triangle")

    function get_triangle_square(x0, y0, x1, y1, x2, y2)
    {
        return Math.abs((x1 - x0)*(y2 - y0) - (x2 - x0)*(y1 - y0))/2
    }

    Column
    {
        anchors.fill: parent
        padding: 32
        spacing: 32

        Keys.onEnterPressed: calculate_button.clicked()
        Keys.onReturnPressed: calculate_button.clicked()

        Row
        {
            TextField
            {
                id: x0_text_field
                placeholderText: qsTr("x0")
                validator: RegExpValidator{regExp: /^[0-9,-]+$/}
                focus: true
            }

            TextField
            {
                id: y0_text_field
                placeholderText: qsTr("y0")
                validator: RegExpValidator{regExp: /^[0-9,-]+$/}
                focus: true
            }


        }
        Row
        {
            TextField
            {
                id: x1_text_field
                placeholderText: qsTr("x1")
                validator: RegExpValidator{regExp: /^[0-9,-]+$/}
                focus: true
            }

            TextField
            {
                id: y1_text_field
                placeholderText: qsTr("y1")
                validator: RegExpValidator{regExp: /^[0-9,-]+$/}
                focus: true
            }

        }

        Row
        {
            TextField
            {
                id: x2_text_field
                placeholderText: qsTr("x2")
                validator: RegExpValidator{regExp: /^[0-9,-]+$/}
                focus: true
            }

            TextField
            {
                id: y2_text_field
                placeholderText: qsTr("y2")
                validator: RegExpValidator{regExp: /^[0-9,-]+$/}
                focus: true
            }

        }

        Button
        {
            id: calculate_button
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Calculate")

            onClicked:
            {
                var x0 = parseInt(x0_text_field.text)
                var y0 = parseInt(y0_text_field.text)
                var x1 = parseInt(x1_text_field.text)
                var y1 = parseInt(y1_text_field.text)
                var x2 = parseInt(x2_text_field.text)
                var y2 = parseInt(y2_text_field.text)

                var result = get_triangle_square(x0, y0, x1, y1, x2, y2)

                print(result)
                only_label.text = result


                x0_text_field.clear()
                y0_text_field.clear()
                x1_text_field.clear()
                y1_text_field.clear()
                x2_text_field.clear()
                y2_text_field.clear()

                x0_text_field.forceActiveFocus()
            }
        }

        Label
        {
            id: only_label
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
