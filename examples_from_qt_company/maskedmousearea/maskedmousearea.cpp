#include "maskedmousearea.h"

#include <QStyleHints>
#include <QGuiApplication>
#include <QQmlFile>

MaskedMouse::MaskedMouse(QQuickItem *parent)
    : QQuickItem(parent),
      m_pressed(false),
      m_alphaThreshold(0.0),
      m_containsMouse(false)
{
    setAcceptHoverEvents(true);
    setAcceptedMouseButtons(Qt::LeftButton);
}

void MaskedMouse::setPressed(bool pressed)
{
    if (m_pressed != pressed) {
        m_pressed = pressed;
        emit pressedChanged();
    }
}

void MaskedMouse::setContainsMouse(bool containsMouse)
{
    if (m_containsMouse != containsMouse) {
        m_containsMouse = containsMouse;
        emit containsMouseChanged();
    }
}

void MaskedMouse::setMaskSource(const QUrl &source)
{
    if (m_maskSource != source) {
        m_maskSource = source;
        m_maskImage = QImage(QQmlFile::urlToLocalFileOrQrc(source));
        emit maskSourceChanged();
    }
}

void MaskedMouse::setAlphaThreshold(qreal threshold)
{
    if (m_alphaThreshold != threshold) {
        m_alphaThreshold = threshold;
        emit alphaThresholdChanged();
    }
}

bool MaskedMouse::contains(const QPointF &point) const
{
    if (!QQuickItem::contains(point) || m_maskImage.isNull())
        return false;

    QPoint p = point.toPoint();

    if (p.x() < 0 || p.x() >= m_maskImage.width() ||
        p.y() < 0 || p.y() >= m_maskImage.height())
        return false;

    qreal r = qBound<int>(0, m_alphaThreshold * 255, 255);
    return qAlpha(m_maskImage.pixel(p)) > r;
}

void MaskedMouse::mousePressEvent(QMouseEvent *event)
{
    setPressed(true);
    m_pressPoint = event->position().toPoint();
    emit pressed();
}

void MaskedMouse::mouseReleaseEvent(QMouseEvent *event)
{
    setPressed(false);
    emit released();

    const int threshold = qApp->styleHints()->startDragDistance();
    const bool isClick = (threshold >= qAbs(event->position().toPoint().x() - m_pressPoint.x()) &&
                          threshold >= qAbs(event->position().toPoint().y() - m_pressPoint.y()));

    if (isClick)
        emit clicked();
}

void MaskedMouse::mouseUngrabEvent()
{
    setPressed(false);
    emit canceled();
}

void MaskedMouse::hoverEnterEvent(QHoverEvent *event)
{
    Q_UNUSED(event);
    setContainsMouse(true);
}

void MaskedMouse::hoverLeaveEvent(QHoverEvent *event)
{
    Q_UNUSED(event);
    setContainsMouse(false);
}
