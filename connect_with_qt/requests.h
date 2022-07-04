#ifndef REQUESTS_H
#define REQUESTS_H

#include <QDialog>

#include "utils.h"
#include "db_interaction.h"

namespace Ui {
class requests;
}

class requests : public QDialog
{
    Q_OBJECT

public:
    explicit requests(QWidget *parent = nullptr, roles role = roles::no_role);
    ~requests();

private slots:
    void on_combo_request_textActivated(const QString &arg1);

    void on_find_button_clicked();

private:
    Ui::requests *ui;
    roles current_role;
    db_interaction* interaction;

    const QVector<QString> descriptions = {"Вывести информацию о водителях, имеющих одну и ту же страховую компанию (ID страховой компании вводится)",
                                          "Вывести контактные данные водителей, у которых цвет машины является красным",
                                          "Вывести данные о автотранспорте, водители которых попали в пробку и у которых место удара либо дверь, либо багажник",
                                          "Вывести в уменьшающемся порядке производителей авто, у которых машины чаще всего попадают в ДТП с более чем (вводится число) пострадавшими",
                                          "Вывести информацию об отделениях ГИБДД по возрастанию суммы штрафов, выданных данным отделением"};
};

#endif // REQUESTS_H
