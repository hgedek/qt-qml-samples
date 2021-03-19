#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "dataobject.h"

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QList<QObject*> dataList = {
    new DataObject("Item1", "red"),
    new DataObject("Item2", "blue"),
    new DataObject("Item3", "green")
  };

  QQuickView view;
  view.setResizeMode(QQuickView::SizeRootObjectToView);
  view.setInitialProperties({{"model", QVariant::fromValue(dataList)}});
  view.setSource(QUrl("qrc:main.qml"));
  view.show();

  return app.exec();
}
