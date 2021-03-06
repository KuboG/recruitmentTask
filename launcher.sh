# building image
sudo docker build -t turtle-app .
# give permissions to X server host
xhost local:root
# run image turttle-app in docker with name 'turtle_app_container'
# eviroment variable: "DISPLAY", "QT_X11_NO_MITSHM=1"
# shared volume: "/tmp/.X11-unix:/tmp/.X11-unix:rw"
sudo docker run -id --name turtle_app_container --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" turtle-app
echo "Waiting for the container to launch properly"
# wait for all process to run in cointainer (roscore, turtle_sim node, rosbridge_server, tf2_web_republisher and turtle_line_cleaner)
# python application with roslibpy
#sleep 15
./wait-for-it.sh 172.17.0.2:9090 -- python simple_app.py
# kill container
docker kill turtle_app_container
# remove container
docker rm turtle_app_container
# clear console
clear