Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048E03E2E2E
	for <lists+linux-input@lfdr.de>; Fri,  6 Aug 2021 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhHFQMt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Aug 2021 12:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhHFQMt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Aug 2021 12:12:49 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B122C0613CF
        for <linux-input@vger.kernel.org>; Fri,  6 Aug 2021 09:12:33 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id kk23so4512156qvb.6
        for <linux-input@vger.kernel.org>; Fri, 06 Aug 2021 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=O91oJ42VEkWwDxXxnmvlyYvak6mn+pdw7CcOdytTohY=;
        b=J7ZKprmjOdVIodU74FhXSKLZkvd6lN+sAzo4xbfHHy1U0SYcJhy+ka5HIdSOOolANk
         pAmRWKGpuyHO5f+CO4PmqVJ778pfo4fJgFVr6RO5V01on4eUPUIqcngscElOVykKW1J0
         8X0RSMV/2wBefKuAugL6aJGBQbjTXC5YuwcVKcpz30oEWImbg6NfZAGtn5b86tZBPtLr
         MGknURG5kF2uigWmZmUG4selV8RsmUL/sHyjbJ/CZbzAVVWae8wuu83nHzJAgnXM1iNG
         4zf2EPAy4Z62kFvvO+TorU4gez6d5DNwq45cQ81NedoZPjZjaRb4I2JwVzaUayhkICb3
         XDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=O91oJ42VEkWwDxXxnmvlyYvak6mn+pdw7CcOdytTohY=;
        b=KR1mNNo1MuDH6rvRQqHgZi/NQHhdhGTMpFYHNTVcBHrjcq9KCyoKFACEG+HpGRCkwu
         7F1LfS4NVrkDylbQatBVnAJtkOeMeAzMsVvCIQWBMM6dS81364LfdQKAFvNAowhx8yaj
         qW4a9zMa+doawgbZzVS0h9v6cfHKuo6w73eWVa3z3adkEmTe1aRRngQxBwxWUxK04zyg
         h7GyBJnKzejfc1Izc+SuOTE+p8H/FIqu3X4Un6YlmjaBjafGGp96J1/dNsf94Z4Yvtho
         yPXzFx81umqyu+Psj0LHczsDTiCxpnTWr8Jvfa5v9GaknIZEQ+hSyMBkyh8pVVYFjuVE
         hnOQ==
X-Gm-Message-State: AOAM532i1ZqMf09uv8jr2dXHdFCwG7QClCEkduFIk6beg2dueKBWn8tG
        BHT60TUxyX5+7/MRT2SDx2f6YmlZxulDeUC1gaLsQ2sJkySjpg==
X-Google-Smtp-Source: ABdhPJzB3eJ5y23RyE4BBrYCPtH6Ce/BYYF7WX+vZv0UmYOVKWMT9kZcqHtL8lMdhckHkT2bOkNRRjNIu+d3p9o+Bx0=
X-Received: by 2002:a05:6214:104b:: with SMTP id l11mr719832qvr.40.1628266351905;
 Fri, 06 Aug 2021 09:12:31 -0700 (PDT)
MIME-Version: 1.0
From:   Tanuj Bagaria <gnutanuj@gmail.com>
Date:   Fri, 6 Aug 2021 17:12:51 +0100
Message-ID: <CAOJbJzC_R8m2aXxQS60xrsgHFGgmDdar2tMoAfBtcFZw+9WP+A@mail.gmail.com>
Subject: Re: button mapping on the Playstation 5 controller
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

If someone could point me in the right direction is all I ask. eg what
to google / where to look for the answers?

I know this is the wrong place to email for this, but I wasn't able to
find any information of button mapping issues on a Playstation 5
Dualsense controller and how to resolve it. I was able to find the
announcement of the driver and this email address. I really don't want
to be sending this email since I'm fairly sure it is as always an
issue on my own system. However if this is an actual issue I have
included details of my system below.

Essentially, the issue is that the button I press on the controller
doesn't match the key detected on the computer; where connected with
USB or Bluetooth. As far as I can tell this is because the controller
is not using the correct driver somehow. I cant't figure out:

1) How to use the correct driver?
2) Why I need to force the kernel to use the correct driver?

Currently this is the mapping I get:

| **Controller** | **$ sdl2-jstest --test 0** ||
**https://gamepad-tester.com/** || **Detected in game with Stadia** |
|:--------------:|:------------------------:|:----:|:----------------------=
---------:|:---------:|:--------------------------------:|
| On Device      | Button                   | Axis | Button
              | Axis      |                                  |
| X              | 0                        |      | B2            A
              |           | =E2=96=A1                                |
| =E2=96=A1              | 3                        |      | B3            =
B
              |           | =E2=96=B3                                |
| =E2=96=B3              | 2                        |      | B1            =
X
              |           | =E2=97=AF                                |
| =E2=97=AF              | 1                        |      | B0            =
Y
              |           | X                                |
| L1             | 4                        |      | B4           LB
              |           |                                  |
| L2             | 6                        | 2    |
              | 2     RAX | L1                               |
| L3             | 11                       |      | B11
              |           |                                  |
| R1             | 5                        |      | B5           RB
              |           |                                  |
| R2             | 7                        | 5    |
              | 3     RAY | R1                               |
| R3             | 12                       |      | B16
              |           |                                  |
| DL             | Hat 1 Value 8 Left       |      | B14           DL
              |           | DL                               |
| DR             | Hat 1 Value 2 Right      |      | B15           DR
              |           | DR                               |
| DU             | Hat 1 Value 1 Up         |      | B12           DU
              |           | DU                               |
| DD             | Hat 1 Value 4 Down       |      | B13           DD
              |           | DD                               |
| LAX            |                          | 0    |
              | 0     LAX | LAX                              |
| LAY            |                          | 1    |
              | 1     LAY | LAY                              |
| RAX            |                          | 3    | B6            LT
              |           |                                  |
| RAY            |                          | 4    | B7            RT
              |           |                                  |
| Create         | 8                        |      | B8
View              |           | Select                           |
| Menu           | 9                        |      | B9
Menu              |           | Start                            |
| PS             | 10                       |      | B10
              |           |                                  |


This remains consistant across reboots and switch between bluetooth
and usb. The trackpad seem to work fine over USB, I haven't yet tested
the Headset, accelerometer, and gyroscope yet.

According to [This
Comment](https://aur.archlinux.org/packages/hid-playstation-dkms/#comment-8=
05935)
on the AUR hid-playstation-dkms page, I should not install this on
kernel higher that 5.12.

The only "solution" I seem to be able to find to this is on the [Arch
Wiki]( https://wiki.archlinux.org/title/Gamepad#Playstation_5_(Dualsense)_c=
ontroller
) is using a [xbox driver that runs in the user
space](https://gitlab.com/xboxdrv/xboxdrv) to remap the keys which
seemed weird since there is already an apropriate driver already. Also
there is apparantly some thing call
[linuxconsole](https://sourceforge.net/projects/linuxconsole/) but I
wasn't able to remap the keys with that.

Regards,
Tanuj

Details from my computer

Arch Linux

```
$ uname -srvmpio

Linux 5.13.8-arch1-1 #1 SMP PREEMPT Wed, 04 Aug 2021 16:57:44 +0000
x86_64 unknown unknown GNU/Linux
```

```
$ lsusb | grep Sony

 Bus 003 Device 012: ID 054c:0ce6 Sony Corp. Wireless Controller
```

```
$ lsusb -s 003:012 -v

Bus 003 Device 012: ID 054c:0ce6 Sony Corp. Wireless Controller
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x054c Sony Corp.
  idProduct          0x0ce6
  bcdDevice            1.00
  iManufacturer           1 Sony Interactive Entertainment
  iProduct                2 Wireless Controller
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00e3
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0049
        bInCollection           2
        baInterfaceNr(0)        1
        baInterfaceNr(1)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          6
        bNrChannels             4
        wChannelConfig     0x0033
          Left Front (L)
          Right Front (R)
          Left Surround (LS)
          Right Surround (RS)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        bmaControls(2)       0x00
        bmaControls(3)       0x00
        bmaControls(4)       0x00
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0301 Speaker
        bAssocTerminal          4
        bSourceID               2
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0402 Headset
        bAssocTerminal          3
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               4
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             6
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          1
        bSourceID               5
        iTerminal               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             4
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0188  1x 392 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           6
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c4  1x 196 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     273
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
```
```
$ lsusb -s 003:012 -t -v

/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/7p, 480M
        ID 0424:2807 Microchip Technology, Inc. (formerly SMSC) Hub
        |__ Port 3: Dev 12, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 48=
0M
            ID 054c:0ce6 Sony Corp.
        |__ Port 3: Dev 12, If 3, Class=3DHuman Interface Device,
Driver=3Dusbhid, 480M
            ID 054c:0ce6 Sony Corp.
        |__ Port 3: Dev 12, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 48=
0M
            ID 054c:0ce6 Sony Corp.
        |__ Port 3: Dev 12, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 48=
0M
            ID 054c:0ce6 Sony Corp.
```

```
$ lsmod | grep hid-playstation
```

```
$ modinfo hid-playstation

filename:
/lib/modules/5.13.8-arch1-1/kernel/drivers/hid/hid-playstation.ko.zst
license:        GPL
description:    HID Driver for PlayStation peripherals.
author:         Sony Interactive Entertainment
srcversion:     980BEAF44460E60E97C39B7
alias:          hid:b0003g*v0000054Cp00000CE6
alias:          hid:b0005g*v0000054Cp00000CE6
depends:        ff-memless
retpoline:      Y
intree:         Y
name:           hid_playstation
vermagic:       5.13.8-arch1-1 SMP preempt mod_unload
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        3C:D4:29:8B:B9:DD:84:BA:47:98:89:17:89:BD:77:F0:F2:8A:4A:82
sig_hashalgo:   sha512
signature:      9A:15:37:2E:09:2F:E5:49:3B:4B:38:9D:95:64:17:C3:08:A2:A8:B3=
:
        FE:DA:D9:8E:0C:ED:83:4B:22:BF:CE:22:91:53:D8:EB:9D:D3:E2:65:
        89:CD:FB:2F:C2:3E:31:B8:69:65:BF:CB:FC:89:5B:6C:E4:D2:5A:5C:
        85:12:0A:6F:F7:A5:16:63:C6:74:38:0F:04:F8:05:4B:25:F2:4B:6F:
        19:21:A5:B9:CC:09:69:58:F9:27:01:66:ED:3B:12:B4:93:5F:E0:D1:
        52:D1:BE:2C:C1:72:DA:14:1B:49:B2:E3:6D:C1:FF:88:7C:E6:2A:B8:
        6D:E6:83:D5:5A:60:32:B8:DB:70:0D:D0:5E:26:17:73:C8:BF:D9:10:
        52:30:32:3A:0E:94:08:76:D1:7D:07:DE:AE:33:18:FB:CB:75:6A:D1:
        62:F6:FB:7B:EA:4F:3C:E0:93:DE:35:EA:A0:7B:1F:4D:2E:4D:17:8C:
        63:F9:D7:AB:1F:1A:66:B2:30:8C:CF:CC:32:6A:1E:11:CF:5C:C2:C2:
        BF:11:BC:A3:B4:E2:D0:57:5A:10:2C:6F:49:53:F0:81:09:0F:22:68:
        9D:30:ED:FF:F0:74:0C:1C:8E:09:DF:E0:05:60:6B:F0:45:4A:7A:0D:
        92:9E:5B:83:63:B9:6D:3A:76:C2:3E:AA:19:92:74:E1:C1:6B:BB:2E:
        33:89:E7:B3:91:A7:58:B0:E7:18:E1:4D:A0:98:D0:25:80:04:37:14:
        85:34:31:85:50:27:D1:7D:99:71:A5:99:14:8A:76:3A:75:D5:5A:23:
        AE:3C:AD:83:41:6A:E8:42:8F:28:54:E9:1D:D0:C5:6C:85:38:0F:23:
        3C:75:FD:27:AF:01:90:99:C2:C9:C9:90:11:4D:96:9D:85:42:01:E2:
        84:DF:D5:0D:DD:E9:E0:33:C8:55:80:4A:0C:9D:AF:CB:FB:65:2C:E9:
        D0:EF:2A:E1:6F:B2:BE:D5:8C:29:DF:B2:7A:0A:7A:DF:9B:6F:89:C7:
        21:67:E5:DA:C1:C4:80:1A:D2:9D:C2:EF:69:1D:50:7F:2B:52:8C:3A:
        58:06:AC:C8:43:5A:45:64:8F:E9:AB:28:C1:01:FD:A3:1E:E3:DE:3B:
        38:52:6B:A6:14:5A:3E:15:AF:69:9B:B9:1F:91:5D:0B:EC:48:8C:13:
        06:24:3F:A3:83:83:EE:E4:D3:C8:A0:16:F5:2C:EE:67:BA:6C:68:B1:
        EA:E1:8D:62:BE:8E:86:6D:3B:7F:EE:80:21:5E:CB:0E:D4:9E:B4:F9:
        C3:C2:0E:CE:A5:B0:EC:E7:A4:F6:AE:BE:C3:72:43:76:CD:F0:9B:9F:
        5D:FC:8A:5C:E2:47:EB:79:93:12:72:5B
```

```
$ cat /proc/bus/input/devices

I: Bus=3D0003 Vendor=3D054c Product=3D0ce6 Version=3D8111
N: Name=3D"Sony Interactive Entertainment Wireless Controller"
P: Phys=3D
S: Sysfs=3D/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:=
39:00.0/usb3/3-1/3-1.3/3-1.3:1.3/0003:054C:0CE6.0013/input/input68
U: Uniq=3D4c:b9:9b:16:ea:b7
H: Handlers=3Devent17 js0
B: PROP=3D0
B: EV=3D20000b
B: KEY=3D7fdb000000000000 0 0 0 0
B: ABS=3D3003f
B: FF=3D107030000 0

I: Bus=3D0003 Vendor=3D054c Product=3D0ce6 Version=3D8111
N: Name=3D"Sony Interactive Entertainment Wireless Controller Motion Sensor=
s"
P: Phys=3D
S: Sysfs=3D/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:=
39:00.0/usb3/3-1/3-1.3/3-1.3:1.3/0003:054C:0CE6.0013/input/input69
U: Uniq=3D4c:b9:9b:16:ea:b7
H: Handlers=3Devent31 js2
B: PROP=3D40
B: EV=3D19
B: ABS=3D3f
B: MSC=3D20

I: Bus=3D0003 Vendor=3D054c Product=3D0ce6 Version=3D8111
N: Name=3D"Sony Interactive Entertainment Wireless Controller Touchpad"
P: Phys=3D
S: Sysfs=3D/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:=
39:00.0/usb3/3-1/3-1.3/3-1.3:1.3/0003:054C:0CE6.0013/input/input70
U: Uniq=3D4c:b9:9b:16:ea:b7
H: Handlers=3Devent256 mouse7
B: PROP=3D5
B: EV=3Db
B: KEY=3D2420 10000 0 0 0 0
B: ABS=3D260800000000003
```

```
/sys/bus/hid/devices/0003:054C:0CE6.0013]$ cat *

00
cat: driver: Is a directory
0x01010007
0x00000313
cat: hidraw: Is a directory
cat: input: Is a directory
hid:b0003g0001v0000054Cp00000CE6
cat: power: Is a directory
cat: power_supply: Is a directory
    "&4    #/    3(      4/    5    $    4&u          9%5F;euBe    )%u    !
    %     &?!    '"    @?    (?    )?    *        +?    ,?    -
.=EF=BF=BD/?=EF=BF=BD0?=EF=BF=BD1?=EF=BF=BD2=EF=BF=BD5?    6cat: subsystem:=
 Is a directory
DRIVER=3Dplaystation
HID_ID=3D0003:0000054C:00000CE6
HID_NAME=3DSony Interactive Entertainment Wireless Controller
HID_PHYS=3Dusb-0000:39:00.0-1.3/input3
HID_UNIQ=3D4c:b9:9b:16:ea:b7
MODALIAS=3Dhid:b0003g0001v0000054Cp00000CE6
```
