Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EE3496C6C
	for <lists+linux-input@lfdr.de>; Sat, 22 Jan 2022 13:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbiAVMwl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jan 2022 07:52:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbiAVMwl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jan 2022 07:52:41 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35F7C06173B
        for <linux-input@vger.kernel.org>; Sat, 22 Jan 2022 04:52:40 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id r11so10555800pgr.6
        for <linux-input@vger.kernel.org>; Sat, 22 Jan 2022 04:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=nwLfYMmd/LBPxomQXf9IAAtGCwNCPKOvtQSAduXhj00=;
        b=eB0BjrWUXikOZO5pDBVvUQnINJOKYU/kSllP1HWbWOXlWG8iG829uZ7sevEMGn8xc2
         S/IYxWwXPwQy0CyyYW19lN+4hik8//vPzic6X5NYiZJZtD4AY+hMCwHRkaMineqfjkQD
         wz3GTnUC4xiVFuAMskhphf5smDTGA84rl5Zfj3AV5TsLJ+bvhuApiCgDSpkb19PYpEOI
         4DRbDfbhchTaDWsqLC/KSKtZzThLCUYK2uJykRLr1+bG0luR3DpJSWSMJ0DH6jwV/5Jp
         hCSpsyKybhcA6L68seTaNgLomo7CtgezO0TjVqOeUGqLqUGL4CaYzGgHqrINa/ISPxan
         YAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nwLfYMmd/LBPxomQXf9IAAtGCwNCPKOvtQSAduXhj00=;
        b=J9JQPpcF1/AHqM6c4IF9nlZfU2w9xpLZw+ZitfYZ8N3HomjqMz/XnnVrQV9R1fDguL
         6iNd7fo4+Dk1TCYFmqyu+AHywyd59up2SysOYfQUNcDFPdSU0Ri4+I5hoNMZseztp+SC
         M15VhGhp9EDFwXED4vXbnyLAfXulp8s/DRMZUlKfdNN1N3F+ps9oQPiu/0mmu/27xAO0
         +bbOdfQ3b//HoP0Jn+Rn7W85+RNbEvqTM1llk/vLMjlqAa6m7OXOM+PXFp+4awwY/8R4
         JB6nU6Zc7aAO07lPHNb6E04pl4T34V5DCsEoFDzYYl/CFSt9lZZzcZU1fyJ3sxReZ9p4
         JmkQ==
X-Gm-Message-State: AOAM530Vt7WgXtOyZOsIUNiMT+hNFqn018ypckdmnGXK+d57wlOw/AFO
        3Jq3+nEVH6WzOMM8wbJXGbeoCcjVx6Rh2XGg+HWGfG00bMU=
X-Google-Smtp-Source: ABdhPJwssYBoGT0d2AyLToXi95DzrGNxCL4YptMMRnQzUEHbC40NQ3eFKaxYK/wM2YvL9Pz5h3HrnfpY66pk2pVV60c=
X-Received: by 2002:a63:3c55:: with SMTP id i21mr4212622pgn.324.1642855960271;
 Sat, 22 Jan 2022 04:52:40 -0800 (PST)
MIME-Version: 1.0
From:   Vincent Legoll <vincent.legoll@gmail.com>
Date:   Sat, 22 Jan 2022 13:52:29 +0100
Message-ID: <CAEwRq=rSgqcQnWQ+Z29wJfOnT+ri8b25+hwheQDPBe2REOpxww@mail.gmail.com>
Subject: Quirky Perixx Periboard-520 USB keyboard + trackball
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have a Perixx Periboard-520 USB keyboard + trackball
that is not fully working, the keyboard seems OK, but
the trackball is not. The kernel errors out during probe,
probably due to a botched HID decriptor table.

I still am able to get something out of it with
`usbhid-dump` though. See below.

I can easily test patches, or provide more informations.

I may be mentored to fix it myself, I just don't really
know where to start.

I've seen that `drivers/hid/hid-holtek-kbd.c` has
something to fix the descriptor table for another
model.

## Hardware

Brand: Perixx
Type: Wired trackball keyboard
Model: PERIBOARD-520
Part No: TK566

## Unplugging then replugging the device

# dmesg | tail -8

[ 2655.083815] usb 5-3: USB disconnect, device number 3
[ 2659.028237] usb 5-1: new low-speed USB device number 4 using xhci_hcd
[ 2659.206156] usb 5-1: New USB device found, idVendor=04d9,
idProduct=a088, bcdDevice= 1.15
[ 2659.206165] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[ 2659.249387] input: HID 04d9:a088 as
/devices/pci0000:00/0000:00:01.2/0000:01:00.0/0000:02:08.0/0000:27:00.3/usb5/5-1/5-1:1.0/0003:04D9:A088.0006/input/input20
[ 2659.308499] hid-generic 0003:04D9:A088.0006: input,hidraw0: USB HID
v1.11 Keyboard [HID 04d9:a088] on usb-0000:27:00.3-1/input0
[ 2659.308744] usbhid 5-1:1.1: can't add hid device: -22
[ 2659.308758] usbhid: probe of 5-1:1.1 failed with error -22

$ lsusb -vd 04d9:a088

Bus 005 Device 004: ID 04d9:a088 Holtek Semiconductor, Inc.
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x04d9 Holtek Semiconductor, Inc.
  idProduct          0xa088
  bcdDevice            1.15
  iManufacturer           0
  iProduct                0
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x003b
    bNumInterfaces          2
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
          wDescriptorLength      62
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
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
          bNumDescriptors         0
        junk at descriptor end: 22 ae 00
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10

# usbhid-dump --model=04d9:a088
005:004:001:DESCRIPTOR         1642794805.579145
 05 01 09 80 A1 01 85 01 19 81 29 83 15 00 25 01
 95 03 75 01 81 02 95 01 75 05 81 01 C0 05 0C 09
 01 A1 01 85 02 15 00 25 01 09 E9 09 EA 09 E2 09
 CD 19 B5 29 B8 75 01 95 08 81 02 0A 8A 01 0A 21
 02 0A 2A 02 1A 23 02 2A 27 02 81 02 0A 83 01 0A
 96 01 0A 92 01 0A 9E 01 0A 94 01 0A 06 02 09 B2
 09 B4 81 02 C0 05 01 09 02 A1 01 85 03 09 01 A1
 00 05 09 19 01 29 03 15 00 25 01 95 03 75 01 81
 02 95 01 75 05 81 01 05 01 09 30 09 31 15 81 25
 7F 75 08 95 02 81 06 09 38 15 81 25 7F 35 08 95
 01 81 06 05 0C 0A 38 02 95 01 81 06 C0 C0

005:004:000:DESCRIPTOR         1642794805.592119
 05 01 09 06 A1 01 05 07 19 E0 29 E7 15 00 25 01
 75 01 95 08 81 02 95 01 75 08 81 01 95 03 75 01
 05 08 19 01 29 03 91 02 95 05 75 01 91 01 95 06
 75 08 26 FF 00 05 07 19 00 29 91 81 00 C0

# usbhid-dump -e stream --model=04d9:a088
Starting dumping interrupt transfer stream
with 1 minute timeout.

## Keypresses (released between each one: "s" + "o" + "s")

005:004:000:STREAM             1642796622.287620
 00 00 16 00 00 00 00 00

005:004:000:STREAM             1642796622.383625
 00 00 00 00 00 00 00 00

005:004:000:STREAM             1642796623.719620
 00 00 12 00 00 00 00 00

005:004:000:STREAM             1642796623.831598
 00 00 00 00 00 00 00 00

005:004:000:STREAM             1642796624.575178
 00 00 16 00 00 00 00 00

005:004:000:STREAM             1642796624.663739
 00 00 00 00 00 00 00 00

## Pressing and releasing left trackball button twice in a row

005:004:001:STREAM             1642795078.474017
 03 01 00 00 00 00

005:004:001:STREAM             1642795078.785958
 03 00 00 00 00 00

005:004:001:STREAM             1642795080.858012
 03 01 00 00 00 00

005:004:001:STREAM             1642795080.977974
 03 00 00 00 00 00

## Pressing and releasing right trackball button twice in a row

005:004:001:STREAM             1642795083.217993
 03 02 00 00 00 00

005:004:001:STREAM             1642795083.385952
 03 00 00 00 00 00

005:004:001:STREAM             1642795084.041907
 03 02 00 00 00 00

005:004:001:STREAM             1642795084.241925
 03 00 00 00 00 00

## Rolling the ball

005:004:001:STREAM             1642795244.631126
 03 00 F8 09 00 00

005:004:001:STREAM             1642795244.639211
 03 00 F9 05 00 00

005:004:001:STREAM             1642795244.647062
 03 00 F8 06 00 00

005:004:001:STREAM             1642795244.663086
 03 00 EF 0B 00 00

005:004:001:STREAM             1642795244.671097
 03 00 F8 03 00 00

005:004:001:STREAM             1642795244.679085
 03 00 F5 05 00 00

005:004:001:STREAM             1642795244.687086
 03 00 F8 03 00 00

005:004:001:STREAM             1642795244.695086
 03 00 F5 02 00 00

005:004:001:STREAM             1642795244.703095
 03 00 F8 02 00 00

005:004:001:STREAM             1642795244.711086
 03 00 F5 00 00 00

005:004:001:STREAM             1642795244.719086
 03 00 F7 00 00 00

005:004:001:STREAM             1642795244.727135
 03 00 FA 00 00 00

005:004:001:STREAM             1642795244.735072
 03 00 F9 00 00 00

005:004:001:STREAM             1642795244.743085
 03 00 FC 00 00 00

005:004:001:STREAM             1642795244.751085
 03 00 F9 00 00 00

005:004:001:STREAM             1642795244.759132
 03 00 FC 00 00 00

005:004:001:STREAM             1642795244.767085
 03 00 FA FE 00 00

005:004:001:STREAM             1642795244.775086
 03 00 FE FE 00 00

005:004:001:STREAM             1642795244.783124
 03 00 FC FD 00 00

005:004:001:STREAM             1642795244.799062
 03 00 FA F9 00 00

005:004:001:STREAM             1642795244.807084
 03 00 FC F9 00 00

005:004:001:STREAM             1642795244.815122
 03 00 FC FA 00 00

005:004:001:STREAM             1642795244.823094
 03 00 FB F8 00 00

005:004:001:STREAM             1642795244.831081
 03 00 FB FA 00 00

005:004:001:STREAM             1642795244.839085
 03 00 FB F5 00 00

005:004:001:STREAM             1642795244.847125
 03 00 FD F9 00 00

005:004:001:STREAM             1642795244.855093
 03 00 FB F4 00 00

005:004:001:STREAM             1642795244.863085
 03 00 FD F7 00 00

-- 
Vincent Legoll
