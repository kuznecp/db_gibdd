#ifndef DB_INTERACTION_H
#define DB_INTERACTION_H

#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlQueryModel>
#include <QSqlQuery>

#include <fstream>

using namespace std;

class db_interaction
{
public:
    db_interaction();

    void set_database(string filename);
    void open_database();
    void close_database();

    QStringList get_tables(QString role);
    QSqlTableModel* get_editable_model(QObject* obj, QString table_name, int limit, int offset);
    QSqlQueryModel* get_readonly_model(QString table_name, int limit, int offset);

    QSqlQueryModel* get_request_model(int index, int input = -1);
    QSqlQueryModel* get_report_model(int index);

    const QSet<int> requests_with_input = {0, 1, 3};

private:
    QSqlDatabase database;

    QVector<QString> get_credentials(string filename);

    const QVector<QString> requests = {"SELECT pers.id, pers.last_name, pers.first_name, pers.patronymic FROM personal pers, drivers  WHERE drivers.id_profile = pers.id AND drivers.id_insurance = %1;",
                                       "SELECT pers.id, pers.address, pers.phone FROM personal pers, drivers, transport WHERE drivers.id_profile = pers.id and drivers.id_car = transport.id and transport.color = 'red';",
                                       "SELECT tr.id, tr.id_brand, tr.type, tr.year_of_release FROM transport tr, drivers dr, information inf WHERE dr.id_car = tr.id and dr.id_case = inf.id and inf.stopper = true and (inf.place_of_hit = 'Boot' or inf.place_of_hit = 'Door');",
                                       "SELECT man.name, man.address, inf.number_of_victims  FROM manufacturers man, transport tr, gibdd, information inf  WHERE inf.id_department = gibdd.id and tr.id_department = gibdd.id and  tr.id_brand = man.id and inf.number_of_victims > %1  ORDER BY inf.number_of_victims DESC;",
                                       "SELECT g.*, SUM(p.sum) FROM gibdd g, penalty p, offenses o WHERE o.id_department = g.id AND o.id = p.id_offenses GROUP BY g.id ORDER BY SUM(p.sum);"};

    const QVector<QString> reports = {"SELECT i.*, (SELECT COUNT(*) as c  FROM witnesses w WHERE i.id = w.id_case) FROM information i ORDER BY c DESC;",
                                      "SELECT p.*, (SELECT COUNT(*) as c  FROM transport t WHERE d.id_car = t.id) FROM drivers d, personal p WHERE p.id = d.id_profile ORDER BY c DESC;"};
};

#endif // DB_INTERACTION_H
