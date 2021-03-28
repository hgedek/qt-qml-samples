#ifndef PLUGIN_H
#define PLUGIN_H

#include <QQmlEngineExtensionPlugin>
#include "textballoon.h"

class TextBalloonPlugin: public QQmlEngineExtensionPlugin {
  Q_OBJECT
  Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)
};


#endif // PLUGIN_H
