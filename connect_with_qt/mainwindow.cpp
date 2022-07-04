#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::enable_buttons(roles role) {
    ui->view_button->setEnabled(true);
    ui->requests_button->setEnabled(true);
    ui->reports_button->setEnabled(role == roles::officer ? true : false);
}


void MainWindow::on_driver_button_clicked()
{
    enable_buttons(roles::driver);
    ui->driver_button->setChecked(true);
    ui->officer_button->setChecked(false);
    current_role = roles::driver;
}


void MainWindow::on_officer_button_clicked()
{
    enable_buttons(roles::officer);
    ui->officer_button->setChecked(true);
    ui->driver_button->setChecked(false);
    current_role = roles::officer;
}


void MainWindow::on_requests_button_clicked()
{
    requests* req = new requests(nullptr, current_role);
    req->show();
}


void MainWindow::on_view_button_clicked()
{
    database_view* db_view = new database_view(nullptr, current_role);
    db_view->show();
}


void MainWindow::on_reports_button_clicked()
{
    reports* rep = new reports();
    rep->show();
}

