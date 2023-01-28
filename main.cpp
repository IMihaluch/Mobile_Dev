#include <QApplication>
#include "LoginForm.h"

int main(int argc, char *argv[]) {
    QApplication a(argc, argv);

    LoginDialog loginDialog;
    loginDialog.show();

    return QApplication::exec();
}
