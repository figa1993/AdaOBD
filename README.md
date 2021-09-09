# OBD-II-CAN-telemetry
Application which reliably logs telemetry (Service 1 PIDs) parsed from the
OBD-II ISO 15765-4 CAN protocol.

@TODO ISO 15765-4 has four variants ... do all of them need to be supported?
@TODO ISO 15765-4 variant might be auto-detectable

@TODO ISO 15765-2 defines a network and transfer protocol on top of CAN. Determine how this interacts with OBD-II messaging protocol.

# Dependencies

## Target

### Hardware
* Raspberry PI Model 4B 
* Seeed Studio CAN-FD shield (https://www.seeedstudio.com/CAN-BUS-FD-HAT-for-Raspberry-Pi-p-4742.html)

### Software/Environment
* Raspbian OS (@TODO Generalize this to embedded linux requirements)
* Static IP??
* can-utils

## Host Software
* GNAT Ada cross compiler targeting armhf-linux

# Build instructions
* Configure the environment by running ```source activate-environment.sh```
* Run build commands through IDE or from CLI

# Execution instructions

## Loopback testing
* Configure the Linux SocketCAN devices per @TODO
```
sudo ip link set can0 up type can bitrate 1000000   dbitrate 8000000 restart-ms 1000 berr-reporting on fd on
sudo ip link set can1 up type can bitrate 1000000   dbitrate 8000000 restart-ms 1000 berr-reporting on fd on
```

# References
* https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjN0L_ggLbwAhURG80KHXTxDVcQFjAAegQICBAD&url=https%3A%2F%2Fsourceforge.net%2Fp%2Frusefi%2Ftickets%2F_discuss%2Fthread%2F65c5390c%2F5610%2Fattachment%2Fiso_15765-4.pdf&usg=AOvVaw0TRfzIUDSiV9pwCwo9uyl1
* https://wiki.seeedstudio.com/2-Channel-CAN-BUS-FD-Shield-for-Raspberry-Pi/