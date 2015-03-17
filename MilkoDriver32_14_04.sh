#!/bin/bash

echo ”*************************************“
echo “CCID Driver Installer for udea MILKO”
echo ”*************************************“

filename=udea_pass.txt
echo "driver files are downloading..."

zenity --password | sudo -S apt-get --assume-yes install pcscd  libpcsclite1 openjdk-7-jre* icedtea-plugin libccid pcsc-tools

cd $HOME/





sudo wget http://www.akiskart.com.tr/dosyalar/akis_1.5_i386.tar $HOME/
sudo tar -xvf akis_1.5_i386.tar
sudo dpkg -i akis_1.5_i386.deb

wget https://static.turkiye.gov.tr/downloads/signlib/linux/libpkcs11wrapper.so

sudo mv libpkcs11wrapper.so /usr/lib/
sudo rm akis_1.5_i386.deb
sudo rm akis_1.5_i386.tar


sudo bash -c 'cat > /etc/libccid_Info.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>libccid.so</string>
	<key>CFBundleIdentifier</key>
	<string>org.debian.alioth.pcsclite.smartcardccid</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>CCIDCLASSDRIVER</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.4.15</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>0.0.1d1</string>
	<key>ifdCapabilities</key>
	<string>0x00000000</string>

	<!-- Possible values for ifdCapabilities bits
	1: IFD_GENERATE_HOTPLUG
	   plugging the reader calls pcscd \-\-hotplug

	Default value is 0x00000000
	-->

	<key>ifdProtocolSupport</key>
	<string>0x00000001</string>
	<key>ifdVersionNumber</key>
	<string>0x00000001</string>

	<key>ifdLogLevel</key>
	<string>0x0003</string>

	<!-- Possible values for ifdLogLevel
	1: CRITICAL  important error messages
	2: INFO      informative messages like what reader was detected
	4: COMM      a dump of all the bytes exchanged between the host and
	             the reader
	8: PERIODIC  periodic info when pcscd test if a card is present
	             (every 1/10 of a second)

	The final value is a OR of these values

	Default value: 3 (CRITICAL + INFO)
	-->

	<key>ifdDriverOptions</key>
	<string>0x0000</string>

	<!-- Possible values for ifdDriverOptions
	1: DRIVER_OPTION_CCID_EXCHANGE_AUTHORIZED
		the CCID Exchange command is allowed. You can use it through
		SCardControl(hCard, IOCTL_SMARTCARD_VENDOR_IFD_EXCHANGE, ...)

	2: DRIVER_OPTION_GEMPC_TWIN_KEY_APDU
		If set the GemPC Twin and GemPC Key readers with be configured
		so that the T=1 TPDU protocol is done by the firmware instead of
		the driver.
		This switches the reader in APDU mode and also in EMV mode so
		may not work with non EMV cards.

	4: DRIVER_OPTION_USE_BOGUS_FIRMWARE
		Some reader firmwares have bugs. By default the driver refuses
		to work with such firmware versions. If your reader is rejected
		because of the firmware (log message: "Firmware (x.y) is
		bogus!") you can:
		- upgrade your reader firmware (not all readers can do that)
		or
		- get another reader with a new/bugfree firmware
		or
		- activate this option but you will have problems depending on
		  the bug

	8: DRIVER_OPTION_RESET_ON_CLOSE
		This option may be required on Linux 2.4 so that the
		device reset if sequencial (bSeq) counter and can be
		reused if pcscd restart. Otherwise the reader needs to
		be unplugged/replugged.

	bits 4 & 5: (values 0, 16, 32, 48)
	  0: power on the card at 5V (default value)
	 16: power on the card at 3V and then, if 3V fails use 5V
	 32: power on the card at 1.8V, then 3V and then 5V
	 48: let the reader decide

	Default value: 0
	-->

	<key>ifdManufacturerString</key>
	<string>Ludovic Rousseau (ludovic.rousseau@free.fr)</string>

	<key>ifdProductString</key>
	<string>Generic CCID driver</string>

	<key>ifdVendorID</key>
	<array>
		<string>0x2A17</string>
		<string>0x072F</string>
		<string>0x09C3</string>
		<string>0x09C3</string>
		<string>0x058F</string>
		<string>0x058F</string>
		<string>0x0DC3</string>
		<string>0x0DC3</string>
		<string>0x0783</string>
		<string>0x046A</string>
		<string>0x046A</string>
		<string>0x046A</string>
		<string>0x046A</string>
		<string>0x0982</string>
		<string>0x413C</string>
		<string>0x413C</string>
		<string>0x073D</string>
		<string>0x073D</string>
		<string>0x073D</string>
		<string>0x073D</string>
		<string>0x073D</string>
		<string>0x096E</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x1059</string>
		<string>0x0B81</string>
		<string>0x0F14</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x17EF</string>
		<string>0x09BE</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x03F0</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0xA625</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x0F14</string>
		<string>0x0F14</string>
		<string>0x0F14</string>
		<string>0x0DB5</string>
		<string>0x072F</string>
		<string>0x072F</string>
		<string>0x072F</string>
		<string>0x072F</string>
		<string>0x0A89</string>
		<string>0x0A89</string>
		<string>0x0A89</string>
		<string>0x0A89</string>
		<string>0x0A89</string>
		<string>0x058F</string>
		<string>0x1FD3</string>
		<string>0x0DC3</string>
		<string>0x03EB</string>
		<string>0x03EB</string>
		<string>0x03EB</string>
		<string>0x03EB</string>
		<string>0x03EB</string>
		<string>0x03EB</string>
		<string>0x03EB</string>
		<string>0x15CF</string>
		<string>0x15CF</string>
		<string>0x04E6</string>
		<string>0x23A0</string>
		<string>0x23A0</string>
		<string>0x25DD</string>
		<string>0x25DD</string>
		<string>0x25DD</string>
		<string>0x25DD</string>
		<string>0x25DD</string>
		<string>0x1B0E</string>
		<string>0x0A5C</string>
		<string>0x0A5C</string>
		<string>0x0783</string>
		<string>0x0783</string>
		<string>0x0783</string>
		<string>0x0783</string>
		<string>0x8829</string>
		<string>0x19E7</string>
		<string>0x046A</string>
		<string>0x046A</string>
		<string>0x046A</string>
		<string>0x0982</string>
		<string>0x0982</string>
		<string>0x1DB2</string>
		<string>0x096E</string>
		<string>0x096E</string>
		<string>0x234B</string>
		<string>0x0BF8</string>
		<string>0x0BF8</string>
		<string>0x0BF8</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x08E6</string>
		<string>0x0BDA</string>
		<string>0x0BDA</string>
		<string>0x20A0</string>
		<string>0x1059</string>
		<string>0x1059</string>
		<string>0x0F1A</string>
		<string>0x19C8</string>
		<string>0x1677</string>
		<string>0x03F0</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x0B81</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x03EB</string>
		<string>0x2406</string>
		<string>0x2406</string>
		<string>0x2406</string>
		<string>0x2406</string>
		<string>0x2406</string>
		<string>0x2406</string>
		<string>0x04CC</string>
		<string>0x0483</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x17EF</string>
		<string>0x08AE</string>
		<string>0x079B</string>
		<string>0x079B</string>
		<string>0x0BDA</string>
		<string>0x1E0D</string>
		<string>0x1E0D</string>
		<string>0x1E0D</string>
		<string>0x1E0D</string>
		<string>0x04E6</string>
		<string>0x1FC9</string>
		<string>0x1A74</string>
		<string>0x1A74</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x076B</string>
		<string>0x04DA</string>
		<string>0x0471</string>
		<string>0x04B9</string>
		<string>0x21AB</string>
		<string>0x14DD</string>
		<string>0x0C4B</string>
		<string>0x0C4B</string>
		<string>0x24A2</string>
		<string>0x0973</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x04E6</string>
		<string>0x0B81</string>
		<string>0x0403</string>
		<string>0x0DF6</string>
		<string>0x04E8</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1C34</string>
		<string>0x1206</string>
		<string>0x1862</string>
		<string>0xA625</string>
		<string>0x0B0C</string>
		<string>0x0B0C</string>
		<string>0x19A6</string>
		<string>0x1CF0</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x1A44</string>
		<string>0x0E0F</string>
		<string>0x0416</string>
		<string>0x1050</string>
		<string>0x1050</string>
		<string>0x072F</string>
		<string>0x09C3</string>
		<string>0x0529</string>
		<string>0x03EB</string>
		<string>0x0A5C</string>
		<string>0x0783</string>
		<string>0x096E</string>
		<string>0x03F0</string>
		<string>0x03F0</string>
		<string>0x0D46</string>
		<string>0x0D46</string>
		<string>0x0B97</string>
		<string>0x0B97</string>
		<string>0x08C3</string>
		<string>0x08C3</string>
		<string>0x15E1</string>
		<string>0x062D</string>
	</array>

	<key>ifdProductID</key>
	<array>
		<string>0x0001</string>
		<string>0x90CC</string>
		<string>0x0013</string>
		<string>0x0014</string>
		<string>0x9520</string>
		<string>0x9540</string>
		<string>0x1004</string>
		<string>0x1102</string>
		<string>0x0006</string>
		<string>0x0005</string>
		<string>0x0010</string>
		<string>0x002D</string>
		<string>0x003E</string>
		<string>0x0007</string>
		<string>0x2100</string>
		<string>0x2101</string>
		<string>0x0007</string>
		<string>0x0008</string>
		<string>0x0B00</string>
		<string>0x0C00</string>
		<string>0x0C01</string>
		<string>0x0807</string>
		<string>0x1227</string>
		<string>0x3437</string>
		<string>0x3438</string>
		<string>0x3478</string>
		<string>0x3480</string>
		<string>0x34C0</string>
		<string>0x34C3</string>
		<string>0x4433</string>
		<string>0x5503</string>
		<string>0x5504</string>
		<string>0x8000</string>
		<string>0x8141</string>
		<string>0x0017</string>
		<string>0x0200</string>
		<string>0x003D</string>
		<string>0x3001</string>
		<string>0x3002</string>
		<string>0x3003</string>
		<string>0x3010</string>
		<string>0x1003</string>
		<string>0x0002</string>
		<string>0x3021</string>
		<string>0xA022</string>
		<string>0x0824</string>
		<string>0x5111</string>
		<string>0x5116</string>
		<string>0x511D</string>
		<string>0x5410</string>
		<string>0xE001</string>
		<string>0xE003</string>
		<string>0x0801</string>
		<string>0x1359</string>
		<string>0xACE0</string>
		<string>0x0011</string>
		<string>0x0037</string>
		<string>0x0038</string>
		<string>0x0138</string>
		<string>0x1204</string>
		<string>0x8201</string>
		<string>0x8202</string>
		<string>0x90DB</string>
		<string>0x0025</string>
		<string>0x0030</string>
		<string>0x0080</string>
		<string>0x0081</string>
		<string>0x0060</string>
		<string>0x9522</string>
		<string>0xCC1D</string>
		<string>0x0900</string>
		<string>0x6004</string>
		<string>0x6009</string>
		<string>0x600B</string>
		<string>0x6010</string>
		<string>0x6011</string>
		<string>0x6012</string>
		<string>0x6014</string>
		<string>0x0019</string>
		<string>0x001D</string>
		<string>0x511C</string>
		<string>0x0001</string>
		<string>0x0002</string>
		<string>0x1101</string>
		<string>0x1201</string>
		<string>0x2221</string>
		<string>0x2321</string>
		<string>0x3111</string>
		<string>0x1078</string>
		<string>0x5800</string>
		<string>0x5802</string>
		<string>0x0007</string>
		<string>0x0009</string>
		<string>0x0010</string>
		<string>0x0036</string>
		<string>0xCCB2</string>
		<string>0x0002</string>
		<string>0x005B</string>
		<string>0x0070</string>
		<string>0x0072</string>
		<string>0x0008</string>
		<string>0x0040</string>
		<string>0x088B</string>
		<string>0x061A</string>
		<string>0x0505</string>
		<string>0x0000</string>
		<string>0x1005</string>
		<string>0x1006</string>
		<string>0x1017</string>
		<string>0x2202</string>
		<string>0x34C1</string>
		<string>0x34C2</string>
		<string>0x34C5</string>
		<string>0x34EC</string>
		<string>0x4042</string>
		<string>0x5743</string>
		<string>0x8108</string>
		<string>0x3479</string>
		<string>0x0165</string>
		<string>0x0169</string>
		<string>0x4107</string>
		<string>0x000C</string>
		<string>0x000D</string>
		<string>0x0002</string>
		<string>0x0012</string>
		<string>0x0025</string>
		<string>0x2924</string>
		<string>0x5127</string>
		<string>0x5326</string>
		<string>0x5427</string>
		<string>0x0220</string>
		<string>0x5710</string>
		<string>0x5720</string>
		<string>0x5721</string>
		<string>0x5810</string>
		<string>0x9324</string>
		<string>0x6300</string>
		<string>0x6301</string>
		<string>0x6302</string>
		<string>0x6403</string>
		<string>0x6404</string>
		<string>0x6407</string>
		<string>0x5072</string>
		<string>0x0007</string>
		<string>0x3014</string>
		<string>0x301D</string>
		<string>0x4189</string>
		<string>0x41A9</string>
		<string>0x4289</string>
		<string>0x4389</string>
		<string>0x43A9</string>
		<string>0x6007</string>
		<string>0x0BDF</string>
		<string>0x0026</string>
		<string>0x0052</string>
		<string>0x0161</string>
		<string>0x0013</string>
		<string>0x0033</string>
		<string>0x1023</string>
		<string>0x8033</string>
		<string>0x511A</string>
		<string>0x010B</string>
		<string>0xB111</string>
		<string>0x6354</string>
		<string>0x1021</string>
		<string>0x4321</string>
		<string>0x5321</string>
		<string>0x6321</string>
		<string>0x3621</string>
		<string>0x3821</string>
		<string>0x5121</string>
		<string>0x5125</string>
		<string>0x6622</string>
		<string>0xA021</string>
		<string>0x117A</string>
		<string>0x040F</string>
		<string>0x1400</string>
		<string>0x0010</string>
		<string>0x1006</string>
		<string>0x0504</string>
		<string>0x9102</string>
		<string>0x0102</string>
		<string>0x0003</string>
		<string>0x5113</string>
		<string>0x5115</string>
		<string>0x5117</string>
		<string>0x5119</string>
		<string>0x511F</string>
		<string>0x5120</string>
		<string>0x5121</string>
		<string>0x512B</string>
		<string>0x512C</string>
		<string>0x5291</string>
		<string>0x5293</string>
		<string>0x8007</string>
		<string>0xC587</string>
		<string>0x800A</string>
		<string>0x0007</string>
		<string>0x7113</string>
		<string>0x7121</string>
		<string>0x7123</string>
		<string>0x7124</string>
		<string>0x7136</string>
		<string>0x7138</string>
		<string>0x7141</string>
		<string>0x8141</string>
		<string>0x91B1</string>
		<string>0xA1A1</string>
		<string>0x2105</string>
		<string>0x0000</string>
		<string>0x0810</string>
		<string>0x0050</string>
		<string>0x0052</string>
		<string>0x0009</string>
		<string>0x0001</string>
		<string>0x0001</string>
		<string>0x0101</string>
		<string>0x0112</string>
		<string>0x0115</string>
		<string>0x0117</string>
		<string>0x0119</string>
		<string>0x0120</string>
		<string>0x0122</string>
		<string>0x0855</string>
		<string>0x0865</string>
		<string>0x0870</string>
		<string>0x0920</string>
		<string>0x0004</string>
		<string>0x3815</string>
		<string>0x0111</string>
		<string>0x0112</string>
		<string>0x2200</string>
		<string>0x0008</string>
		<string>0x0620</string>
		<string>0x6016</string>
		<string>0x5801</string>
		<string>0x0003</string>
		<string>0x0503</string>
		<string>0x0036</string>
		<string>0x1024</string>
		<string>0x4000</string>
		<string>0x4001</string>
		<string>0x7762</string>
		<string>0x7772</string>
		<string>0x0401</string>
		<string>0x0402</string>
		<string>0x2007</string>
		<string>0x0001</string>
	</array>

	<key>ifdFriendlyName</key>
	<array>
		<string>udea MILKO</string>
		<string>ACS ACR 38U-CCID</string>
		<string>ActivIdentity USB Reader V3</string>
		<string>ActivIdentity Activkey_Sim</string>
		<string>Alcor Micro AU9520</string>
		<string>Alcor Micro AU9540</string>
		<string>Athena ASE IIIe</string>
		<string>Athena ASEDrive IIIe KB</string>
		<string>C3PO LTC31 v2</string>
		<string>Cherry GmbH SmartBoard XX33</string>
		<string>Cherry GmbH SmartBoard XX44</string>
		<string>Cherry GmbH SmartTerminal XX44</string>
		<string>Cherry GmbH SmartTerminal ST-2xxx</string>
		<string>COVADIS ALYA</string>
		<string>Dell keyboard SK-3106</string>
		<string>Dell Dell Smart Card Reader Keyboard</string>
		<string>Eutron CryptoIdentity CCID</string>
		<string>Eutron CryptoIdentity CCID</string>
		<string>Eutron Digipass 860</string>
		<string>Eutron Card Reader</string>
		<string>Eutron Smart Pocket</string>
		<string>Feitian ePass2003</string>
		<string>Gemalto PDT</string>
		<string>Gemalto PC Twin Reader</string>
		<string>Gemalto USB Shell Token V2</string>
		<string>Gemalto USB GemPCPinpad SmartCard Reader</string>
		<string>Gemalto GemCore SIM Pro Smart Card Reader</string>
		<string>Gemalto Ezio Shield</string>
		<string>Gemalto EZIO CB+</string>
		<string>Gemalto Gemplus USB SmartCard Reader 433-Swap</string>
		<string>Gemalto Prox Dual USB PC LinkReader</string>
		<string>Gemalto Prox SU USB PC LinkReader</string>
		<string>Gemalto Smart Enterprise Guardian Secure USB Device</string>
		<string>Gemalto IDBridge K3000</string>
		<string>Giesecke &amp; Devrient GmbH StarSign Crypto USB Token</string>
		<string>id3 Semiconductors CL1356T</string>
		<string>Ingenico WITEO USB Smart Card Reader</string>
		<string>KOBIL KAAN Base</string>
		<string>KOBIL KAAN Advanced</string>
		<string>KOBIL KAAN SIM III</string>
		<string>KOBIL EMV CAP - SecOVID Reader III</string>
		<string>Lenovo Integrated Smart Card Reader</string>
		<string>MYSMART MySMART PAD V2.0</string>
		<string>OMNIKEY AG CardMan 3121</string>
		<string>Precise Biometrics Sense MC</string>
		<string>SCM Microsystems Inc. HP USB Smartcard Reader</string>
		<string>SCM Microsystems Inc. SCR 331-DI</string>
		<string>SCM Microsystems Inc. SCR 3310</string>
		<string>SCM Microsystems Inc. SCR 3311</string>
		<string>SCM Microsystems Inc. SCR 355</string>
		<string>SCM Microsystems Inc. SCR 331</string>
		<string>SCM Microsystems Inc. SPR 532</string>
		<string>TianYu CCID Key TianYu CCID SmartKey</string>
		<string>Verisign Secure Storage Token</string>
		<string>Verisign Secure Token</string>
		<string>XIRING XI-SIGN USB V2</string>
		<string>XIRING MyLeo</string>
		<string>XIRING Leo v2</string>
		<string>Access IS ePassport Reader</string>
		<string>ACS ACR101 ICC Reader</string>
		<string>ACS APG8201 PINhandy 1</string>
		<string>ACS APG8201 USB Reader</string>
		<string>ACS CryptoMate64</string>
		<string>Aktiv Rutoken lite</string>
		<string>Aktiv Rutoken ECP</string>
		<string>Aktiv PINPad Ex</string>
		<string>Aktiv PINPad In</string>
		<string>Aktiv Co., ProgramPark Rutoken Magistra</string>
		<string>Alcor Micro AU9522</string>
		<string>ASK-RFID CPL108</string>
		<string>Athena IDProtect Key v2</string>
		<string>ATMEL AT91SO CCID Smart Card Reader</string>
		<string>ATMEL AT98SC032CT-USB</string>
		<string>ATMEL AT91SC192192CT-USB ICCD reader</string>
		<string>ATMEL AT90SCR100</string>
		<string>ATMEL AT90SCR050</string>
		<string>ATMEL VaultIC420 Smart Object</string>
		<string>ATMEL VaultIC440</string>
		<string>Avtor SecureToken</string>
		<string>Avtor SC Reader 371</string>
		<string>Axalto Reflex USB v3</string>
		<string>BIFIT USB-Token iBank2key</string>
		<string>BIFIT iBank2Key</string>
		<string>Bit4id miniLector-s</string>
		<string>Bit4id cryptokey</string>
		<string>Bit4id iAM</string>
		<string>Bit4id CKey4</string>
		<string>Bit4id miniLector</string>
		<string>BLUTRONICS BLUDRIVE II CCID</string>
		<string>Broadcom Corp 5880</string>
		<string>Broadcom Corp 5880</string>
		<string>C3PO TLTC2USB</string>
		<string>C3PO KBR36</string>
		<string>C3PO LTC32</string>
		<string>C3PO LTC36</string>
		<string>CCB eSafeLD</string>
		<string>charismathics plug'n'crypt CCID token</string>
		<string>Cherry GmbH SmartBoard XX1X</string>
		<string>Cherry GmbH SmartTerminal XX1X</string>
		<string>Cherry GmbH SmartTerminal ST-1275</string>
		<string>COVADIS VEGA-ALPHA</string>
		<string>COVADIS Auriga</string>
		<string>DUALi DRAGON NFC READER</string>
		<string>Feitian bR301</string>
		<string>Feitian Technologies FT SCR310</string>
		<string>Free Software Initiative of Japan Gnuk</string>
		<string>Fujitsu Siemens Computers SmartCard Keyboard USB 2A</string>
		<string>Fujitsu Siemens Computers SmartCard USB 2A</string>
		<string>FujitsuTechnologySolutions GmbH SmartCase KB SCR eSIG</string>
		<string>Gemalto Gem e-Seal Pro USB Token</string>
		<string>Gemalto ING Shield Pro SC</string>
		<string>Gemalto Ezio Shield</string>
		<string>Gemalto Ezio Shield Branch Reader</string>
		<string>Gemalto GemPC Express</string>
		<string>Gemalto SA .NET Dual</string>
		<string>Gemalto Hybrid Smartcard Reader</string>
		<string>Gemalto Smart Enterprise Guardian Secure USB Device</string>
		<string>Gemplus GemCore POS Pro Smart Card Reader</string>
		<string>Generic Smart Card Reader Interface</string>
		<string>Generic USB2.0-CRW</string>
		<string>German Privacy Foundation Crypto Stick v1.2</string>
		<string>Giesecke &amp; Devrient GmbH Star Sign Card Token 350 (ICCD)</string>
		<string>Giesecke &amp; Devrient GmbH Star Sign Card Token 550 (ICCD)</string>
		<string>GIS Ltd SmartMouse USB</string>
		<string>GoldKey Security PIV Token</string>
		<string>HDZB uKeyCI800-K18</string>
		<string>Hewlett Packard MFP Smart Card Reader</string>
		<string>HID OMNIKEY 5127 CK</string>
		<string>HID OMNIKEY 5326 DFR</string>
		<string>HID OMNIKEY 5427 CK</string>
		<string>id3 Semiconductors CL1356A_HID</string>
		<string>Identive CLOUD 2700 F Smart Card Reader</string>
		<string>Identive Identive CLOUD 4500 F Dual Interface Reader</string>
		<string>Identive Identive CLOUD 4510 F Contactless + SAM Reader</string>
		<string>Identive CLOUD 2700 R Smart Card Reader</string>
		<string>IIT E.Key Almaz-1C</string>
		<string>Inside Secure VaultIC 420 Smart Object</string>
		<string>Inside Secure VaultIC 440 Smart Object</string>
		<string>Inside Secure VaultIC 460 Smart Object</string>
		<string>Inside Secure AT90SCR100</string>
		<string>Inside Secure AT90SCR050</string>
		<string>Inside Secure AT90SCR200</string>
		<string>KEBTechnology KONA USB SmartCard</string>
		<string>Kingtrust Multi-Reader</string>
		<string>KOBIL Systems Smart Token</string>
		<string>KOBIL Systems IDToken</string>
		<string>KOBIL Systems mIDentity 4smart</string>
		<string>KOBIL Systems mIDentity 4smart AES</string>
		<string>KOBIL Systems mIDentity visual</string>
		<string>KOBIL Systems mIDentity fullsize</string>
		<string>KOBIL Systems mIDentity fullsize AES</string>
		<string>Lenovo Lenovo USB Smartcard Keyboard</string>
		<string>Macally NFC CCID eNetPad</string>
		<string>Morpho MSO350/MSO351 Fingerprint Sensor &amp; SmartCard Reader</string>
		<string>Morpho MSO1350 Fingerprint Sensor &amp; SmartCard Reader</string>
		<string>MSI StarReader SMART</string>
		<string>Neowave Weneo</string>
		<string>Neowave Weneo</string>
		<string>Neowave Weneo</string>
		<string>Neowave Weneo</string>
		<string>NTT Communications Corp. SCR3310-NTTCom USB SmartCard Reader</string>
		<string>NXP PR533</string>
		<string>OBERTHUR TECHNOLOGIES ID-ONE TOKEN SLIM v2</string>
		<string>OCS ID-One Cosmo Card USB Smart Chip Device</string>
		<string>OMNIKEY CardMan 1021</string>
		<string>OMNIKEY CardMan 4321</string>
		<string>OMNIKEY CardMan 5321</string>
		<string>OMNIKEY 6321 CLi USB</string>
		<string>OMNIKEY AG CardMan 3621</string>
		<string>OMNIKEY AG CardMan 3821</string>
		<string>OMNIKEY AG CardMan 5121</string>
		<string>OMNIKEY AG CardMan 5125</string>
		<string>OMNIKEY AG CardMan 6121</string>
		<string>OMNIKEY AG Smart Card Reader</string>
		<string>Panasonic Panasonic USB Smart Card Reader 7A-Smart</string>
		<string>Philips Semiconductors JCOP41V221</string>
		<string>Philips Semiconductors SmartMX Sample</string>
		<string>Planeta RC700-NFC CCID</string>
		<string>Raritan D2CIM-DVUSB VM/CCID</string>
		<string>REINER SCT cyberJack go</string>
		<string>REINER SCT cyberJack RFID basis</string>
		<string>SafeTech SafeTouch</string>
		<string>SchlumbergerSema SchlumbergerSema Cyberflex Access</string>
		<string>SCM Microsystems Inc. SCR33x USB Smart Card Reader</string>
		<string>SCM Microsystems Inc. SCR 335</string>
		<string>SCM Microsystems Inc. SCR3320 - Smart Card Reader</string>
		<string>SCM Microsystems Inc. SCR3340 - ExpressCard54 Smart Card Reader</string>
		<string>SCM Microsystems Inc. SCR3310 USB Smart Card Reader</string>
		<string>SCM Microsystems Inc. SCR331-DI USB Smart Card Reader</string>
		<string>SCM Microsystems Inc. SDI010 Smart Card Reader</string>
		<string>SCM Microsystems Inc. SDI011 Contactless Reader</string>
		<string>SCM Microsystems Inc. SDI011 Contactless Reader</string>
		<string>SCM Microsystems Inc. SCL010 Contactless Reader</string>
		<string>SCM Microsystems Inc. SCL01x Contactless Reader</string>
		<string>Secure Device Solutions DOMINO-Key TWIN</string>
		<string>SecuTech SecuTech Token</string>
		<string>Sitecom Sitecom USB simcard reader MD-010</string>
		<string>Softforum Co., Ltd XecureHSM</string>
		<string>SpringCard CrazyWriter</string>
		<string>SpringCard CSB6 Basic</string>
		<string>SpringCard CSB6 Secure</string>
		<string>SpringCard CSB6 Ultimate</string>
		<string>SpringCard EasyFinger Standard</string>
		<string>SpringCard EasyFinger Ultimate</string>
		<string>SpringCard Prox Roll</string>
		<string>SpringCard NFC Roll</string>
		<string>SpringCard H663 Series</string>
		<string>SpringCard H512 Series</string>
		<string>SYNNIX STD200</string>
		<string>Teridian Semiconductors TSC12xxFV.09</string>
		<string>Tianyu Smart Card Reader</string>
		<string>Todos Argos Mini II</string>
		<string>Todos CX00</string>
		<string>ubisys 13.56MHz RFID (CCID)</string>
		<string>Validy TokenA sl vt</string>
		<string>VASCO DP905v1.1</string>
		<string>VASCO DIGIPASS KEY 101</string>
		<string>VASCO DIGIPASS KEY 860</string>
		<string>VASCO DIGIPASS KEY 200</string>
		<string>VASCO DIGIPASS KEY 860</string>
		<string>VASCO DIGIPASS KEY 200</string>
		<string>VASCO DIGIPASS KEY 202</string>
		<string>VASCO DIGIPASS KEY 202</string>
		<string>VASCO DP855</string>
		<string>VASCO DP865</string>
		<string>VASCO DIGIPASS 870</string>
		<string>VASCO DIGIPASS 920</string>
		<string>VMware Virtual USB CCID</string>
		<string>Winbond CCID SmartCard Controller</string>
		<string>Yubico Yubikey NEO OTP+CCID</string>
		<string>Yubico Yubikey NEO CCID</string>
		<string>ACS ACR122U PICC Interface</string>
		<string>ActivCard ActivCard USB Reader V2</string>
		<string>Aladdin eToken PRO USB 72K Java</string>
		<string>ATMEL VaultIC460</string>
		<string>Broadcom Corp 5880</string>
		<string>C3PO LTC3x USB</string>
		<string>Feitian SCR301</string>
		<string>Hewlett-Packard Company HP USB CCID Smartcard Keyboard</string>
		<string>Hewlett-Packard Company HP USB Smart Card Keyboard</string>
		<string>KOBIL Systems mIDentity M</string>
		<string>KOBIL Systems mIDentity XL</string>
		<string>O2 Micro Oz776</string>
		<string>O2 Micro Oz776</string>
		<string>Precise Biometrics Precise 250 MC</string>
		<string>Precise Biometrics Precise 200 MC</string>
		<string>RSA RSA SecurID (R) Authenticator</string>
		<string>THRC Smart Card Reader</string>
	</array>

	<key>Copyright</key>
	<string>This driver is protected by terms of the GNU Lesser General Public License version 2.1, or (at your option) any later version.</string>

</dict>
</plist>

EOF'

sudo service pcscd restart 
zenity --info --text="Yükleme Tamamlandı"


