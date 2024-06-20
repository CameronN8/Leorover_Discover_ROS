#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/osboxes/catkin_ws/src/rospy_message_converter"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/osboxes/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/osboxes/catkin_ws/install/lib/python3/dist-packages:/home/osboxes/catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/osboxes/catkin_ws/build" \
    "/usr/bin/python3" \
    "/home/osboxes/catkin_ws/src/rospy_message_converter/setup.py" \
     \
    build --build-base "/home/osboxes/catkin_ws/build/rospy_message_converter" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/osboxes/catkin_ws/install" --install-scripts="/home/osboxes/catkin_ws/install/bin"
