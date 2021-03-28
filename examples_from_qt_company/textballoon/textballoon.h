#ifndef TEXTBALLOON_H
#define TEXTBALLOON_H

#include <QtQuick>
#include <QQuickItem>

class TextBalloon: public QQuickPaintedItem {
  Q_OBJECT
  Q_PROPERTY(bool rightAligned READ isRightAligned WRITE setRightAligned NOTIFY rightAlignedChanged)
  QML_ELEMENT

public:
  TextBalloon(QQuickItem* item = 0);
  void paint(QPainter* painter);

  bool isRightAligned() const ;
  void setRightAligned(bool);

private:
  bool m_rightAligned;

signals:
  void rightAlignedChanged();

};

#endif // TEXTBALLOON_H
