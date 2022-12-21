mkdir $(pwd)/ntt_pro/
cd $(pwd)/ntt_pro/
git clone https://github.com/toke/docker-mosquitto.git
sudo mkdir -p $(pwd)/docker/mqtt/log $(pwd)/docker/mqtt/config $(pwd)/docker/mqtt/data
sudo touch $(pwd)/docker/mqtt/log/mosquitto.log
sudo chmod 666 $(pwd)/docker/mqtt/log/mosquitto.log
cd ..
sudo cp -a $(pwd)/docker-mosquitto/config/* $(pwd)/ntt_pro/docker/mqtt/config/
sudo docker run -itd -p 52400:1883 -p 9001:9001 -v $(pwd)/ntt_pro/docker/mqtt/config:/mqtt/config -v $(pwd)/ntt_pro/docker/mqtt/log:/mqtt/log -v $(pwd)/ntt_pro/docker/mqtt/data/:/mqtt/data/ --name ntt_p2p_service toke/mosquitto
docker ps -a
