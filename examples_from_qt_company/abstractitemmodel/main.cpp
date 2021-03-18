#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "model.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

  QGuiApplication app(argc, argv);

  AnimalModel model;
  model.add(Animal("Tiger", "Large"));
  model.add(Animal("Lion", "Large"));
  model.add(Animal("Wolf", "Medium"));
  model.add(Animal("Dog", "Small"));

  QQuickView view;
  view.setResizeMode(QQuickView::SizeRootObjectToView);
  view.setInitialProperties({{"model", QVariant::fromValue(&model)}});
  view.setSource(QUrl{"qrc:main.qml"});
  view.show();

  return app.exec();
}
