#include <Arduino.h>
#include <ArduinoOTA.h>
#include <esp_now.h>
#include <WiFi.h>
#include <Wire.h>
#include <LiquidCrystal.h>

/**
 * @brief Constants and globals
 */
LiquidCrystal lcd(16, 5, 4, 2, 14, 13);

// Structure example to receive data
// Must match the sender structure
struct sensor_data {
    float dist;
};

sensor_data myData;
bool newData = false;

bool _otaEnabled = false;
const uint8_t ota_pin = 0;

// We'll assume 1 meter for now
const uint8_t waterTankHeight = 100;

/**
 * @brief Helper function for printing a string to the LCD
 * 
 * @param str String to be printed
 * @param row Row where string is printed (0 or 1)
 */
void displayString(String str, uint8_t row = 0) {
    lcd.setCursor(0, row);
    lcd.print("                ");
    lcd.setCursor(0, row);
    lcd.print(str);
}


/**
 * @brief Initializes Over-the-air updates and waits for firmware
 */
void setupOTA()
{
    _otaEnabled = true;
    // Wifi
    WiFi.softAP("Sensor receiver");

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

    displayString("OTA INIT");
}

/**
 * @brief Called every time data is received through ESP-NOW
 * 
 * @param mac Address of device that sent data
 * @param incomingData The received data
 * @param len length of the received data in bytes
 */
void onDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {
    memcpy(&myData, incomingData, sizeof(myData));
    newData = true;
}

/**
 * @brief Initializes ESP-NOW for receiving water level data
 */
void setupESPNOW()
{
    // If the OTA pin is clicked, restarts the ESP32 and initializes OTA instead of ESP-NOW
    pinMode(ota_pin, INPUT_PULLUP);

    WiFi.mode(WIFI_STA);

    // Init ESP-NOW
    esp_err_t res1 =  esp_now_init();

    // Once ESPNow is successfully Init, we will register for recv CB to
    // get recv packer info
    esp_err_t res2 = esp_now_register_recv_cb(onDataRecv);

    if((res1 == ESP_OK) && (res2 == ESP_OK))
        displayString("ESPNOW INIT");
    else
        displayString("ESPNOW ERR");
}

void setup()
{
    Serial.begin(115200);
    lcd.begin(16,2);
    
    // Test OLED
    displayString("LCD INIT");
    delay(1000);

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
        if (digitalRead(ota_pin) == LOW)
            ESP.restart();

        if(newData) {
            int percentage = (waterTankHeight / myData.dist) * 100;
            
            Serial.println(myData.dist);
            displayString(String(int(myData.dist)));
            displayString(String(percentage) + "%");

            newData = false;
        }
    }
}
