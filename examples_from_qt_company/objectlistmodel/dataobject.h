#ifndef DATAOBJECT_H
#define DATAOBJECT_H

#include <QObject>

class DataObject: public QObject {
  Q_OBJECT

  Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
  Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)

public:
  DataObject(QObject* parent = nullptr): QObject(parent) {}
  DataObject(const QString& name, QString const& color, QObject* parent = nullptr)
    : QObject(parent)
    , m_name(name)
    , m_color(color)
  {}

  QString name() const { return m_name; }
  void setName(const QString& name) { if (m_name == name) return; m_name = name; emit nameChanged(); }

  QString color() const { return m_color; }
  void setColor(const QString& color) { if (m_color == color) return; m_color = color; emit colorChanged(); }

signals:
  void nameChanged();
  void colorChanged();

private:
  QString m_name;
  QString m_color;
};


#endif // DATAOBJECT_H
