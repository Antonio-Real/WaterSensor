EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP32-WROOM-32D U1
U 1 1 6175880F
P 2450 5050
F 0 "U1" H 2600 6550 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 2950 6450 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 2450 3550 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 2150 5100 50  0001 C CNN
	1    2450 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 6175A61D
P 1500 3600
F 0 "R1" H 1559 3646 50  0000 L CNN
F 1 "10k" H 1559 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1500 3600 50  0001 C CNN
F 3 "~" H 1500 3600 50  0001 C CNN
	1    1500 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6175B7FB
P 1500 4050
F 0 "C1" H 1592 4096 50  0000 L CNN
F 1 "100nF" H 1592 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 1500 4050 50  0001 C CNN
F 3 "~" H 1500 4050 50  0001 C CNN
	1    1500 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3700 1500 3850
Wire Wire Line
	1500 3850 1850 3850
Wire Wire Line
	1500 3950 1500 3850
Connection ~ 1500 3850
$Comp
L power:GND #PWR02
U 1 1 6175C84A
P 1500 4300
F 0 "#PWR02" H 1500 4050 50  0001 C CNN
F 1 "GND" H 1505 4127 50  0000 C CNN
F 2 "" H 1500 4300 50  0001 C CNN
F 3 "" H 1500 4300 50  0001 C CNN
	1    1500 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4150 1500 4300
$Comp
L power:+3V3 #PWR01
U 1 1 6175CD9A
P 1500 3350
F 0 "#PWR01" H 1500 3200 50  0001 C CNN
F 1 "+3V3" H 1515 3523 50  0000 C CNN
F 2 "" H 1500 3350 50  0001 C CNN
F 3 "" H 1500 3350 50  0001 C CNN
	1    1500 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3350 1500 3450
Wire Wire Line
	2450 3450 1500 3450
Wire Wire Line
	2450 3450 2450 3650
Connection ~ 1500 3450
Wire Wire Line
	1500 3450 1500 3500
$Comp
L power:GND #PWR05
U 1 1 6175E238
P 2450 6550
F 0 "#PWR05" H 2450 6300 50  0001 C CNN
F 1 "GND" H 2455 6377 50  0000 C CNN
F 2 "" H 2450 6550 50  0001 C CNN
F 3 "" H 2450 6550 50  0001 C CNN
	1    2450 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6450 2450 6550
$Comp
L Regulator_Linear:AP2112K-3.3 U2
U 1 1 617624D3
P 3350 1700
F 0 "U2" H 3350 2042 50  0000 C CNN
F 1 "AP2112K-3.3" H 3350 1951 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3350 2025 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 3350 1800 50  0001 C CNN
	1    3350 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 61765131
P 2800 1700
F 0 "R2" V 2900 1700 50  0000 C CNN
F 1 "100k" V 3000 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 2800 1700 50  0001 C CNN
F 3 "~" H 2800 1700 50  0001 C CNN
	1    2800 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 1700 3050 1700
$Comp
L power:+BATT #PWR03
U 1 1 61766338
P 2400 1550
F 0 "#PWR03" H 2400 1400 50  0001 C CNN
F 1 "+BATT" H 2415 1723 50  0000 C CNN
F 2 "" H 2400 1550 50  0001 C CNN
F 3 "" H 2400 1550 50  0001 C CNN
	1    2400 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 6176707D
P 3800 1750
F 0 "C3" H 3892 1796 50  0000 L CNN
F 1 "1uF" H 3892 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3800 1750 50  0001 C CNN
F 3 "~" H 3800 1750 50  0001 C CNN
	1    3800 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 61767AED
P 2400 1750
F 0 "C2" H 2492 1796 50  0000 L CNN
F 1 "1uF" H 2492 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2400 1750 50  0001 C CNN
F 3 "~" H 2400 1750 50  0001 C CNN
	1    2400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1550 2400 1600
Wire Wire Line
	2400 1600 2600 1600
Wire Wire Line
	2400 1650 2400 1600
Connection ~ 2400 1600
Wire Wire Line
	2700 1700 2600 1700
Wire Wire Line
	2600 1700 2600 1600
Connection ~ 2600 1600
Wire Wire Line
	2600 1600 3050 1600
$Comp
L power:GND #PWR04
U 1 1 61768D2B
P 2400 2100
F 0 "#PWR04" H 2400 1850 50  0001 C CNN
F 1 "GND" H 2405 1927 50  0000 C CNN
F 2 "" H 2400 2100 50  0001 C CNN
F 3 "" H 2400 2100 50  0001 C CNN
	1    2400 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 617693C9
P 3350 2100
F 0 "#PWR06" H 3350 1850 50  0001 C CNN
F 1 "GND" H 3355 1927 50  0000 C CNN
F 2 "" H 3350 2100 50  0001 C CNN
F 3 "" H 3350 2100 50  0001 C CNN
	1    3350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2000 3350 2100
$Comp
L power:GND #PWR08
U 1 1 61769946
P 3800 2100
F 0 "#PWR08" H 3800 1850 50  0001 C CNN
F 1 "GND" H 3805 1927 50  0000 C CNN
F 2 "" H 3800 2100 50  0001 C CNN
F 3 "" H 3800 2100 50  0001 C CNN
	1    3800 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1850 3800 2100
Wire Wire Line
	3800 1650 3800 1600
Wire Wire Line
	3800 1600 3650 1600
$Comp
L power:+3V3 #PWR07
U 1 1 6176A549
P 3800 1550
F 0 "#PWR07" H 3800 1400 50  0001 C CNN
F 1 "+3V3" H 3815 1723 50  0000 C CNN
F 2 "" H 3800 1550 50  0001 C CNN
F 3 "" H 3800 1550 50  0001 C CNN
	1    3800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1550 3800 1600
Connection ~ 3800 1600
$Comp
L power:GND #PWR010
U 1 1 61778CD5
P 5200 2000
F 0 "#PWR010" H 5200 1750 50  0001 C CNN
F 1 "GND" H 5205 1827 50  0000 C CNN
F 2 "" H 5200 2000 50  0001 C CNN
F 3 "" H 5200 2000 50  0001 C CNN
	1    5200 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR09
U 1 1 617782B3
P 5200 1650
F 0 "#PWR09" H 5200 1500 50  0001 C CNN
F 1 "+3V3" H 5215 1823 50  0000 C CNN
F 2 "" H 5200 1650 50  0001 C CNN
F 3 "" H 5200 1650 50  0001 C CNN
	1    5200 1650
	1    0    0    -1  
$EndComp
Text GLabel 5650 1500 0    50   Input ~ 0
TRIG
Text GLabel 5650 1600 0    50   Input ~ 0
ECHO
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J3
U 1 1 6177C17D
P 8500 1900
F 0 "J3" H 8550 2217 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 8200 1600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8500 1900 50  0001 C CNN
F 3 "~" H 8500 1900 50  0001 C CNN
	1    8500 1900
	1    0    0    -1  
$EndComp
Text GLabel 1300 3850 0    50   Input ~ 0
ESP_EN
Wire Wire Line
	1300 3850 1500 3850
Text GLabel 3200 3950 2    50   Input ~ 0
TXD
Text GLabel 3200 4150 2    50   Input ~ 0
RXD
Wire Wire Line
	3050 3950 3200 3950
Wire Wire Line
	3050 4150 3200 4150
Text GLabel 3200 3850 2    50   Input ~ 0
IO0
Wire Wire Line
	3050 3850 3200 3850
Text GLabel 8950 1900 2    50   Input ~ 0
ESP_EN
Text GLabel 8200 2000 0    50   Input ~ 0
TXD
Text GLabel 8200 1800 0    50   Input ~ 0
IO0
$Comp
L power:+3V3 #PWR011
U 1 1 617812B5
P 9000 1750
F 0 "#PWR011" H 9000 1600 50  0001 C CNN
F 1 "+3V3" H 9015 1923 50  0000 C CNN
F 2 "" H 9000 1750 50  0001 C CNN
F 3 "" H 9000 1750 50  0001 C CNN
	1    9000 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 61781840
P 9000 2050
F 0 "#PWR012" H 9000 1800 50  0001 C CNN
F 1 "GND" H 9005 1877 50  0000 C CNN
F 2 "" H 9000 2050 50  0001 C CNN
F 3 "" H 9000 2050 50  0001 C CNN
	1    9000 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1600 2400 1600
Text Notes 1700 1300 0    118  ~ 0
Voltage regulator\n\n
Text Notes 4900 1650 0    118  ~ 0
Battery input +\nHC-SR04 headers\n\n\n\n
Text Notes 7850 1750 0    118  ~ 0
Programming header\n\n\n
Text Notes 1450 3450 0    118  ~ 0
ESP32\n\n\n\n
Wire Notes Line
	4400 2500 4400 500 
Wire Notes Line
	7200 2500 7200 500 
Wire Notes Line
	500  2500 11200 2500
Wire Notes Line
	3750 2500 3750 7800
Text GLabel 8200 1900 0    50   Input ~ 0
RXD
Wire Wire Line
	8950 1900 8800 1900
Wire Wire Line
	9000 1750 9000 1800
Wire Wire Line
	9000 1800 8800 1800
Wire Wire Line
	8800 2000 9000 2000
Wire Wire Line
	9000 2000 9000 2050
Wire Wire Line
	8200 1800 8300 1800
Wire Wire Line
	8200 1900 8300 1900
Wire Wire Line
	8200 2000 8300 2000
Text GLabel 2100 1600 0    50   Input ~ 0
+BATT
Wire Wire Line
	2400 1850 2400 2100
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 617FB200
P 6000 1700
F 0 "J1" H 5972 1674 50  0000 R CNN
F 1 "Conn_01x06_Male" H 5972 1583 50  0000 R CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-6-2.54_1x06_P2.54mm_Horizontal" H 6000 1700 50  0001 C CNN
F 3 "~" H 6000 1700 50  0001 C CNN
	1    6000 1700
	-1   0    0    -1  
$EndComp
Text GLabel 5650 2000 0    50   Input ~ 0
+BATT
Wire Wire Line
	5200 1900 5200 2000
Wire Wire Line
	5200 1900 5650 1900
Wire Wire Line
	5650 2000 5800 2000
Wire Wire Line
	5650 1500 5800 1500
Wire Wire Line
	5650 1600 5800 1600
Wire Wire Line
	5200 1800 5800 1800
Wire Wire Line
	5200 1650 5200 1800
Wire Wire Line
	5800 1700 5650 1700
Wire Wire Line
	5650 1700 5650 1900
Connection ~ 5650 1900
Wire Wire Line
	5650 1900 5800 1900
Text GLabel 3150 5550 2    50   Input ~ 0
TRIG
Text GLabel 3150 5650 2    50   Input ~ 0
ECHO
Wire Wire Line
	3150 5550 3050 5550
Wire Wire Line
	3050 5650 3150 5650
$Comp
L Mechanical:MountingHole H1
U 1 1 61870920
P 5200 3600
F 0 "H1" H 5300 3646 50  0000 L CNN
F 1 "MountingHole" H 5300 3555 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.1mm" H 5200 3600 50  0001 C CNN
F 3 "~" H 5200 3600 50  0001 C CNN
	1    5200 3600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 61870B90
P 5200 3850
F 0 "H2" H 5300 3896 50  0000 L CNN
F 1 "MountingHole" H 5300 3805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.1mm" H 5200 3850 50  0001 C CNN
F 3 "~" H 5200 3850 50  0001 C CNN
	1    5200 3850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 61870D51
P 5200 4100
F 0 "H3" H 5300 4146 50  0000 L CNN
F 1 "MountingHole" H 5300 4055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.1mm" H 5200 4100 50  0001 C CNN
F 3 "~" H 5200 4100 50  0001 C CNN
	1    5200 4100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 61870FA0
P 5200 4350
F 0 "H4" H 5300 4396 50  0000 L CNN
F 1 "MountingHole" H 5300 4305 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.1mm" H 5200 4350 50  0001 C CNN
F 3 "~" H 5200 4350 50  0001 C CNN
	1    5200 4350
	1    0    0    -1  
$EndComp
Text Notes 5150 3350 0    118  ~ 0
Mounting holes for PCB\n
$EndSCHEMATC
