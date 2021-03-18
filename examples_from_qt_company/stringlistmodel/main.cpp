#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

  QGuiApplication app(argc, argv);
  QStringList list;
  list << "Item1" << "Item2" << "Item3";
  QQuickView view;
  view.setInitialProperties({{"model", QVariant::fromValue(list)}});
  view.setSource({"qrc:main.qml"});
  view.show();

  return app.exec();
}
