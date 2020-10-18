Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F81729155A
	for <lists+linux-input@lfdr.de>; Sun, 18 Oct 2020 05:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgJRDPs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Oct 2020 23:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgJRDPr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Oct 2020 23:15:47 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115C7C061755
        for <linux-input@vger.kernel.org>; Sat, 17 Oct 2020 20:15:46 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id k1so6972859ilc.10
        for <linux-input@vger.kernel.org>; Sat, 17 Oct 2020 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version;
        bh=t+9zZoezTDYIeOtfQQrTPET5dRR3Ktnt9LHvhxoiLZs=;
        b=lzR7yXRwXniu+GMEGq8dztf+bAX/q2Mbg+NXrsARdVVYu/OM6/wWEtsphlmfLxKQhF
         +gAvEsuzTNMsrn8fDfKpC4MERER3ZRFv2XSdTb/96MyYCr64EiyL+w76UQIt9XSzdy7g
         X2LDRae1BbcY7bZ9V2GqK3lyb3D+tutD048OB7K03dViXZq1/fVdJ9HY2CymAYTFxaI0
         Eiix2BbuHhMShN+lShdRRCs2clAE7D1eHYaAbSZICXt8+aTjP8FQasBWt5B4+L/Jh79I
         zMVRDyXT6C7VyhRQFFJbdIMHFBMfzInZhmmlimwG7r/Q0GdDi0hDTKkdCDPeVWfLfjp3
         G+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
        bh=t+9zZoezTDYIeOtfQQrTPET5dRR3Ktnt9LHvhxoiLZs=;
        b=qd4mbn/BbiGqsMGDI3mV30plK8csiKIwsOhKAO7VUjyFk6UkzWx5uwQmAetahi3zVi
         jesaxhCaq286VrPMcNpAu3J5eNTXaiA2IIkpiKqBItJtZKDr/AfxCRrXREfE7RG/5KlY
         7cjNl2vUIk1jDGlIJgdTqcNUbQA1Nrw+ZrXp9XkXa2z0mVNpWZfBZXOxlot/lcDvMaOM
         e5+z6YOkYaWglVouGdcCSiNSOhkaTiqguko8zfWymK1IzXxzuK8QlguC2jiLO/aze7E1
         SrptkfwOH+gj1ojIAm5tYoqKL2WIaADC9IbT12AIQ9pkBQVo3ixB19PnPUxOG3jpI1Ij
         /4Kg==
X-Gm-Message-State: AOAM531HUjK6TWUJBDB+4UdP4U5jeDLWa/ObTKdhDKyDLk5v6CrcXocB
        t0e0fc+DvsfX2llzf6NyGrhHRZeitsT4Uw==
X-Google-Smtp-Source: ABdhPJyQO2aoNGNtXR/QgYqVmAnIzeA2lDmgc5OIrkrREtCaptQ0uXgS8WPpF5QP1bN2FyBA44/1Xg==
X-Received: by 2002:a92:c9cc:: with SMTP id k12mr7057609ilq.181.1602990945024;
        Sat, 17 Oct 2020 20:15:45 -0700 (PDT)
Received: from personal (c-73-119-27-70.hsd1.ma.comcast.net. [73.119.27.70])
        by smtp.gmail.com with ESMTPSA id w23sm6349797iod.45.2020.10.17.20.15.43
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 20:15:44 -0700 (PDT)
From:   Benjamin Moody <benjamin.moody@gmail.com>
X-Google-Original-From: Benjamin Moody <benjaminmoody@gmail.com>
To:     linux-input@vger.kernel.org
Subject: SEMITEK / GK6X keyboards - working around buggy descriptor
Date:   Sat, 17 Oct 2020 23:15:41 -0400
Message-ID: <877drocjhe.fsf@disp4150>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear linux-input,

The "GK6X" series is a series of USB keyboards that feature swappable
key switches, programmable mappings, and LED effects.  There are many
variants, sold by multiple manufacturers (see below).  I believe all
of these keyboards use the same vendor ID (0x1EA7) and product ID
(0x0907), and the same or closely related firmware.

The keyboard supports full N-key rollover, but in Linux, only the
first six keypresses are recognized.  This appears to be caused by an
erroneous report descriptor, which labels the input field as "array"
when it should be "variable".

The report descriptor for interface 2 is:

$ od -Ax -tx1 /sys/bus/hid/devices/0003:1EA7:0907.0005/report_descriptor
000000 05 01 09 80 a1 01 85 01 19 81 29 83 15 00 25 01
000010 95 03 75 01 81 02 95 01 75 05 81 01 c0 05 0c 09
000020 01 a1 01 85 02 15 00 25 01 95 12 75 01 0a 83 01
000030 0a 8a 01 0a 92 01 0a 94 01 09 cd 09 b7 09 b6 09
000040 b5 09 e2 09 ea 09 e9 0a 21 02 0a 23 02 0a 24 02
000050 0a 25 02 0a 26 02 0a 27 02 0a 2a 02 81 02 95 01
000060 75 0e 81 01 c0 05 01 09 06 a1 01 85 04 05 07 95
000070 01 75 08 81 03 95 e8 75 01 15 00 25 01 05 07 19
000080 00 29 e7 81 00 c0 05 01 09 02 a1 01 85 05 09 01
000090 a1 00 05 09 19 01 29 08 15 00 25 01 95 08 75 01
0000a0 81 02 05 01 09 30 09 31 16 01 f8 26 ff 07 95 02
0000b0 75 0c 81 06 09 38 15 81 25 7f 95 01 75 08 81 06
0000c0 05 0c 0a 38 02 95 01 81 06 c0 c0
0000cb

At offset 0x83, "81 00" should apparently be "81 02" instead.

It looks to me like it should be possible to work around this in Linux
by patching the descriptor, as is done for several other HID devices.
Would that be the best way to fix this?  What would need to be done to
add such a driver?


List of known variants (from https://github.com/pixeltris/GK6X/blob/master/Build/Data/device/modellist.json):

 Dierya DK61
 Dierya DK66
 GK21S-RGB
 GK61 RGB
 GK61-RGB-V2
 GK61S RGB
 GK61S RGB LED
 GK61X RGB
 GK61XS RGB
 GK64 RGB
 GK64 RGB V1
 GK64S
 GK64S RGB V2
 GK64X-RGB
 GK64XS-RGB
 GK68 RGB
 GK68X RGB
 GK68XS RGB
 GK73 RGB
 GK73S RGB
 GK84S RGB
 GK87 RGB
 GK87S RGB
 GK96L-X RGB
 GK96L-XS RGB
 GK96X-RGB
 GK96XS-RGB
 GK98 RGB
 GK99-RGB
 GS66 RGB LED
 GS66S RGB LED
 GX66 RGB
 GX66S RGB
 Knight 22Key RGB
 Knight 86Key RGB
 Nature 86Key RGB
 RANGER 87Key RGB
 RANGER 89Key RGB
 RANGERS 87Key RGB
 RANGERS 89Key RGB
 SK103 RGB
 SK103S RGB
 SK104 2RGB
 SK104 RGB
 SK61 RGB
 SK61-RGB
 SK61S RGB
 SK61S-RGB
 SK61X RGB
 SK61XS RGB
 SK64 RGB
 SK64-RGB
 SK64S RGB
 SK64S-RGB
 SK64X RGB
 SK64XS RGB
 SK64XS-2RGB
 SK66-2RGB
 SK66-RGB
 SK66S-2RGB
 SK66S-RGB
 SK68 RGB
 SK68S RGB
 SK70 RGB
 SK70S RGB
 SK71 RGB
 SK71S RGB
 SK73 RGB
 SK73S RGB
 SK84S-RGB
 SK87 RGB
 SK87-RGB
 SK87S RGB
 SK87S-2RGB
 SK96 RGB
 SK96S RGB
 TK09R-104 RGB-KR
 TK09R-104 RGB-RU
 TK09R-104 RGB-UK
 TK09R-104 RGB-US
 TK09R-104 RGBS-US
 TK09R-105 RGB-DE
 TK09R-105 RGB-EN
 TK09R-105 RGB-ES
 TK09R-105 RGB-FR
 TK09R-105 RGB-IT
 TK09R-G18-3330
 TK09R-LC-V3
 TK09R-MousePad
 Woo-dy 67Key RGB


Full descriptor dump (lsusb -v):

Bus 002 Device 006: ID 1ea7:0907 SHARKOON Technologies GmbH 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x1ea7 SHARKOON Technologies GmbH
  idProduct          0x0907 
  bcdDevice            3.00
  iManufacturer           1 SEMITEK
  iProduct                2 USB-HID Gaming Keyboard
  iSerial                 3 SN0000000001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x005b
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      64
          Report Descriptor: (length is 64)
            Item(Global): Usage Page, data= [ 0x01 ] 1
                            Generic Desktop Controls
            Item(Local ): Usage, data= [ 0x06 ] 6
                            Keyboard
            Item(Main  ): Collection, data= [ 0x01 ] 1
                            Application
            Item(Global): Usage Page, data= [ 0x07 ] 7
                            Keyboard
            Item(Local ): Usage Minimum, data= [ 0xe0 ] 224
                            Control Left
            Item(Local ): Usage Maximum, data= [ 0xe7 ] 231
                            GUI Right
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x01 ] 1
            Item(Global): Report Count, data= [ 0x08 ] 8
            Item(Main  ): Input, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x08 ] 8
            Item(Main  ): Input, data= [ 0x03 ] 3
                            Constant Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0x03 ] 3
            Item(Global): Report Size, data= [ 0x01 ] 1
            Item(Global): Usage Page, data= [ 0x08 ] 8
                            LEDs
            Item(Local ): Usage Minimum, data= [ 0x01 ] 1
                            NumLock
            Item(Local ): Usage Maximum, data= [ 0x03 ] 3
                            Scroll Lock
            Item(Main  ): Output, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x05 ] 5
            Item(Main  ): Output, data= [ 0x03 ] 3
                            Constant Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0x06 ] 6
            Item(Global): Report Size, data= [ 0x08 ] 8
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0xa4 0x00 ] 164
            Item(Global): Usage Page, data= [ 0x07 ] 7
                            Keyboard
            Item(Local ): Usage Minimum, data= [ 0x00 ] 0
                            No Event
            Item(Local ): Usage Maximum, data= [ 0xa4 ] 164
                            ExSel
            Item(Main  ): Input, data= [ 0x00 ] 0
                            Data Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Main  ): End Collection, data=none
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
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
          wDescriptorLength      34
          Report Descriptor: (length is 34)
            Item(Global): Usage Page, data= [ 0x00 0xff ] 65280
                            (null)
            Item(Local ): Usage, data= [ 0x50 ] 80
                            (null)
            Item(Main  ): Collection, data= [ 0x01 ] 1
                            Application
            Item(Local ): Usage, data= [ 0x02 ] 2
                            (null)
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0xff 0x00 ] 255
            Item(Global): Report Size, data= [ 0x08 ] 8
            Item(Global): Report Count, data= [ 0x40 ] 64
            Item(Main  ): Input, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Local ): Usage, data= [ 0x03 ] 3
                            (null)
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0xff 0x00 ] 255
            Item(Global): Report Size, data= [ 0x08 ] 8
            Item(Global): Report Count, data= [ 0x40 ] 64
            Item(Main  ): Output, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Main  ): End Collection, data=none
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
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
          wDescriptorLength     203
          Report Descriptor: (length is 203)
            Item(Global): Usage Page, data= [ 0x01 ] 1
                            Generic Desktop Controls
            Item(Local ): Usage, data= [ 0x80 ] 128
                            System Control
            Item(Main  ): Collection, data= [ 0x01 ] 1
                            Application
            Item(Global): Report ID, data= [ 0x01 ] 1
            Item(Local ): Usage Minimum, data= [ 0x81 ] 129
                            System Power Down
            Item(Local ): Usage Maximum, data= [ 0x83 ] 131
                            System Wake Up
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0x01 ] 1
            Item(Global): Report Count, data= [ 0x03 ] 3
            Item(Global): Report Size, data= [ 0x01 ] 1
            Item(Main  ): Input, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x05 ] 5
            Item(Main  ): Input, data= [ 0x01 ] 1
                            Constant Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Main  ): End Collection, data=none
            Item(Global): Usage Page, data= [ 0x0c ] 12
                            Consumer
            Item(Local ): Usage, data= [ 0x01 ] 1
                            Consumer Control
            Item(Main  ): Collection, data= [ 0x01 ] 1
                            Application
            Item(Global): Report ID, data= [ 0x02 ] 2
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0x01 ] 1
            Item(Global): Report Count, data= [ 0x12 ] 18
            Item(Global): Report Size, data= [ 0x01 ] 1
            Item(Local ): Usage, data= [ 0x83 0x01 ] 387
                            AL Consumer Control Configuration
            Item(Local ): Usage, data= [ 0x8a 0x01 ] 394
                            AL Email Reader
            Item(Local ): Usage, data= [ 0x92 0x01 ] 402
                            AL Calculator
            Item(Local ): Usage, data= [ 0x94 0x01 ] 404
                            AL Local Machine Browser
            Item(Local ): Usage, data= [ 0xcd ] 205
                            Play/Pause
            Item(Local ): Usage, data= [ 0xb7 ] 183
                            Stop
            Item(Local ): Usage, data= [ 0xb6 ] 182
                            Scan Previous Track
            Item(Local ): Usage, data= [ 0xb5 ] 181
                            Scan Next Track
            Item(Local ): Usage, data= [ 0xe2 ] 226
                            Mute
            Item(Local ): Usage, data= [ 0xea ] 234
                            Volume Decrement
            Item(Local ): Usage, data= [ 0xe9 ] 233
                            Volume Increment
            Item(Local ): Usage, data= [ 0x21 0x02 ] 545
                            AC Search
            Item(Local ): Usage, data= [ 0x23 0x02 ] 547
                            AC Home
            Item(Local ): Usage, data= [ 0x24 0x02 ] 548
                            AC Back
            Item(Local ): Usage, data= [ 0x25 0x02 ] 549
                            AC Forward
            Item(Local ): Usage, data= [ 0x26 0x02 ] 550
                            AC Stop
            Item(Local ): Usage, data= [ 0x27 0x02 ] 551
                            AC Refresh
            Item(Local ): Usage, data= [ 0x2a 0x02 ] 554
                            (null)
            Item(Main  ): Input, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x0e ] 14
            Item(Main  ): Input, data= [ 0x01 ] 1
                            Constant Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Main  ): End Collection, data=none
            Item(Global): Usage Page, data= [ 0x01 ] 1
                            Generic Desktop Controls
            Item(Local ): Usage, data= [ 0x06 ] 6
                            Keyboard
            Item(Main  ): Collection, data= [ 0x01 ] 1
                            Application
            Item(Global): Report ID, data= [ 0x04 ] 4
            Item(Global): Usage Page, data= [ 0x07 ] 7
                            Keyboard
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x08 ] 8
            Item(Main  ): Input, data= [ 0x03 ] 3
                            Constant Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Report Count, data= [ 0xe8 ] 232
            Item(Global): Report Size, data= [ 0x01 ] 1
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0x01 ] 1
            Item(Global): Usage Page, data= [ 0x07 ] 7
                            Keyboard
            Item(Local ): Usage Minimum, data= [ 0x00 ] 0
                            No Event
            Item(Local ): Usage Maximum, data= [ 0xe7 ] 231
                            GUI Right
            Item(Main  ): Input, data= [ 0x00 ] 0
                            Data Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Main  ): End Collection, data=none
            Item(Global): Usage Page, data= [ 0x01 ] 1
                            Generic Desktop Controls
            Item(Local ): Usage, data= [ 0x02 ] 2
                            Mouse
            Item(Main  ): Collection, data= [ 0x01 ] 1
                            Application
            Item(Global): Report ID, data= [ 0x05 ] 5
            Item(Local ): Usage, data= [ 0x01 ] 1
                            Pointer
            Item(Main  ): Collection, data= [ 0x00 ] 0
                            Physical
            Item(Global): Usage Page, data= [ 0x09 ] 9
                            Buttons
            Item(Local ): Usage Minimum, data= [ 0x01 ] 1
                            Button 1 (Primary)
            Item(Local ): Usage Maximum, data= [ 0x08 ] 8
                            (null)
            Item(Global): Logical Minimum, data= [ 0x00 ] 0
            Item(Global): Logical Maximum, data= [ 0x01 ] 1
            Item(Global): Report Count, data= [ 0x08 ] 8
            Item(Global): Report Size, data= [ 0x01 ] 1
            Item(Main  ): Input, data= [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Usage Page, data= [ 0x01 ] 1
                            Generic Desktop Controls
            Item(Local ): Usage, data= [ 0x30 ] 48
                            Direction-X
            Item(Local ): Usage, data= [ 0x31 ] 49
                            Direction-Y
            Item(Global): Logical Minimum, data= [ 0x01 0xf8 ] 63489
            Item(Global): Logical Maximum, data= [ 0xff 0x07 ] 2047
            Item(Global): Report Count, data= [ 0x02 ] 2
            Item(Global): Report Size, data= [ 0x0c ] 12
            Item(Main  ): Input, data= [ 0x06 ] 6
                            Data Variable Relative No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Local ): Usage, data= [ 0x38 ] 56
                            Wheel
            Item(Global): Logical Minimum, data= [ 0x81 ] 129
            Item(Global): Logical Maximum, data= [ 0x7f ] 127
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Global): Report Size, data= [ 0x08 ] 8
            Item(Main  ): Input, data= [ 0x06 ] 6
                            Data Variable Relative No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Global): Usage Page, data= [ 0x0c ] 12
                            Consumer
            Item(Local ): Usage, data= [ 0x38 0x02 ] 568
                            AC Pan
            Item(Global): Report Count, data= [ 0x01 ] 1
            Item(Main  ): Input, data= [ 0x06 ] 6
                            Data Variable Relative No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile Bitfield
            Item(Main  ): End Collection, data=none
            Item(Main  ): End Collection, data=none
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)
