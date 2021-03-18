#include "model.h"

Animal::Animal(const QString& type, const QString& size)
  : m_type(type)
  , m_size(size)
{}

QString Animal::type() const { return m_type; }

QString Animal::size() const { return m_size; }

AnimalModel::AnimalModel(QObject* parent)
  : QAbstractListModel(parent)
{}

void AnimalModel::add(const Animal& animal) {
  beginInsertRows(QModelIndex{}, rowCount(), rowCount());
  m_animals.append(animal);
  endInsertRows();
}

int AnimalModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_animals.count();
}

// query for fields of model... using role data
QVariant AnimalModel::data(const QModelIndex &index, int role) const {
  if (index.row() < 0 || index.row() > rowCount())
    return QVariant{};

  const Animal& animal = m_animals[index.row()];
  if (role == Roles::TypeRole)
    return animal.type();
  else if (role == Roles::SizeRole)
    return animal.size();

  return QVariant{};
}

// titles of fields [enum, title]
QHash<int, QByteArray> AnimalModel::roleNames() const {
  QHash<int, QByteArray> result;
  result[Roles::SizeRole] = "size";
  result[Roles::TypeRole] = "type";
  return result;
}
