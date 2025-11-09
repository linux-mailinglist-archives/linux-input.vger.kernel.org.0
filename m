Return-Path: <linux-input+bounces-15961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FEC4429D
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 17:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2B574E179D
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 16:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3858303C9A;
	Sun,  9 Nov 2025 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bgf26+4P"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8899D2FFF94
	for <linux-input@vger.kernel.org>; Sun,  9 Nov 2025 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762706686; cv=none; b=dUiuGQiAAztUCHs84snuFS5O0LUhAynZ2Zw+2xkXApTEJNRTC/8qc0Z2+bfNO7W+J1ZupIsm2YM5AFdZG1rIQYeMbs23dYCcTfjnBjLUIXp8lxLAKk7JFsypNIK+er1r5N6CNpzAUqggwCK286Og3T3Q5HoXHPVLplcwbgFIKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762706686; c=relaxed/simple;
	bh=T9Ke37q1blzhIFNU4yWBdJQY+o2HquIvgIQNKptQCb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzX5l1ryhAQgcxfJhzSrk0kXrQF4y0r2uPFi9g40K8dipL1uE9XMps77EyV8zfuFhKiraW88KG00UE3sew4pymqCAUBJAAhq8xadnJiEc4BiBCNj3fqbW5Pxq4AMqewsZ3XV0yZFtnxndzbWLJTcQmqWK6kgOv97we13BQemM74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bgf26+4P; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429b7ba208eso1182712f8f.1
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762706683; x=1763311483; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HCyYXc9LVmJr78gnoy6ZWRtzDAPRetEymWAMcrJuyUo=;
        b=Bgf26+4Ppv/K4M92HTxFX/5p2EMjjYYciUGb9Ze+WvaWFjuTpLBF+1SnWeO7bwUM/P
         rnzLNJnIQCFP2IfYNhS27lG49kB2LwuIwc2sHy/NOO72e/qNAhdpEkCcLyOKuPrtx3pU
         h2UUZQSDUB6qzqtuAWSSUoSObKfFuFo4qGIPjetCyk6zm1pC2WPYLuf7q09zQBuVELl1
         PY9UDOgUzR5Q29NT1quUf9HpJ3wae3ejCgyiRxtku83J6F/8mOJoNMHBxSbzq/PK5c1t
         HWXpTmKm6BXZdNDZLWdZ4UfYo8jRxjPvpENiknYSqSkfxWBi8Q5ENvHILSJSSfd9/orp
         vlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762706683; x=1763311483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCyYXc9LVmJr78gnoy6ZWRtzDAPRetEymWAMcrJuyUo=;
        b=EtU2phGGHlRWWI39P4EekmYC1fAiKkBaKv80TJQangp0AnCSWZ0aZLBUzsLKpNsCGj
         rDyaoSu+m6OvJmuqVaDuMX3dMPP4bwEp69gclno6839HyRxY4jJ8sEYo3pQJ3JA7Ua5e
         Jo3Sjbb5pXw95wl9QIYIFX5IU1i/JlDklEs5s83c+nnCqe6FXnky++PFhNbXfELNZs4B
         1SMfl5dWkObZd+A60GB0P1C77gXFX++C65S4qlP+OPb/+wtGps14k+oiquFkxfsjXA7s
         v4Rt28opNUcLMLJT1LOD0SsyjWqK0PvhdZUyul31oJFwaT2dj+3vGV66bGuRELlmPp3v
         y9pw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Hu7i6omBkFsUEyYeYT84E+4LDQO0RYTpx4h7ryyUD5Ir5fL+Xif6fX153+pIT2psBLNp43wHIqUnCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEbHdBOe+IFMUnOoxhzLHOi0vXNwrb2eb6s22OIfOMBxh1b7yE
	XZLcb23MCZpJ5UWTorgjbMX/zN0D7xtOdzPTrvfjJqCtf+VBWiyqIz264fCJYAHksf3Cpj8Y/sZ
	k9hLVPrZOluqD0ip0KsyS7D7ESd/3/Vs=
X-Gm-Gg: ASbGncubJFMSnLP4GRz3pirDSEctCg46zQoWe5eM7bkQUIUR6FsEl3nlLuDxHbxPAFA
	GwmgNbBPsIP/E2cV1ZDQAGE1Wer3rXoY2brwU9ZHdBpe1QHOLIRbAHfirTm8uIBmkXfrzR9cd4R
	/z+IcivpJKEB4jkI6nqBbbMvhYGFvhHf/R4DyVIGcnTSI9A0mI1epNy/PZV6CUyMuzP44zXJZ0l
	S18Z+hUNmdG2PGqAmIysyWjnLxK3Czc7/9LWhgREVvsa203Yaf/BQqKUNB0CFH0SyIjBlha3gy+
	6kl1cPKmL4OUQRd0y37X2h+WAU6O4Fyc7Z+PtfTzfdhaDc4Nq9ybtgm9SVQrYniEzCeYkMuepyw
	=
X-Google-Smtp-Source: AGHT+IEaDTluy7FCQxQQH7gcdm+3mlSy6buPkUQmXt+EW33IasKXeyFzctIj7YMree3xLgO7okGmHcZAMlz28HhJ4yw=
X-Received: by 2002:a05:6000:2001:b0:429:cdd9:807f with SMTP id
 ffacd0b85a97d-42b2dc6c80dmr4723294f8f.61.1762706682664; Sun, 09 Nov 2025
 08:44:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com> <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
In-Reply-To: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
From: The-Luga <lugathe2@gmail.com>
Date: Sun, 9 Nov 2025 13:44:31 -0300
X-Gm-Features: AWmQ_bmu_yqprT0jZjcahpr1TOqweXhviummB8HhTqJo8qLK5lOjbjigHy1yD1s
Message-ID: <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, Terry Junge <linuxsound@cosmicgizmosystems.com>, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sure!

```
>cat /sys/bus/usb/devices/3-2/bConfigurationValue

1

>sudo lsusb -v -d 2d99:a101

Bus 003 Device 027: ID 2d99:a101 Jieli Technology EDIFIER Hal0 2.0 SE
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x2d99 Jieli Technology
  idProduct          0xa101 EDIFIER Hal0 2.0 SE
  bcdDevice            1.00
  iManufacturer           1 Jieli Technology
  iProduct                2 EDIFIER Hal0 2.0 SE
  iSerial                 3 4250315A34383502
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00b6
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0
      iFunction               5 EDIFIER QR30
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              5 EDIFIER QR30
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002f
        bInCollection           1
        baInterfaceNr(0)        1
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                10
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
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                 8
        bNrInPins               1
        baSourceID(0)           2
        iSelector               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID               2
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
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0120  1x 288 bytes
        bInterval               1
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
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.00
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      33
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
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               2.01
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      66
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
Device Status:     0x0000
  (Bus Powered)

>echo 0 | sudo tee /sys/bus/usb/devices/3-2/bConfigurationValue
0
```
Here the device is disconnected (unconfigured but still physically on
the usb port).

>cat /sys/bus/usb/devices/3-2/bConfigurationValue

has no output.

```
>sudo lsusb -v -d 2d99:a101

Bus 003 Device 027: ID 2d99:a101 Jieli Technology EDIFIER Hal0 2.0 SE
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x2d99 Jieli Technology
  idProduct          0xa101 EDIFIER Hal0 2.0 SE
  bcdDevice            1.00
  iManufacturer           1 Jieli Technology
  iProduct                2 EDIFIER Hal0 2.0 SE
  iSerial                 3 4250315A34383502
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00b6
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0
      iFunction               5 EDIFIER QR30
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              5 EDIFIER QR30
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002f
        bInCollection           1
        baInterfaceNr(0)        1
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                10
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
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                 8
        bNrInPins               1
        baSourceID(0)           2
        iSelector               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID               2
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
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0120  1x 288 bytes
        bInterval               1
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
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.00
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      33
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
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               2.01
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      66
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
Device Status:     0x0000
  (Bus Powered)
```
It seems that the output of lsusb has not changed.

I also captured the usbmon when doing the `echo 0 | sudo tee
/sys/bus/usb/devices/3-2/bConfigurationValue` when the device
disconnects:

ffff8c95d9d6dc80 1216027202 C Ii:3:026:2 -108:1 0
ffff8c974d3b4240 1216048989 S Co:3:026:0 s 00 09 0000 0000 0000 0
ffff8c974d3b4240 1216049985 C Co:3:026:0 0 0

And I don't find the descriptor anymore:

```
>find /sys/devices -name "report_descriptor"

/sys/devices/platform/AMDI0010:00/i2c-0/i2c-ELAN0001:00/0018:04F3:31AD.000B/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-3/3-3:1.0/0003:048D:C966.0004/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-1/1-1.2/1-1.2.3/1-1.2.3:1.1/0003:046D:C33F.000A/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-1/1-1.2/1-1.2.3/1-1.2.3:1.0/0003:046D:C33F.0009/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.3/0003:046D:0A8F.0008/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.2/0003:046D:C548.0006/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.0/0003:046D:C548.0003/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.3/0003:046D:C548.0007/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.1/0003:046D:C548.0005/report_descriptor
```

I should mention that rotating the brightness knob in this
disconnected (unconfigured) state still triggers the reboot and
reconnects (configures) it. And Now I can see the report_descriptors
binaries again:

```
>find /sys/devices -name "report_descriptor"

/sys/devices/platform/AMDI0010:00/i2c-0/i2c-ELAN0001:00/0018:04F3:31AD.000B/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-2/3-2:1.3/0003:2D99:A101.005B/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-2/3-2:1.2/0003:2D99:A101.005A/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-3/3-3:1.0/0003:048D:C966.0004/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-1/1-1.2/1-1.2.3/1-1.2.3:1.1/0003:046D:C33F.000A/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-1/1-1.2/1-1.2.3/1-1.2.3:1.0/0003:046D:C33F.0009/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.3/0003:046D:0A8F.0008/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.2/0003:046D:C548.0006/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.0/0003:046D:C548.0003/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.3/0003:046D:C548.0007/report_descriptor
/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb1/1-2/1-2:1.1/0003:046D:C548.0005/report_descriptor

>sudo xxd /sys/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-2/3-2:1.3/0003:2D99:A101.005B/report_descriptor

00000000: 0613 ff09 01a1 0115 0026 ff00 8506 0900  .........&......
00000010: 7508 953d 9102 8507 0900 7508 953d 8102  u..=......u..=..
00000020: c006 14ff 0901 a101 1500 26ff 0085 2e09  ..........&.....
00000030: 0075 0895 3f91 0285 2f09 0075 0895 3f81  .u..?.../..u..?.
00000040: 02c0                                     ..

>sudo xxd /sys/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-2/3-2:1.2/0003:2D99:A101.005A/report_descriptor

00000000: 050c 0901 a101 1500 2501 09e9 09ea 09e2  ........%.......
00000010: 09cd 09b5 09b6 09b3 09b7 7501 9508 8142  ..........u....B
00000020: c0                                       .
```

