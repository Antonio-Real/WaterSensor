#include <Arduino.h>
#include <ArduinoOTA.h>
#include <esp_now.h>
#include <HCSR04.h>

struct sensor_data {
    float dist;
};

bool _otaEnabled = false;
uint8_t ota_pin = 0;
const uint8_t peerMacAddr[] = {0xB4, 0xE6, 0x2D, 0xB2, 0xA9, 0xD1};

UltraSonicDistanceSensor _distSensor(25, 26);


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
                     ESP_LOGD(TAG, "Start updating %s", type.c_str());
                 })
        .onEnd([]()
               { ESP_LOGD(TAG, "\nEnd"); })
        .onProgress([](unsigned int progress, unsigned int total)
                    { ESP_LOGD(TAG, "Progress: %u%%\r", (progress / (total / 100))); })
        .onError([](ota_error_t error)
                 {
                     ESP_LOGD(TAG, "Error[%u]: ", error);
                     if (error == OTA_AUTH_ERROR)
                         Serial.println("Auth Failed");
                     else if (error == OTA_BEGIN_ERROR)
                         Serial.println("Begin Failed");
                     else if (error == OTA_CONNECT_ERROR)
                         Serial.println("Connect Failed");
                     else if (error == OTA_RECEIVE_ERROR)
                         Serial.println("Receive Failed");
                     else if (error == OTA_END_ERROR)
                         Serial.println("End Failed");
                 });

    ArduinoOTA.begin();
}

// This is a static func
void onDataSent(const uint8_t *mac_addr, esp_now_send_status_t status)
{
    Serial.print("\r\nLast Packet Send Status:\t");
    Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
}

void setupESPNOW()
{
    pinMode(ota_pin, INPUT_PULLUP);

    // Set device as a Wi-Fi Station
    WiFi.mode(WIFI_STA);

    esp_err_t res = esp_now_init();

    Serial.println(res == ESP_OK ? "ESP OK" : "ESP ERR");


    // Once ESPNow is successfully Init, we will register for Send CB to
    // get the status of Trasnmitted packet
    res = esp_now_register_send_cb(onDataSent);

    
    Serial.println(res == ESP_OK ? "ESP OK" : "ESP ERR");

    // Register peer
    esp_now_peer_info_t peerInfo;
    memcpy(peerInfo.peer_addr, peerMacAddr, 6);
    peerInfo.channel = 0;
    peerInfo.encrypt = false;

    // Add peer
    res = esp_now_add_peer(&peerInfo);
    
    Serial.println(res == ESP_OK ? "ESP OK" : "ESP ERR");
}

void setup()
{
    Serial.begin(115200);

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
        
        Serial.println(res == ESP_OK ? "ESP OK" : "ESP ERR");

        Serial.println(data.dist);
        
        delay(100);
    }
}




