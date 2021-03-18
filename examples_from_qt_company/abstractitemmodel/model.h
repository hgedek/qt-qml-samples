#ifndef MODEL_H
#define MODEL_H

#include <QAbstractItemModel>
#include <QStringList>

class Animal {
public:
  Animal(const QString& type, const QString& size);

  QString type() const;
  QString size() const;

private:
  QString m_type;
  QString m_size;
};


class AnimalModel: public QAbstractListModel {
  Q_OBJECT
public:
  enum Roles {
    TypeRole = Qt::UserRole + 1,
    SizeRole
  };

  AnimalModel(QObject* parent = nullptr);

  void add(const Animal& animal);

  int rowCount(const QModelIndex& parent = QModelIndex()) const;

  QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;

protected:
  QHash<int, QByteArray> roleNames() const;

private:
  QList<Animal> m_animals;
};


#endif // MODEL_H
