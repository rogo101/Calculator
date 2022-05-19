import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12 as Ctrls

Window {
    visible: true
    width: mCalculator.width
    height: mCalculator.height
    title: qsTr("Calculator")

    property string outputString : "Begin...";
    property bool red: true;
    property string currNumber : "";
    property string prevNumber : "";
    property int operation : -1;

    property bool decimal : false;

    property var prevNumFloat : 0;
    property var currNumFloat : 0;
    property var sol: 0;

    property bool prevOutput: false;


    Item {
        id: mCalculator
        anchors.centerIn: parent
        width: mOutput.width
        height: mOutput.height + mNumbers.height + mEquals.height

        Rectangle {
            anchors.fill: parent
            color: "beige"
            border.color: "black"
        }

        Rectangle {
            id: mOutput
            width: mNumbers.width + mOperations.width
            height: mNumbers.height / 3
            anchors.left: mCalculator.left
            anchors.top: mCalculator.top
            color: "grey"

            Text {
                text: outputString
                color: "white"
                font.bold: true
                anchors.fill: parent
                font.pixelSize: 80
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            }
        }

        Rectangle {
            id: mEquals
            width: mNumbers.width + mOperations.width
            height: mNumbers.height / 3
            anchors.left: mCalculator.left
            anchors.bottom: mCalculator.bottom
            color: "#9FFF0000"
            border.color: "black"

            Text {
                text: "="
                font.bold: true
                font.pointSize: 30
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    a.color = "#9FFF0000";
                    b.color = "#9FFF0000";
                    c.color = "#9FFF0000";
                    d.color = "#9FFF0000";
                    red = true;

                    prevNumFloat = parseFloat(prevNumber);
                    currNumFloat = parseFloat(currNumber);

                    if (operation == 0) {
                        sol = prevNumFloat + currNumFloat;
                        outputString = sol.toString();
                        currNumber = "";
                        operation = -1;
                    }
                    else if (operation == 1){
                        sol = prevNumFloat - currNumFloat;
                        outputString = sol.toString();
                        currNumber = "";
                        operation = -1;
                    }
                    else if (operation == 2){
                        sol = prevNumFloat * currNumFloat;
                        outputString = sol.toString();
                        currNumber = "";
                        operation = -1;
                    }
                    else if (operation == 3){
                        sol = prevNumFloat / currNumFloat;
                        outputString = sol.toString();
                        currNumber = "";
                        operation = -1;
                    }
                    prevOutput = true;
                }
            }

        }

        Item {
            id: mOperations
            width: 200
            height: 300
            anchors.right: mCalculator.right
            anchors.bottom: mEquals.top

            Rectangle {
                id: a
                width: 100
                height: 150
                anchors.top: parent.top
                anchors.left: parent.left
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "+"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        decimal = false;
                        if (prevOutput) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = outputString;
                            currNumber = "";
                            operation = 0;
                        }
                        else if (red) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = currNumber;
                            currNumber = "";
                            operation = 0;
                        }
                    }
                }
            }

            Rectangle {
                id: b
                width: 100
                height: 150
                anchors.top: parent.top
                anchors.right: parent.right
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "-"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        decimal = false;
                        if (prevOutput) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = outputString;
                            currNumber = "";
                            operation = 1;
                        }
                        else if (red) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = currNumber;
                            currNumber = "";
                            operation = 1;
                        }
                    }
                }
            }

            Rectangle {
                id: c
                width: 100
                height: 150
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "*"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        decimal = false;
                        if (prevOutput) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = outputString;
                            currNumber = "";
                            operation = 2;
                        }
                        else if (red) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = currNumber;
                            currNumber = "";
                            operation = 2;
                        }
                    }
                }
            }

            Rectangle {
                id: d
                width: 100
                height: 150
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "/"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        decimal = false;
                        if (prevOutput) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = outputString;
                            currNumber = "";
                            operation = 3;
                        }
                        else if (red) {
                            parent.color = "#9F0000FF";
                            red = false;
                            prevNumber = currNumber;
                            currNumber = "";
                            operation = 3;
                        }
                    }
                }
            }
        }

        Item {

            id: mNumbers
            width: 400
            height: 300
            anchors.left: mCalculator.left
            anchors.bottom: mEquals.top

            Rectangle {
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "1"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "1";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                x: 100
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "2"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "2";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                x: 200
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "3"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "3";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                y: 100
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "4"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "4";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                x: 100
                y: 100
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "5"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "5";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                x: 200
                y: 100
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "6"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "6";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                y: 200
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "7"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "7";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                x: 100
                y: 200
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "8"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "8";
                        outputString = currNumber;
                    }
                }
            }

            Rectangle {
                x: 200
                y: 200
                width: 100
                height: 100
                color: "#9FFF0000"
                border.color: "black"

                Text {
                    text: "9"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        prevOutput = false;
                        currNumber = currNumber + "9";
                        outputString = currNumber;
                    }
                }
            }

            Item {
                id: aligningBox
                width: 100
                height: 300
                anchors.right: mNumbers.right
                anchors.verticalCenter: mNumbers.verticalCenter

                Rectangle {
                    anchors.top: aligningBox.top
                    width: 100
                    height: 100
                    color: "#9FFF0000"
                    border.color: "black"

                    Text {
                        text: "0"
                        font.bold: true
                        font.pointSize: 20
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            prevOutput = false;
                            currNumber = currNumber + "0";
                            outputString = currNumber;
                        }
                    }
                }

                Rectangle {
                    anchors.verticalCenter: aligningBox.verticalCenter
                    width: 100
                    height: 100
                    color: "#9FFF0000"
                    border.color: "black"

                    Text {
                        text: "."
                        font.bold: true
                        font.pointSize: 20
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (!decimal) {
                                prevOutput = false;
                                currNumber = currNumber + ".";
                                outputString = currNumber;
                                decimal = true;
                            }
                        }
                    }
                }

                Rectangle {
                    anchors.bottom: aligningBox.bottom
                    width: 100
                    height: 100
                    color: "#9FFF0000"
                    border.color: "black"

                    Text {
                        text: "c"
                        color: "blue"
                        font.bold: true
                        font.pointSize: 20
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            a.color = "#9FFF0000";
                            b.color = "#9FFF0000";
                            c.color = "#9FFF0000";
                            d.color = "#9FFF0000";
                            red = true;
                            prevOutput = false;
                            currNumber = ""
                            outputString = currNumber;
                        }
                    }
                }
            }
        }
    }

}
