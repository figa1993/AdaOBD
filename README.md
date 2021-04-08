# OBD-II-CAN-telemetry
Application which reliably logs telemetry (Service 1 PIDs) parsed from the
OBD-II ISO 15765-4 CAN protocol.

@TODO ISO 15765-4 has four variants ... do all of them need to be supported?
@TODO ISO 15765-4 variant might be auto-detectable

# Dependencies
* GNAT Ada cross compiler targeting armhf-linux

# Build instructions
* Configure the environment by running ```source activate-environment.sh```
* Run build commands through IDE or from CLI