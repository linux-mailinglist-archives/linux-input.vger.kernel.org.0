Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B1B1B8ED7
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 12:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgDZKaD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 06:30:03 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44983 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgDZK37 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 06:29:59 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F26CD20002
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 10:29:56 +0000 (UTC)
Message-ID: <8a30ca52404da798989ed320f180edb4bfb55c1d.camel@hadess.net>
Subject: GBros adapter in wired XInput mode not detected as XBox 360
 controller
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Date:   Sun, 26 Apr 2020 12:29:56 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey,

When connecting an 8Bitdo GBros adapter through USB, with a third-party 
GameCube controller, and the XInput mode selected, the pad isn't
detected as an XBox 360 gamepad, just a USB device.

Should xpad refuse to handle it? I didn't see xpad or hid related
messages in the kernel messages.

udevadm info and lsusb for the device below.

Cheers

P: /devices/pci0000:00/0000:00:14.0/usb3/3-1
N: bus/usb/003/011
L: 0
E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb3/3-1
E: SUBSYSTEM=usb
E: DEVNAME=/dev/bus/usb/003/011
E: DEVTYPE=usb_device
E: DRIVER=usb
E: PRODUCT=45e/28e/114
E: TYPE=255/255/255
E: BUSNUM=003
E: DEVNUM=011
E: MAJOR=189
E: MINOR=266
E: USEC_INITIALIZED=195367825
E: ID_VENDOR=8Bitdo
E: ID_VENDOR_ENC=8Bitdo\x20
E: ID_VENDOR_ID=045e
E: ID_MODEL=Controller
E: ID_MODEL_ENC=Controller
E: ID_MODEL_ID=028e
E: ID_REVISION=0114
E: ID_SERIAL=8Bitdo_Controller_157F8F8
E: ID_SERIAL_SHORT=157F8F8
E: ID_BUS=usb
E: ID_USB_INTERFACES=:ff5d01:ff5d03:ff5d02:fffd13:
E: ID_VENDOR_FROM_DATABASE=Microsoft Corp.
E: ID_MODEL_FROM_DATABASE=Xbox360 Controller
E: ID_PATH=pci-0000:00:14.0-usb-0:1
E: ID_PATH_TAG=pci-0000_00_14_0-usb-0_1

Bus 003 Device 011: ID 045e:028e Microsoft Corp. Xbox360 Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass       255 Vendor Specific Subclass
  bDeviceProtocol       255 Vendor Specific Protocol
  bMaxPacketSize0         8
  idVendor           0x045e Microsoft Corp.
  idProduct          0x028e Xbox360 Controller
  bcdDevice            1.14
  iManufacturer           1 (error)
  iProduct                2 Controller
  iSerial                 3 (error)
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0099
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     93 
      bInterfaceProtocol      1 
      iInterface              0 
      ** UNRECOGNIZED:  11 21 00 01 01 25 81 14 00 00 00 00 13 01 08 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               4
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           4
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     93 
      bInterfaceProtocol      3 
      iInterface              0 
      ** UNRECOGNIZED:  1b 21 00 01 01 01 82 40 01 02 20 16 83 00 00 00 00 00 00 16 03 00 00 00 00 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               2
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               4
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval              64
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval              16
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     93 
      bInterfaceProtocol      2 
      iInterface              0 
      ** UNRECOGNIZED:  09 21 00 01 01 22 84 07 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval              16
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    253 
      bInterfaceProtocol     19 
      iInterface              4 (error)
      ** UNRECOGNIZED:  06 41 00 01 01 03
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
  (Bus Powered)

