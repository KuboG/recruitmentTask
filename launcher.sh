docker build -t test .
xhost local:root
docker run -id --name ferko --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" test
python simpleApp.py