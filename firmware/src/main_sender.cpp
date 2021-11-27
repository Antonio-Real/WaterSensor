#include <Arduino.h>
#include <ArduinoOTA.h>
#include <esp_now.h>
#include <HCSR04.h>


/**
 * @brief Constants and globals
 */
UltraSonicDistanceSensor _distSensor(25, 26);

// Structure example to send data
struct sensor_data {
    float dist;
};

// The receiver ESP32 MAC address
const uint8_t peerMacAddr[] = {0xB4, 0xE6, 0x2D, 0xB2, 0xA9, 0xD1};

bool _otaEnabled = false;
uint8_t ota_pin = 0;

/**
 * @brief Initializes Over-the-air updates and waits for firmware
 */
void setupOTA()
{
    _otaEnabled = true;
    
    // Wifi
    WiFi.softAP("Sensor sender");

    ArduinoOTA.setRebootOnSuccess(true);
    ArduinoOTA
        .onStart([]()
                 {
                     String type;
                     if (ArduinoOTA.getCommand() == U_FLASH)
                         type = "sketch";
                     else // U_SPIFFS
                         type = "filesystem";

                     // NOTE: if updating SPIFFS this would be the place to unmount SPIFFS using SPIFFS.end()
                     log_i("Start updating %s", type.c_str());
                 })
        .onEnd([]()
               { log_i("\nEnd"); })
        .onProgress([](unsigned int progress, unsigned int total)
                    { log_i("Progress: %u%%\r", (progress / (total / 100))); })
        .onError([](ota_error_t error)
                 {
                     log_i("Error[%u]: ", error);
                     if (error == OTA_AUTH_ERROR)
                         log_i("Auth Failed");
                     else if (error == OTA_BEGIN_ERROR)
                         log_i("Begin Failed");
                     else if (error == OTA_CONNECT_ERROR)
                         log_i("Connect Failed");
                     else if (error == OTA_RECEIVE_ERROR)
                         log_i("Receive Failed");
                     else if (error == OTA_END_ERROR)
                         log_i("End Failed");
                 });

    ArduinoOTA.begin();
}

/**
 * @brief Called every time data is sent through ESP-NOW
 * 
 * @param mac_addr the receiver MAC address
 * @param status the transaction status
 */
void onDataSent(const uint8_t *mac_addr, esp_now_send_status_t status)
{
    log_i("\r\nLast Packet Send Status:\t");
    log_i("%s\n", status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
}

/**
 * @brief Initializes ESP-NOW for sending water level data
 */
void setupESPNOW()
{
    pinMode(ota_pin, INPUT_PULLUP);

    // Set device as a Wi-Fi Station
    WiFi.mode(WIFI_STA);

    esp_err_t res = esp_now_init();

    log_i("%s\n", res == ESP_OK ? "ESP OK" : "ESP ERR");

    // Once ESPNow is successfully Init, we will register for Send CB to
    // get the status of Trasnmitted packet
    res = esp_now_register_send_cb(onDataSent);

    
    log_i("%s\n", res == ESP_OK ? "ESP OK" : "ESP ERR");
    // Register peer
    esp_now_peer_info_t peerInfo;
    memcpy(peerInfo.peer_addr, peerMacAddr, 6);
    peerInfo.channel = 0;
    peerInfo.encrypt = false;

    // Add peer
    res = esp_now_add_peer(&peerInfo);
    
    log_i("%s\n", res == ESP_OK ? "ESP OK" : "ESP ERR");
}

void setup()
{
    #ifdef CORE_DEBUG_LEVEL
    Serial.begin(115200);
    #endif
    // If button was pressed at startup, means we want to setup WIFI AP for OTA
    esp_reset_reason_t reason = esp_reset_reason();

    if (reason == ESP_RST_SW)
        setupOTA();
    else
        setupESPNOW();
}

void loop()
{
    if (_otaEnabled)
        ArduinoOTA.handle();

    else {
        if(digitalRead(ota_pin) == LOW)
            esp_restart();
    

        sensor_data data;
        data.dist = _distSensor.measureDistanceCm();

        esp_err_t res = esp_now_send(peerMacAddr, (uint8_t *) &data, sizeof(data));
        
        log_i("%s\n", res == ESP_OK ? "ESP OK" : "ESP ERR");
        log_i("%.2f\n", data.dist);
        
        delay(100);
    }
}




