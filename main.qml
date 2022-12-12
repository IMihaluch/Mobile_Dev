import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window
{
    width: main_row.width + 20
    height: main_row.height + 20

    minimumWidth: main_row.width + 20
    minimumHeight: main_row.height + 20

    visible: true

    title: qsTr("Lesson_2_Form")

    function print_full_info()
    {
        console.log(qsTr("\n\n****** About me ********\n"))

        console.log(qsTr("Name: ") + name_txt_fld.text)
        console.log(qsTr("Gender: ") + gender_txt_fld.text)
        console.log(qsTr("Age: ") + age_txt_fld.text)
        console.log(qsTr("Education: ") + education_txt_fld.text)
        console.log(qsTr("Hobby: ") + hobby_txt_fld.text)
        console.log(qsTr("City: ") + city_txt_fld.text)
        console.log(qsTr("More about yourself: ") + about_info_txt_fld.text)

        console.log(qsTr("\n\n****** About the desired partner ********\n"))

        console.log(qsTr("Возраст: от ") + desired_age_from_txt_fld.text +
                    qsTr(" до ") + desired_age_to_txt_fld.text)
        console.log(qsTr("Пол: ") + desired_gender_txt_fld.text)
        console.log(qsTr("Имя: ") + desired_education_txt_fld.text)
    }

    function all_txt_flds_are_filled()
    {
        for (var i = 0; i < me_clmn.children.length; i++)
        {
            if(me_clmn.children[i].text === "")
                return false
        }

        //desired_person_clmn.children[1] == label
        //desired_person_clmn.children[length - 1] == button
        for (var j = 1; j < desired_person_clmn.children.length - 1; j++)
        {
            if(desired_person_clmn.children[j].text === "")
                return false
        }

        //children[1] == age_from; chilren[2] == age_tbutton
        var diff = parseInt(desired_person_clmn.children[2].text) -
                parseInt(desired_person_clmn.children[1].text)

        if(diff < 0)
            return false


        return true
    }

    function clear_desired_column()
    {
        for (var j = 1; j < desired_person_clmn.children.length - 1; j++)
        {
            desired_person_clmn.children[j].text = ""
        }

    }

    Row
    {
        id: main_row
        anchors.centerIn: parent
        spacing: 10

        Column
        {
            id: me_clmn
            spacing: 10

            Label
            {
                text: qsTr("About me:")
            }

            TextField
            {
                id: name_txt_fld
                placeholderText: qsTr("Name")
                validator: RegExpValidator { regExp: /[A-Za-z]+/ }
            }
            TextField
            {
                id: gender_txt_fld
                placeholderText: qsTr("Gender")
                validator: RegExpValidator { regExp: /[A-Za-z]+/ }
            }
            TextField
            {
                id: age_txt_fld
                placeholderText: qsTr("Age")
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
            TextField
            {
                id: education_txt_fld
                placeholderText: qsTr("Education")
            }
            TextField
            {
                id: hobby_txt_fld
                placeholderText: qsTr("Hobby")
            }
            TextField
            {
                id: city_txt_fld
                placeholderText: qsTr("City")
            }
            TextField
            {
                id: about_info_txt_fld
                placeholderText: qsTr("More about yourself")
            }

        }

        Column
        {
            id: desired_person_clmn
            spacing: 10

            Label
            {
                text: qsTr("About the desired partner:")
            }
            TextField
            {
                id: desired_age_from_txt_fld
                placeholderText: qsTr("Age from")
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
            TextField
            {
                id: desired_age_to_txt_fld
                placeholderText: qsTr("Age up to")
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
            TextField
            {
                id: desired_gender_txt_fld
                placeholderText: qsTr("Gender")
                validator: RegExpValidator { regExp: /[A-Za-z]+/ }
            }
            TextField
            {
                id: desired_education_txt_fld
                placeholderText: qsTr("Education")
            }
            RoundButton
            {
                id: print_all_info_btn

                height: hobby_txt_fld.height + city_txt_fld.height +
                        about_info_txt_fld.height + parent.spacing * 2
                width: desired_education_txt_fld.width

                enabled: all_txt_flds_are_filled()

                palette.button: enabled? "lightgreen" : "grey"

                text: qsTr("Registration")

                onClicked:
                {
                    print_full_info()
                    clear_desired_column()
                }

            }

        }

    }
}
