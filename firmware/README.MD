# **Firmware of ESP32 water sensor sender/receiver**

The firmware was developed using VSCode with the PlatformIO extension and uses its build system and library management. Upon closer inspection of the `platformio.ini` file you can see two environments: `esp32_sender` and `esp32_receiver`. This was done to combine the firmwares of both boards in this repo since they're relatively simple.

By choosing one of the environments, the build system will automatically download the respective dependencies of each firmware and the respective main file (`main_sender.cpp` and `main_receiver.cpp`) found in `src` folder.

## **Common functionality**

In both boards Over-the-air (OTA) updates was included but we only want to run OTA when required. In a normal situation the boards will initialize ESP-NOW and communicate with each other but if GPIO 0 is pressed instead the boards initialize OTA and wait for the firmware to be uploaded.

## **Sensor sender**

This board is responsible for periodically taking a water level measurement with the HC-SR04 sensor and sending it to the receiver (receiver MAC address already known to the sender) using ESP-NOW  and then going back to sleep to maximize battery duration.

## **Sensor receiver**

This board is responsible for receiving the sensor readings and showing the values in percentage in a standard 16x02 LCD.