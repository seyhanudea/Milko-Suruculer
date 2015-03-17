#!/bin/bash

echo ”*************************************“
echo “CCID Driver Installer for udea MILKO”
echo ”*************************************“

filename=udea_pass.txt
echo "driver files are downloading..."

zenity --password | sudo -S apt-get --assume-yes install libccid pcscd  libpcsclite1 openjdk-7-jre* icedtea-plugin pcsc-tools autoconf automake m4 libtool libpcsclite-dev libusb-1.0.0 libudev-dev libusb-dev libusb-1.0.0 libusb-1.0.0-dev opensc openct

cd $HOME/


wget --no-check-certificate https://launchpad.net/ubuntu/+archive/primary/+files/ccid_1.4.5.orig.tar.gz
tar -xzvf ccid_1.4.5.orig.tar.gz

echo "supported readers.txt modifiye ediliyor..."
sudo bash -c 'cat > $HOME/ccid-1.4.5/readers/supported_readers.txt << EOF
# list of readers supported by the CCID driver
# $Id: supported_readers.txt 5925 2011-08-31 15:46:13Z rousseau $

# Gemalto (ex Gemplus)
0x08E6:0x2202:Gemalto Gem e-Seal Pro
0x08E6:0x3437:Gemalto GemPC Twin
0x08E6:0x3438:Gemalto GemPC Key
0x08E6:0x3478:Gemalto GemPC Pinpad
0x08E6:0x3479:Gemalto GemCore POS Pro
0x08E6:0x3480:Gemalto GemCore SIM Pro
0x08E6:0x34C0:Gemalto Ezio Shield
0x08E6:0x34C1:Gemalto Ezio Shield Secure Channel
0x08E6:0x34C2:Gemalto Ezio Shield PinPad
0x08E6:0x34C3:Gemalto Ezio CB+
0x08E6:0x34C4:Gemalto Ezio Generic
0x08E6:0x34EC:Gemalto GemPC Express
0x08E6:0x4042:Gemalto SA .NET Dual
0x08E6:0x4433:Gemalto GemPC433 SL
0x08E6:0x5503:Gemalto Prox-DU
0x08E6:0x5504:Gemalto Prox-SU
0x08E6:0x5743:Gemalto Hybrid Smartcard Reader
0x08E6:0x8000:Gemalto Smart Enterprise Guardian
0x08E6:0x8108:Gemalto Smart Guardian
# Verisign branded
0x08E6:0xACE0:Verisign Secure Token
0x08E6:0x1359:VeriSign Secure Storage Token
0x08E6:0x1227:Gemalto PDT
0x08E6:0x8108:Gemalto SG CCID

# SCM Microsystems
0x04E6:0x5111:SCM SCR 331-DI
0x04E6:0x5113:SCM SCR 333
0x04E6:0x5115:SCM SCR 335
0x04E6:0x5116:SCM SCR 3310
0x04E6:0x5117:SCM SCR 3320
0x04E6:0x5119:SCM SCR 3340 ExpressCard54
0x04E6:0x511A:SCM SCR 3310 NTTCom
0x04E6:0x511C:Axalto Reflex USB v3
0x04E6:0x511D:SCM SCR 3311
0x04E6:0x511F:SCM SCR 3310
0x04E6:0x5120:SCM SCR 331-DI NTTCom
0x04E6:0x5121:SCM SDI 010
0x04E6:0x5293:SCM SCL011
0x04E6:0x5410:SCM SCR 355
0x04E6:0xE001:SCM SCR 331
0x04E6:0xE003:SCM SPR 532

# OmniKey
0x076B:0x1021:OmniKey CardMan 1021
0x076B:0x3021:OmniKey CardMan 3121
0x076B:0x3621:OmniKey CardMan 3621
0x076B:0x3821:OmniKey CardMan 3821
0x076B:0x4321:OmniKey CardMan 4321
0x076B:0x5121:OmniKey CardMan 5121
0x076B:0x5125:OmniKey CardMan 5125
0x076B:0x5321:OmniKey CardMan 5321
0x076B:0x6622:OmniKey CardMan 6121
0x076B:0xA021:Smart Card Reader
0x076B:0xA022:Teo by Xiring

# C3PO
0x0783:0x0006:C3PO LTC31
0x0783:0x0007:C3PO TLTC2USB
0x0783:0x0008:C3PO LTC32 USBv2 with keyboard support
0x0783:0x0009:C3PO KBR36
0x0783:0x0010:C3PO LTC32
0x0783:0x0036:C3PO LTC36
0x0783:0x9002:C3PO TLTC2USB

# ActivCard
0x09C3:0x0013:ActivCard USB Reader 3.0
0x09C3:0x0014:Activkey Sim

# Silitek
0x047B:0x020B:Silitek SK-3105

# Dell
0x413C:0x2100:Dell keyboard SK-3106
0x413C:0x2101:Dell smart card reader keyboard

# Cherry
0x046A:0x0005:Cherry XX33
0x046A:0x0010:Cherry XX44
0x046A:0x002D:Cherry ST1044U
0x046A:0x003E:Cherry SmartTerminal ST-2XXX
0x046A:0x005B:Cherry SmartBoard XX1X
0x046A:0x0070:Cherry SmartTerminal XX1X
0x046A:0x0072:Cherry SmartTerminal XX7X

# Advanced Card Systems
0x072F:0x2200:ACS ACR122U PICC Interface
0x072F:0x8201:ACS APG8201 PINhandy 1
0x072F:0x90CC:ACS ACR 38U-CCID

# O2 Micro
0x0B97:0x7762:O2 Micro Oz776
0x0B97:0x7772:O2 Micro Oz776

# Kobil
0x0D46:0x3001:KOBIL KAAN Base
0x0D46:0x3002:KOBIL KAAN Advanced
0x0D46:0x3003:KOBIL KAAN SIM III
0x0D46:0x3010:KOBIL EMV CAP - SecOVID Reader III
0x0D46:0x3014:KOBIL Smart Token
0x0D46:0x4000:KOBIL mIDentity M
0x0D46:0x4001:KOBIL mIDentity XL
0x0D46:0x4189:KOBIL mIDentity 4smart
0x0D46:0x41A9:KOBIL mIDentity 4smart AES
0x0D46:0x4289:KOBIL mIDentity visual
0x0D46:0x4389:KOBIL mIDentity fullsize
0x0D46:0x43A9:KOBIL mIDentity 4smart fullsize AES

# Eutron
0x073D:0x0007:Eutron CryptoIdentity
0x073D:0x0008:Eutron CryptoIdentity
0x073D:0x0B00:Eutron Digipass 860
0x073D:0x0C00:Eutron SIM Pocket Combo
0x073D:0x0C01:Eutron Smart Pocket

# Athena
0x0DC3:0x0900:Athena IDProtect Key
0x0DC3:0x1004:Athena ASE IIIe
0x0DC3:0x1102:Athena ASEDrive IIIe KB

# SmartEpad
0x09BE:0x0002:SmartEpad

# Winbond Electronics (for OEM only so the name may be different)
0x0416:0x3815:Winbond

# HP
0x03F0:0x0036:HP USB CCID Smartcard Keyboard
0x03F0:0x0824:HP USB Smartcard Reader
0x03F0:0x1024:HP USB Smart Card Keyboard
0x03F0:0x2924:HP MFP Smart Card Reader

# id3 Semiconductors
0x0B81:0x0200:id3 CL1356T5
0x0B81:0x0220:id3 CL1356A HID
0x0B81:0x8007:SDS DOMINO-Key TWIN Pro

# Alcor Micro Corp.
0x058F:0x9520:Alcor Micro AU9520
0x058F:0x9540:Alcor Micro AU9540

# RSA
0x15E1:0x2007:RSA SecurID

# Fujitsu Siemens Computers
0x0BF8:0x1005:Fujitsu Siemens SmartCard Keyboard USB 2A
0x0BF8:0x1006:Fujitsu Siemens SmartCard USB 2A

# Sitecom
0x0DF6:0x800A:Sitecom USB simcard reader MD-010

# Schlumberger/Axlalto/Gemalto
0x0973:0x0003:SchlumbergerSema Cyberflex Access

# Philips
0x0471:0x040F:Philips JCOP41V221

# Philips SmartMX (Rainbow/SafeNet Key 4000?)
0x04B9:0x1400:Philips SmartMX

# Giesecke & Devrient
0x1059:0x000C:GnD CardToken 350
0x1059:0x000D:GnD CardToken 550

# Lenovo
0x17EF:0x1003:Lenovo Integrated Smart Card Reader

# Charismathics
0x19E7:0x0002:Charismathics token

# Blutronics
0x1B0E:0x1078:Blutronics Bludrive II CCID

# Covadis
0x0982:0x0007:Covadis Alya
0x0982:0x0008:Covadis Vega
0x0982:0x0040:Covadis Auriga

# Vasco
0x1A44:0x0001:Vasco DP905
0x1A44:0x0112:Vasco DIGIPASS KEY 860
0x1A44:0x0115:Vasco DIGIPASS KEY 200
0x1A44:0x0117:Vasco DIGIPASS KEY 860
0x1A44:0x0119:Vasco DIGIPASS KEY 200
0x1A44:0x0855:Vasco DP855
0x1A44:0x0865:Vasco DP865
0x1A44:0x0920:Vasco DIGIPASS 920

# Validy
0x1CF0:0x0001:Validy TokenA sl vt

# SpringCard
0x1C34:0x7113:SpringCard CrazyWriter
0x1C34:0x7121:SpringCard CSB6 Basic
0x1C34:0x7123:SpringCard CSB6 Secure
0x1C34:0x7124:SpringCard CSB6 Ultimate
0x1C34:0x7136:SpringCard EasyFinger Standard
0x1C34:0x7138:SpringCard EasyFinger Ultimate
0x1C34:0x7141:SpringCard Prox'N'Roll

# Oberthur
0x1A74:0x6354:OCS ID-One Cosmo Card
0x1A74:0xB111:OBERTHUR TECHNOLOGIES ID-ONE TOKEN SLIM v2

# Aladdin
0x0529:0x0620:Aladdin eToken PRO USB 72K Java

# Atmel
0x03EB:0x6004:Atmel AT91SO
0x03EB:0x6009:Atmel AT98SC032CT
0x03EB:0x600B:Atmel AT91SC192192CT-USB ICCD
0x03EB:0x6010:Atmel AT90SCR100
0x03EB:0x6011:Atmel AT90SCR050
0x03EB:0x6012:Atmel VaultIC420
0x03EB:0x6014:Atmel VaultIC440
0x03EB:0x6016:Atmel VaultIC460

# KEBTechnology
0x04CC:0x5072:KONA USB SmartCard

# Xiring
0x0F14:0x0011:Xiring XI-SIGN USB V2
0x0F14:0x0037:Xiring MyLeo
0x0F14:0x0038:Xiring Leo v2

# VMware
0x0E0F:0x0004:VMware Virtual USB CCID

# Realtek?
0x0BDA:0x0161:MSI StarReader SMART
0x0BDA:0x0165:Dectel CI692
0x0BDA:0x0169:Realtek

# Aktiv Co., ProgramPark
0x0A89:0x0060:Aktiv Rutoken Magistra
0x0A89:0x0025:Aktiv Rutoken lite
0x0A89:0x0030:Aktiv Rutoken ECP

# TianYu CCID Key
0xA625:0x0801:TianYu CCID SmartKey
0xA625:0x0810:Tianyu Smart Card Reader

# Precise Biometrics
0x08C3:0x0401:Precise 250 MC
0x08C3:0x0402:Precise 200 MC

# Raritan
0x14DD:0x1006:Raritan D2CIM-DVUSB VM/CCID

# Feitian
0x096E:0x0503:Feitian SCR301
0x096E:0x0505:Feitian SCR310
0x096E:0x0807:Feitian ePass2003

# Softforum
0x04E8:0x0007:Softforum XecureHSM

# Neowave
0x1E0D:0x0013:Neowave Weneo
0x1E0D:0x0033:Neowave Weneo
0x1E0D:0x1023:Neowave Weneo
0x1E0D:0x8033:Neowave Weneo

# Synnix
0x1206:0x2105:Synnix STD200

# Panasonic
0x04DA:0x117A:Panasonic USB Smart Card Reader 7A-Smart

# Todos
0x0B0C:0x0050:Todos AGM2 CCID
0x0B0C:0x0052:Todos CX00

#udea

0x2A17:0x0001:udea MILKO

# Smart
# removed on manufacturer request. They use libusb directly.
#0x0B8C:0x000E:Smart SBV280

# Broadcom
0x0A5C:0x5800:Broadcom 5880
0x0A5C:0x5801:Broadcom 5880
0x0A5C:0x5802:Broadcom 5880

# Ask
0x1FD3:0xCC1D:Ask CPL108

# German Privacy Foundation
0x20A0:0x4107:German Privacy Foundation Crypto Stick v1.2

# GoldKey Security
0x19C8:0x0012:GoldKey PIV Token

# Kingtrust
0x0483:0x0007:Kingtrust Multi-Reader

# Reiner
0x0C4B:0x9102:REINER SCT cyberJack RFID basis

# BZH
0x1677:0x0025:BZH uKeyCI800-K18

# Free Software Initiative of Japan
0x234B:0x0000:FSIJ Gnuk

# Ubisys
0x19A6:0x0009:Ubisys CCID

# BIFIT
0x23A0:0x0001:BIFIT USB-Token iBank2key
0x23A0:0x0002:BIFIT iBank2Key

# Bogus readers but partly supported
# See the http://pcsclite.alioth.debian.org/ccid/unsupported.html for a
# description of the problem(s)
0x09C3:0x0008:ActivCard USB Reader 2.0
0x0783:0x0003:C3PO LTC31
#0x0C4B:0x0300:Reiner-SCT cyberJack pinpad(a)
#0x0483:0x2010:jNet Technology jToken s1
#0x04E6:0x5291:SCM SCL010 Contactless Reader
#0x04E6:0x5292:SCM SCL01x Contactless Reader
#0x062D:0x0001:iDream or ID-SMID01
#0x1A74:0x6356:OCS ID-One Cosmo Card


EOF'

echo "supported_readers.txt modifiye edildi"
echo " libccid sürücüsü yükleniyor"
cd  $HOME/ccid-1.4.5

./bootstrap
./configure
make
sudo make install

echo "libccid yüklendi"

echo "Info.plist modifiye ediliyor..."

sudo bash -c 'cat > /usr/lib/pcsc/drivers/openct-ifd.bundle/Contents/Info.plist  << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>openct-ifd.so</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>openct-ifd</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>0.0.1d1</string>

	<key>ifdManufacturerString</key>
	<string>OpenCT Project (www.opensc-project.org/openct/)</string>
	<key>ifdProductString</key>
	<string>PC/SC Lite IFD wrapper for OpenCT</string>

	<key>ifdCapabilities</key>
	<string>0x00000000</string>
	<key>ifdProtocolSupport</key>
	<string>0x00000001</string>
	<key>ifdVersionNumber</key>
	<string>0x00000001</string>

	<key>ifdVendorID</key>
	<array>
		<string>0x2A17</string>
		<string>0x0973</string>
		<string>0x0529</string>
		<string>0x0529</string>
		<string>0x0529</string>
		<string>0x0529</string>
		<string>0x073d</string>
		<string>0x04b9</string>
		<string>0x04b9</string>
		<string>0x096e</string>
		<string>0x03f0</string>
		<string>0x046a</string>
		<string>0x04e6</string>
		<string>0x04e6</string>
		<string>0x04e6</string>
		<string>0x04e6</string>
		<string>0x04e6</string>
		<string>0x04e6</string>
		<string>0x073d</string>
		<string>0x076b</string>
		<string>0x076b</string>
		<string>0x076b</string>
		<string>0x076b</string>
		<string>0x076b</string>
		<string>0x0783</string>
		<string>0x08e6</string>
		<string>0x08e6</string>
		<string>0x08e6</string>
		<string>0x0b97</string>
		<string>0x0b97</string>
		<string>0x0bf8</string>
		<string>0x0dc3</string>
		<string>0x0a89</string>
		<string>0x072f</string>
		<string>0x072f</string>
		<string>0x072f</string>
		<string>0x072f</string>
		<string>0x072f</string>
		<string>0x072f</string>
		<string>0x104f</string>
		<string>0x0c4b</string>
		<string>0x0a89</string>
		<string>0x0a89</string>
	</array>

	<key>ifdProductID</key>
	<array>
		<string>0x0001</string>
		<string>0x0001</string>
		<string>0x050c</string>
		<string>0x0514</string>
		<string>0x0600</string>
		<string>0x0700</string>
		<string>0x0005</string>
		<string>0x1202</string>
		<string>0x1300</string>
		<string>0x0005</string>
		<string>0x1024</string>
		<string>0x0010</string>
		<string>0x5115</string>
		<string>0x5116</string>
		<string>0x5117</string>
		<string>0x511d</string>
		<string>0xE001</string>
		<string>0xE003</string>
		<string>0x0c00</string>
		<string>0x1021</string>
		<string>0x3021</string>
		<string>0x5121</string>
		<string>0x5321</string>
		<string>0x6622</string>
		<string>0x0003</string>
		<string>0x3437</string>
		<string>0x3438</string>
		<string>0x4433</string>
		<string>0x7762</string>
		<string>0x7772</string>
		<string>0x1006</string>
		<string>0x1004</string>
		<string>0x0030</string>
		<string>0x0001</string>
		<string>0x8009</string>
		<string>0x9000</string>
		<string>0x9006</string>
		<string>0x9007</string>
		<string>0x90d0</string>
		<string>0x0004</string>
		<string>0x0100</string>
		<string>0x0020</string>
		<string>0x0012</string>
	</array>

	<key>ifdFriendlyName</key>
	<array>
		<string>udea MILKO</string>
		<string>Axalto/Schlumberger/Gemalo egate token</string>
		<string>Aladdin eToken PRO</string>
		<string>Aladdin eToken PRO</string>
		<string>Aladdin eToken PRO 64</string>
		<string>Aladdin eToken PRO NG OTP</string>
		<string>Eutron CryptoIdendity</string>
		<string>Rainbow iKey 2000</string>
		<string>Rainbow iKey 3000</string>
		<string>G&D Starkey 100</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Generic CCID Reader</string>
		<string>Pertosmart Card Reader</string>
		<string>Pertosmart Card Reader</string>
		<string>Pertosmart Card Reader</string>
		<string>Pertosmart Card Reader</string>
		<string>Pertosmart Card Reader</string>
		<string>Pertosmart Card Reader</string>
		<string>WB Electronics Inifinty USB Ulimited</string>
		<string>Cyberjack Reader</string>
		<string>Aktiv Rutoken S</string>
		<string>Aktiv uaToken S</string>
	</array>
</dict>
</plist>

EOF'

echo "Info.plist modifiye edildi."

echo "AKİA indiriliyor ve yükleniyor..."
cd  $HOME/
sudo wget http://www.akiskart.com.tr/dosyalar/akis_1.6_amd64.tar $HOME/
sudo tar -xvf akis_1.6_amd64.tar
sudo dpkg -i akis_1.6_amd64.deb

echo " AKİA yüklendi."

echo " İnternet tarayıcısı için kütüphane indiriliyor ve ilgili klasöre taşınıyor..."

wget --no-check-certificate https://static.turkiye.gov.tr/downloads/signlib/linux_x64/libpkcs11wrapper.so $HOME/

sudo mv libpkcs11wrapper.so /usr/lib/
sudo rm akis_1.6_amd64.deb
sudo rm akis_1.6_amd64.tar

echo " Kütüphane indirildi ve taşındı."
sudo service pcscd restart 
zenity --info --text="Yükleme Tamamlandı. Bilgisayarınız Yeniden başlatılacak."

sudo reboot

