import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window
{
    width: 320
    height: 380
    visible: true
    title: qsTr("The area of the triangle")

    function formula_of_Heron(a, b, c)
    {
        var p = (a + b + c)/2;
        return Math.sqrt(p*(p - a)*(p - b)*(p - c))
    }

    Column
    {
        anchors.fill: parent
        padding: 32
        spacing: 32

        Keys.onEnterPressed: calculate_button.clicked()
        Keys.onReturnPressed: calculate_button.clicked()

        TextField
        {
            id: a_text_field
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("a")
            validator: RegExpValidator{regExp: /^[0-9,.]+$/}
            focus: true
        }

        TextField
        {
            id: b_text_field
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("b")
            validator: RegExpValidator{regExp: /^[0-9,.]+$/}
        }

        TextField
        {
            id: c_text_field
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("c")
            validator: RegExpValidator{regExp: /^[0-9,.]+$/}
        }

        Button
        {
            id: calculate_button
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Calculate")

            onClicked:
            {
                var a = parseFloat(a_text_field.text)
                var b = parseFloat(b_text_field.text)
                var c = parseFloat(c_text_field.text)

                var result = formula_of_Heron(a, b, c)

                print(result)
                only_label.text = result


                a_text_field.clear()
                b_text_field.clear()
                c_text_field.clear()

                a_text_field.forceActiveFocus()
            }
        }

        Label
        {
            id: only_label
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
