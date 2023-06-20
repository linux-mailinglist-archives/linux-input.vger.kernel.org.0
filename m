Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D29736DF0
	for <lists+linux-input@lfdr.de>; Tue, 20 Jun 2023 15:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjFTNxT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jun 2023 09:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbjFTNxJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jun 2023 09:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C8F198A
        for <linux-input@vger.kernel.org>; Tue, 20 Jun 2023 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687269079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=Hy9gkOfh3huhALkpHesliQUTstLuxm1LK3/xl+eM2bo=;
        b=N8LTLRs78MKz6143O4EW9b+H4FZTcxndMBO13/DuUH+73krJVIb/Y5wq7+ETdczgO7VjWA
        POnR6Vh/Smd/pu6cSN5hO5+FFztSUThg3qPlLR79NzwWT2psb+rPIB5cHKOoFrXeAJU3AC
        K0U68ffG3T2UOghwQ1LojTmDi3auP+M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-Z2xkUN4vNyufgoOK1dxpNw-1; Tue, 20 Jun 2023 09:51:16 -0400
X-MC-Unique: Z2xkUN4vNyufgoOK1dxpNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B4EE2A59551;
        Tue, 20 Jun 2023 13:51:15 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.226.163])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C42940462B6;
        Tue, 20 Jun 2023 13:51:13 +0000 (UTC)
Date:   Tue, 20 Jun 2023 15:51:10 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <ndmq5lfkkjm4hkxv7423wz2esculnk3rfmxewnxav673tgssbr@dxsfytvyrepf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99a679e8-6b01-6805-1e33-ce02485e0063@polimi.it>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi Marco,

[adding Peter Hutterer in Cc, he always has good insights]


On Jun 20 2023, Marco Morandini wrote:
> 
> This patch adds an introduction about HID
> meant for the casual programmers that is trying
> either to fix his device or to understand what
> is going wrong

You are missing your signed-off-by line here :)

> ---
>  Documentation/hid/hidintro.rst | 558 +++++++++++++++++++++++++++++++++
>  Documentation/hid/index.rst    |   1 +
>  2 files changed, 559 insertions(+)
>  create mode 100644 Documentation/hid/hidintro.rst
> 
> diff --git a/Documentation/hid/hidintro.rst b/Documentation/hid/hidintro.rst
> new file mode 100644
> index 000000000000..96afb8d807a6
> --- /dev/null
> +++ b/Documentation/hid/hidintro.rst
> @@ -0,0 +1,558 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================
> +Introduction to HID report descriptors
> +======================================
> +
> +This chapter is meant to give a broad overview
> +of what HID report descriptors are, and of how a casual (non kernel)
> +programmer can deal with an HID device that
> +is not working well with Linux.
> +
> +.. contents::
> +    :local:
> +    :depth: 2
> +
> +
> +Introduction
> +============
> +
> +HID stands for Human Interface Device, and can be whatever device
> +you are using to interact with a computer, be it a mouse,
> +a touchpad, a tablet, a microphone.
> +
> +Many HID work out the box, even if their hardware is different.

FWIW, I always refer to a device following the HID standard to a "HID
device". It's 2 times "device"", but HID has become just an acronym in my
head and refers to the protocol. So not saying "HID device", makes my
reading stop on this, but it's technically correct?

> +For example, mouses can have a different number of buttons; they

s/mouses/mice/

> +can have (or not) a wheel; their movement sensitivity can be
> +significantly different, and so on. Nonetheless,
> +most of the time everything just works, without the need
> +to have specialized code in the kernel for any mouse model
> +developed since 1970.
> +
> +This is because most (if not all) of the modern HIDs do advertise
> +the number and type of signal that can be exchanged, and
> +describe how such signal are exchanged with the computer
> +by means of *HID events*.
> +This is done through the *HID report descriptor*, basically a bunch of numbers
> +that allow the operating system to understand that the mouse at hand
> +has (say) five rather than three buttons.
> +
> +The HID subsystem is in charge of parsing the HID report descriptors,
> +and of converts HID events into normal input
> +device interfaces (see Documentation/hid/hiddev.rst).

hiddev is deprecated I would say. There are still a few users, but I'm
not sure they are quite actively developping products. hidraw is what
you want when you want to talk to the HID devices at the raw level, and
evdev (/dev/input/event*) is what libinput and Xorg consume.

> +Whenever something does not work as it should this can be
> +because the HID report descriptor provided by the device is wrong,
> +or because it needs to be dealt with in a special way,
> +or because the some special device or interaction mode
> +is not handled by the default code.
> +
> +The format of HID report descriptors is described by two documents,
> +available from the `USB Implementers Forum <https://www.usb.org/>`_
> +at `this <https://www.usb.org/hid>`_ addresses:
> +
> + * the `HID USB Device Class Definition <https://www.usb.org/document-library/device-class-definition-hid-111>`_ (HIDUDC from now on)
> + * the `HID Usage Tables <https://usb.org/document-library/hid-usage-tables-14>`_ (HIDUT from now on)
> +
> +This does not means that the HID subsystem can deal with USB devices only;
> +rather, different transport drivers, such as I2C or Bluetooth, can be dealt
> +with, see Documentation/hid/hid-transport.rst.
> +
> +Parsing an HID descriptor
> +=========================
> +
> +The current list of HID devices can be found at ``/sys/bus/hid/devices/``.
> +For each device, say ``/sys/bus/hid/devices/0003\:093A\:2510.0002/``,
> +one can read the corresponding report descriptor::
> +
> +  marco@sun:~> hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
> +  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
> +  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
> +  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
> +  00000030  81 06 c0 c0                                       |....|
> +  00000034
> +
> +Alternatively, the HID report descriptor can be read by accessig the hidraw
> +driver, see Documentation/output/hid/hidraw.rst and
> +file samples/hidraw/hid-example.c for a simple example.
> +The output of ``hid-example`` would be, for the same device::
> +
> +  marco@sun:~> sudo ./hid-example
> +  Report Descriptor Size: 52
> +  Report Descriptor:
> +  5 1 9 2 a1 1 9 1 a1 0 5 9 19 1 29 3 15 0 25 1 75 1 95 3 81 2 75 5 95 1 81 1 5 1 9 30 9 31 9 38 15 81 25 7f 75 8 95 3 81 6 c0 c0
> +
> +  Raw Name: PixArt USB Optical Mouse
> +  Raw Phys: usb-0000:05:00.4-2.3/input0
> +  Raw Info:
> +          bustype: 3 (USB)
> +          vendor: 0x093a
> +          product: 0x2510
> +  HIDIOCSFEATURE: Broken pipe
> +  HIDIOCGFEATURE: Broken pipe
> +  Error: 32
> +  write: Broken pipe
> +  read: Resource temporarily unavailable
> +
> +The basic structure of a HID report descriptor is defined in the HIDUDC manual, while
> +HIDUT "defines constants that can be interpreted by an application to
> +identify the purpose and meaning of a data
> +field in a HID report". Each entry is defined by at least two bytes,
> +where the first one defines what type of value is following,
> +and is described in the HIDUDC manual,
> +and the second one carries the actual value,
> +and is described in the HIDUT manual.

I think the next part up to the various tools that allow to decode the report descriptors
is interesting, but should probably be in a separate file, or in a footnote.

IMO, what matters here is:
- it's a "simple" language defined in those 2 documents
- it's working as a stack: each elements adds to the previous, and
  summing everything gives you the overview (there are subtleties of
  course)
- noone should ever try to read it by hand, there are tools :)
- in case there is something wrong in the report descriptor, then yes
  you'll need that explanation, but it's probably too early in the doc
  to explain this IMO


> +
> +Let consider the first number, 0x05: according to
> +HIDUDC, Sec. 6.2.2.2, "Short Items"
> +
> + * the first least significant two bits
> +   define the number of the following data bytes (either 0, 1, 2 or 4
> +   for the values 0, 1, 2 or 3, respectively)
> + * the second least significant two bits identify the type of the item:
> +
> +   * 0: ``Main``
> +   * 1: ``Global``
> +   * 2: ``Local``
> +   * 3: ``Reserved``
> + * the remaining four bits give a numeric expression specifying
> +   the function of the item (see below);
> +
> +This means that ``0x05`` (i.e. ``00000101``) stands for
> +1 byte of data to be read, and Global type.
> +Since we are dealing with a Global item the meaning
> +of the most significant four bits
> +is defines in HIDUC manual, Sec. 6.2.2.7, "Global Items".
> +The bits are ``0000``, thus we have a ``Usage Page``.
> +
> +
> +The second number is the actual data, and its meaning can
> +be found in the HICUT manual.
> +We have an ``Usage Page``, thus we need to refer to HICUT Sec. 3,
> +"Usage Pages"; from there, it is clear that the ``0x01``
> +stands for a ``Generic Desktop Page``.
> +
> +Moving now to the second two bytes, and following the same scheme, ``0x09``
> +(i.e. ``00001001``) will be followed by one byte (``01``)
> +and is a ``Local`` item.
> +Thus, the meaning of the remaining four bits (``0000``)
> +is given in HIDUDC Sec. 6.2.2.8 "Local Items", so that we have an ``Usage``.
> +
> +In this way the HID report descriptor can be painstakingly
> +parsed, byte by byte. In practice you need not to do this,
> +and almost no one does
> +this: everyone resorts to specialized parsers. Among all the available ones
> +
> +  * the online `USB Descriptor and Request Parser
> +    <http://eleccelerator.com/usbdescreqparser/>`_;
> +  * `hidrdd <https://github.com/abend0c1/hidrdd>`_,
> +    that provides very detailed and somewhat verbose descriptions
> +    (verbosity can be useful if you are not familiar with HID report descriptors);
> +  * `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_,
> +    a complete utility set that allows, among other things,
> +    to record and replay the raw HID reports and to debug
> +    and replay HID devices.
> +    It is being actively developed by the Linux HID subsystem mantainers.
> +
> +.. Parsing the mouse HID report descriptor with `hidrdd <https://github.com/abend0c1/hidrdd>`_ one gets::

Maybe I'm too biased, but why adding the hidrdd output when you also have
the one from hid-tools?

> +
> +  marco@sun:~> rexx ./rd.rex -x -d --hex 05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03 15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01 05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03 81 06 c0 c0
> +
> +  //--------------------------------------------------------------------------------
> +  // Report descriptor data in hex (length 52 bytes)
> +  //--------------------------------------------------------------------------------
> +
> +
> +  // 05010902 A1010901 A1000509 19012903 15002501 75019503 81027505 95018101
> +  // 05010930 09310938 1581257F 75089503 8106C0C0
> +
> +
> +  //--------------------------------------------------------------------------------
> +  // Decoded Application Collection
> +  //--------------------------------------------------------------------------------
> +
> +  /*
> +  05 01        (GLOBAL) USAGE_PAGE         0x0001 Generic Desktop Page
> +  09 02        (LOCAL)  USAGE              0x00010002 Mouse (Application Collection)
> +  A1 01        (MAIN)   COLLECTION         0x01 Application (Usage=0x00010002: Page=Generic Desktop Page, Usage=Mouse, Type=Application Collection)
> +  09 01          (LOCAL)  USAGE              0x00010001 Pointer (Physical Collection)
> +  A1 00          (MAIN)   COLLECTION         0x00 Physical (Usage=0x00010001: Page=Generic Desktop Page, Usage=Pointer, Type=Physical Collection)
> +  05 09            (GLOBAL) USAGE_PAGE         0x0009 Button Page
> +  19 01            (LOCAL)  USAGE_MINIMUM      0x00090001 Button 1 Primary/trigger (Selector, On/Off Control, Momentary Control, or One Shot Control)
> +  29 03            (LOCAL)  USAGE_MAXIMUM      0x00090003 Button 3 Tertiary (Selector, On/Off Control, Momentary Control, or One Shot Control)
> +  15 00            (GLOBAL) LOGICAL_MINIMUM    0x00 (0)  <-- Info: Consider replacing 15 00 with 14
> +  25 01            (GLOBAL) LOGICAL_MAXIMUM    0x01 (1)
> +  75 01            (GLOBAL) REPORT_SIZE        0x01 (1) Number of bits per field
> +  95 03            (GLOBAL) REPORT_COUNT       0x03 (3) Number of fields
> +  81 02            (MAIN)   INPUT              0x00000002 (3 fields x 1 bit) 0=Data 1=Variable 0=Absolute 0=NoWrap 0=Linear 0=PrefState 0=NoNull 0=NonVolatile 0=Bitmap
> +  75 05            (GLOBAL) REPORT_SIZE        0x05 (5) Number of bits per field
> +  95 01            (GLOBAL) REPORT_COUNT       0x01 (1) Number of fields
> +  81 01            (MAIN)   INPUT              0x00000001 (1 field x 5 bits) 1=Constant 0=Array 0=Absolute
> +  05 01            (GLOBAL) USAGE_PAGE         0x0001 Generic Desktop Page
> +  09 30            (LOCAL)  USAGE              0x00010030 X (Dynamic Value)
> +  09 31            (LOCAL)  USAGE              0x00010031 Y (Dynamic Value)
> +  09 38            (LOCAL)  USAGE              0x00010038 Wheel (Dynamic Value)
> +  15 81            (GLOBAL) LOGICAL_MINIMUM    0x81 (-127)
> +  25 7F            (GLOBAL) LOGICAL_MAXIMUM    0x7F (127)
> +  75 08            (GLOBAL) REPORT_SIZE        0x08 (8) Number of bits per field
> +  95 03            (GLOBAL) REPORT_COUNT       0x03 (3) Number of fields
> +  81 06            (MAIN)   INPUT              0x00000006 (3 fields x 8 bits) 0=Data 1=Variable 1=Relative 0=NoWrap 0=Linear 0=PrefState 0=NoNull 0=NonVolatile 0=Bitmap
> +  C0             (MAIN)   END_COLLECTION     Physical
> +  C0           (MAIN)   END_COLLECTION     Application
> +  */
> +
> +  // All structure fields should be byte-aligned...
> +  #pragma pack(push,1)
> +
> +  //--------------------------------------------------------------------------------
> +  // Button Page inputReport (Device --> Host)
> +  //--------------------------------------------------------------------------------
> +
> +  typedef struct
> +  {
> +                                                       // No REPORT ID byte
> +                                                       // Collection: CA:Mouse CP:Pointer
> +    uint8_t  BTN_MousePointerButton1 : 1;              // Usage 0x00090001: Button 1 Primary/trigger, Value = 0 to 1
> +    uint8_t  BTN_MousePointerButton2 : 1;              // Usage 0x00090002: Button 2 Secondary, Value = 0 to 1
> +    uint8_t  BTN_MousePointerButton3 : 1;              // Usage 0x00090003: Button 3 Tertiary, Value = 0 to 1
> +    uint8_t  : 5;                                      // Pad
> +    int8_t   GD_MousePointerX;                         // Usage 0x00010030: X, Value = -127 to 127
> +    int8_t   GD_MousePointerY;                         // Usage 0x00010031: Y, Value = -127 to 127
> +    int8_t   GD_MousePointerWheel;                     // Usage 0x00010038: Wheel, Value = -127 to 127
> +  } inputReport_t;
> +
> +  #pragma pack(pop)
> +
> +Parsing the mouse HID report descriptor with `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_ leads to::
> +
> +  marco@sun:~/Programmi/linux/hid-tools (master =)> ./hid-decode /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
> +  # device 0:0
> +  # 0x05, 0x01, 		   // Usage Page (Generic Desktop)	  0
> +  # 0x09, 0x02, 		   // Usage (Mouse)			  2
> +  # 0xa1, 0x01, 		   // Collection (Application)  	  4
> +  # 0x09, 0x01, 		   //  Usage (Pointer)  		  6
> +  # 0xa1, 0x00, 		   //  Collection (Physical)		  8
> +  # 0x05, 0x09, 		   //	Usage Page (Button)		  10
> +  # 0x19, 0x01, 		   //	Usage Minimum (1)		  12
> +  # 0x29, 0x03, 		   //	Usage Maximum (3)		  14
> +  # 0x15, 0x00, 		   //	Logical Minimum (0)		  16
> +  # 0x25, 0x01, 		   //	Logical Maximum (1)		  18
> +  # 0x75, 0x01, 		   //	Report Size (1) 		  20
> +  # 0x95, 0x03, 		   //	Report Count (3)		  22
> +  # 0x81, 0x02, 		   //	Input (Data,Var,Abs)		  24
> +  # 0x75, 0x05, 		   //	Report Size (5) 		  26
> +  # 0x95, 0x01, 		   //	Report Count (1)		  28
> +  # 0x81, 0x01, 		   //	Input (Cnst,Arr,Abs)		  30
> +  # 0x05, 0x01, 		   //	Usage Page (Generic Desktop)	  32
> +  # 0x09, 0x30, 		   //	Usage (X)			  34
> +  # 0x09, 0x31, 		   //	Usage (Y)			  36
> +  # 0x09, 0x38, 		   //	Usage (Wheel)			  38
> +  # 0x15, 0x81, 		   //	Logical Minimum (-127)  	  40
> +  # 0x25, 0x7f, 		   //	Logical Maximum (127)		  42
> +  # 0x75, 0x08, 		   //	Report Size (8) 		  44
> +  # 0x95, 0x03, 		   //	Report Count (3)		  46
> +  # 0x81, 0x06, 		   //	Input (Data,Var,Rel)		  48
> +  # 0xc0,			   //  End Collection			  50
> +  # 0xc0,			   // End Collection			  51
> +  #
> +  R: 52 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 03 15 00 25 01 75 01 95 03 81 02 75 05 95 01 81 01 05 01 09 30 09 31 09 38 15 81 25 7f 75 08 95 03 81 06 c0 c0
> +  N: device 0:0
> +  I: 3 0001 0001
> +
> +From it we undesratnd that
> +
> + * the mouse has three (from ``Usage Minimum (1)`` to
> +   ``Usage Maximum (3)``) buttons (``Usage Page (Button)``);
> + * buttons can take values ranging from ``0`` to ``1``;
> +   (from ``Logical Minimum (0)`` to ``Logical Maximum (1)``);
> + * information is encoded into three bits: one bit has
> +   ``Report Size (1)``,
> +   but there are three of them since ``Report Count (3)``;
> + * the value of these bits can change
> +   (``Data`` in ``Input (Data,Var,Abs)``);
> + * each field represents data from a physical control;
> + * the number of bits reserved for each field is determined
> +   by the preceding ``Report Size``/``Report Count``
> +   items (``Var`` in ``Input (Data,Var,Abs)``);
> + * the data is *absolute* (i.e it does not represent the
> +   change from the last report, ``Abs`` in ``Input (Data,Var,Abs)``).
> +
> +The meaning of the ``Input``
> +items is explained in HIDUDC Sec. 6.2.2.5 "Input, Output, and Feature Items.
> +
> +There are five additional padding bits, that are needed
> +to reach a byte: see ``Report Size (5)``, that is
> +repeated only once (``Report Count (1)``).
> +These bits take *constant* values (``Cnst`` in
> +``Input (Cnst,Arr,Abs)``).
> +
> +The mouse has also two physical positions (``Usage (X)``, ``Usage (Y)``) and a wheel
> +(``Usage (Wheel)``).
> +
> +Each of them take values ranging from ``-127`` to ``127``
> +(from ``Logical Minimum (-127)`` to ``Logical Maximum (-127)``),
> +it is represented by eight bits (``Report Size (8)``)
> +and there are three of these set of bits (``Report Count (3)``).
> +
> +This time the data do represent the change from the previous configuration
> +(``Rel`` in ``Input (Data,Var,Rel)``).
> +
> +All in all, the mouse input will be transmitted using four bytes:
> +the first one for the buttons (three bits used, five for padding),
> +the last three for the mouse X, Y and wheel changes, respectively.
> +
> +Indeed, for any event, the mouse will send a *report* of four bytes.
> +We can easily check the values sent by resorting e.g.
> +to the `hid-recorder` tool, from `hid-tools
> +<https://gitlab.freedesktop.org/libevdev/hid-tools>`_:
> +The sequence of bytes sent by clicking and releasing
> +button 1, then button 2, then button 3 is::
> +
> +  marco@sun:~/> sudo ./hid-recorder /dev/hidraw1
> +
> +  ....
> +  output of hid-decode
> +  ....
> +
> +  #  Button: 1  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
> +  E: 000000.000000 4 01 00 00 00
> +  #  Button: 0  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
> +  E: 000000.183949 4 00 00 00 00
> +  #  Button: 0  1  0 | # | X:	 0 | Y:    0 | Wheel:	 0
> +  E: 000001.959698 4 02 00 00 00
> +  #  Button: 0  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
> +  E: 000002.103899 4 00 00 00 00
> +  #  Button: 0  0  1 | # | X:	 0 | Y:    0 | Wheel:	 0
> +  E: 000004.855799 4 04 00 00 00
> +  #  Button: 0  0  0 | # | X:    0 | Y:    0 | Wheel:    0
> +  E: 000005.103864 4 00 00 00 00
> +
> +where it's clear that, for example, when button 2 is clicked
> +the bytes ``02 00 00 00`` are sent, and the immediately subsequent
> +event (``00 00 00 00``) is the release of button 2 (no buttons are pressed,
> +remember that the data is *absolute*).
> +
> +If instead one clicks and holds button 1, then clicks and holds button 2,
> +releases button 1, and finally releases button 2, the reports are::
> +
> +  #  Button: 1  0  0 | # | X:    0 | Y:    0 | Wheel:    0
> +  E: 000044.175830 4 01 00 00 00
> +  #  Button: 1  1  0 | # | X:    0 | Y:    0 | Wheel:    0
> +  E: 000045.975997 4 03 00 00 00
> +  #  Button: 0  1  0 | # | X:    0 | Y:    0 | Wheel:    0
> +  E: 000047.407930 4 02 00 00 00
> +  #  Button: 0  0  0 | # | X:    0 | Y:    0 | Wheel:    0
> +  E: 000049.199919 4 00 00 00 00
> +
> +where with ``03 00 00 00`` both buttons are pressed, and with the
> +subsequent ``02 00 00 00`` button 1 is released while button 2 is still
> +active.
> +
> +Outputs and Inputs
> +------------------
> +
> +An HID devices can have inputs, like
> +in the mouse example, and outputs.
> +"Output" means that the information is fed
> +from the device to the human; for examples,

The other way around: outputs are from the host (computer/human) to the
device, when input is from the device to the host.

> +a joystick with force feedback will have
> +some output.

There are also Features, which is a side channel configuration of the
device from the host to the device.

Most of the time Features have a state (are you using high reslution
wheel events?) and can be queried from the host. Most of the time :)

> +
> +
> +Report IDs and Evdev events
> +===========================
> +
> +A single device can logically group
> +data into different, independent sets.
> +It is *as if* the HID presents
> +itself as different devices, each exchanging
> +its own data. The HID report descriptor is unique,
> +but the different reports are identified by means
> +of different ``Report ID`` fields. Whenever a ``Report ID``
> +is needed it is transmitted as the first byte of any report.

I wouldn't say this like that.

The following is an attempt to explain to you the slight difference
between collections and report IDs, so it should not be taken verbatim
in the doc.

You can group data by using "Collections". Each collection has a type
and purpose. You have "application" collections, "physical" collections
and "logical" collections. For each you can assign a purpose: for
example a touchpanel that exports a touchscreen and a stylus would
export 2 application collections of "Touchscreen" and "Pen".

But then to be able to differentiate those collections, we have the
"Report ID", which is handled specifically in the HID standard as the
first byte (when defined) associated to a collection.

But given that collections can be stacked, there is not a 1-to-1
relation between Report IDs and all defined collection.

> +
> +Consider the following HID report descriptor::
> +
> +  05 01 09 02 A1 01 85 01 05 09 19 01 29 05 15 00
> +  25 01 95 05 75 01 81 02 95 01 75 03 81 01 05 01
> +  09 30 09 31 16 00 F8 26 FF 07 75 0C 95 02 81 06
> +  09 38 15 80 25 7F 75 08 95 01 81 06 05 0C 0A 38
> +  02 15 80 25 7F 75 08 95 01 81 06 C0 05 01 09 02
> +  A1 01 85 02 05 09 19 01 29 05 15 00 25 01 95 05
> +  75 01 81 02 95 01 75 03 81 01 05 01 09 30 09 31
> +  16 00 F8 26 FF 07 75 0C 95 02 81 06 09 38 15 80
> +  25 7F 75 08 95 01 81 06 05 0C 0A 38 02 15 80 25
> +  7F 75 08 95 01 81 06 C0 05 01 09 07 A1 01 85 05
> +  05 07 15 00 25 01 09 29 09 3E 09 4B 09 4E 09 E3
> +  09 E8 09 E8 09 E8 75 01 95 08 81 02 95 00 81 01
> +  C0 05 0C 09 01 A1 01 85 06 15 00 25 01 75 01 95
> +  01 09 3F 81 06 09 3F 81 06 09 3F 81 06 09 3F 81
> +  06 09 3F 81 06 09 3F 81 06 09 3F 81 06 09 3F 81
> +  06 C0 05 0C 09 01 A1 01 85 03 09 05 15 00 26 FF
> +  00 75 08 95 02 B1 02 C0
> +
> +After parsing it (try to parse it on your own using
> +the suggested tools!)
> +one can see that the device presents two mouses

s/mouses/mice/

> +(Reports IDs 1 and 2, respectively),
> +a Keypad (Report ID 5) and two consumer controls
> +(Report IDs 6 and 3).
> +The data sent for each of these report ids
> +will begin with the Report ID byte, and will be followed
> +by the corresponding information. For example, the
> +report defined for the last consumer
> +control::
> +
> +  0x05, 0x0C,        // Usage Page (Consumer)
> +  0x09, 0x01,        // Usage (Consumer Control)
> +  0xA1, 0x01,        // Collection (Application)
> +  0x85, 0x03,        //   Report ID (3)
> +  0x09, 0x05,        //   Usage (Headphone)
> +  0x15, 0x00,        //   Logical Minimum (0)
> +  0x26, 0xFF, 0x00,  //   Logical Maximum (255)
> +  0x75, 0x08,        //   Report Size (8)
> +  0x95, 0x02,        //   Report Count (2)
> +  0xB1, 0x02,        //   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)
> +  0xC0,              // End Collection
> +
> +will be of three bytes: the first for the Report ID (5), the next two
> +for the headphone, with two (``Report Count (2)``) bytes
> +(``Report Size (8)``) each ranging from 0 (``Logical Minimum (0)`` to 255
> +(``Logical Maximum (255)``).
> +
> +
> +Events
> +======
> +
> +One can expect that different ``/dev/input/event*`` are created for different
> +Report IDs. Going back to the mouse example, and repeating the sequence where
> +one clicks and holds button 1, then clicks and holds button 2,
> +releases button 1, and finally releases button 2, one gets::
> +
> +  marco@sun:~> sudo evtest /dev/input/event4

evtest has been deprecated for a while, and evemu too. Now, cool kids
are using "libinput record", but it's slightly more verbose.

Using evemu is probably better at least.

> +  Input driver version is 1.0.1
> +  Input device ID: bus 0x3 vendor 0x3f0 product 0x94a version 0x111
> +  Input device name: "PixArt HP USB Optical Mouse"
> +  Supported events:
> +    Event type 0 (EV_SYN)
> +    Event type 1 (EV_KEY)
> +      Event code 272 (BTN_LEFT)
> +      Event code 273 (BTN_RIGHT)
> +      Event code 274 (BTN_MIDDLE)
> +    Event type 2 (EV_REL)
> +      Event code 0 (REL_X)
> +      Event code 1 (REL_Y)
> +      Event code 8 (REL_WHEEL)
> +      Event code 11 (REL_WHEEL_HI_RES)
> +    Event type 4 (EV_MSC)
> +      Event code 4 (MSC_SCAN)
> +  Properties:
> +  Testing ... (interrupt to exit)
> +  Event: time 1687254626.454252, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90001
> +  Event: time 1687254626.454252, type 1 (EV_KEY), code 272 (BTN_LEFT), value 1
> +  Event: time 1687254626.454252, -------------- SYN_REPORT ------------
> +  Event: time 1687254627.342093, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90002
> +  Event: time 1687254627.342093, type 1 (EV_KEY), code 273 (BTN_RIGHT), value 1
> +  Event: time 1687254627.342093, -------------- SYN_REPORT ------------
> +  Event: time 1687254627.974282, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90001
> +  Event: time 1687254627.974282, type 1 (EV_KEY), code 272 (BTN_LEFT), value 0
> +  Event: time 1687254627.974282, -------------- SYN_REPORT ------------
> +  Event: time 1687254628.798240, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90002
> +  Event: time 1687254628.798240, type 1 (EV_KEY), code 273 (BTN_RIGHT), value 0
> +  Event: time 1687254628.798240, -------------- SYN_REPORT ------------
> +
> +
> +When everything works well
> +==========================
> +
> +* The HID report descriptor makes sense;

i.e. the current tools are capable of making some sense out of it :)

> +* It is possible to verify, by reading the raw hid data, that
> +  the HID report descriptor *does  match* what is sent by the device;

nitpick: extra space between "does" and "match"

> +* The HID report descriptor does not need any "quirk"s (see later on)
> +* For any Report ID a corresponding ``/dev/input/event*`` is created,
> +  and the events there match what you would expect

That last point is not stricly correct. Currently, each application
collection gets its own input node. You can have a collection with
several report IDs because they are all using the same device but a
different language.

> +
> +When something does not work
> +============================
> +
> +Sometimes not everything does work as it should.

*not everything works

> +
> +Quirks
> +------
> +
> +A possible reason is that the HID
> +has some common quirk. Should this be the case,
> +it sould be enough to add the required quirk,
> +in the kernel, for the device at hand.
> +This can be done in file drivers/hid/hid-quirks.c .
> +How to do it should be straightforward after looking into the file.
> +
> +The list of currently defined quirks, from
> +include/linux/hid.h , is
> +
> + * ``HID_QUIRK_NOTOUCH``, defined as ``BIT(1)``:
> + * ``HID_QUIRK_IGNORE``, defined as ``BIT(2)``:
> + * ``HID_QUIRK_NOGET``, defined as ``BIT(3)``:
> + * ``HID_QUIRK_HIDDEV_FORCE``, defined as ``BIT(4)``:
> + * ``HID_QUIRK_BADPAD``, defined as ``BIT(5)``:
> + * ``HID_QUIRK_MULTI_INPUT``, defined as ``BIT(6)``:
> + * ``HID_QUIRK_HIDINPUT_FORCE``, defined as ``BIT(7)``:
> + * ``HID_QUIRK_ALWAYS_POLL``, defined as ``BIT(10)``:
> + * ``HID_QUIRK_INPUT_PER_APP``, defined as ``BIT(11)``:
> + * ``HID_QUIRK_X_INVERT``, defined as ``BIT(12)``:
> + * ``HID_QUIRK_Y_INVERT``, defined as ``BIT(13)``:
> + * ``HID_QUIRK_SKIP_OUTPUT_REPORTS``, defined as ``BIT(16)``:
> + * ``HID_QUIRK_SKIP_OUTPUT_REPORT_ID``, defined as ``BIT(17)``:
> + * ``HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP``, defined as ``BIT(18)``:
> + * ``HID_QUIRK_HAVE_SPECIAL_DRIVER``, defined as ``BIT(19)``:
> + * ``HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE``, defined as ``BIT(20)``:
> + * ``HID_QUIRK_FULLSPEED_INTERVAL``, defined as ``BIT(28)``:
> + * ``HID_QUIRK_NO_INIT_REPORTS``, defined as ``BIT(29)``:
> + * ``HID_QUIRK_NO_IGNORE``, defined as ``BIT(30)``:
> + * ``HID_QUIRK_NO_INPUT_SYNC``, defined as ``BIT(31)``:

We should definitely include the doc directly in hid.h and include it
there. I already explained why in the cover letter.

But moreover, quirks are supposed to be the exception. If we are adding
too many quirks, and that the same devices work on Windows without a
special handling, that means that the quirk should be analyzed, and we
should probably rethink the processing of the HID devices to not have
this quirk.


> +
> +
> +FIXME: ADD A SHORT EXPLANATION FOR EACH QUIRK
> +
> +Quirks for USB devices can be specified run-time,
> +see ``modinfo usbhid``, although the proper fix
> +should go into hid-quirks.c and be submitted upstream.
> +Quirks for other busses need to go into hid-quirks.c
> +
> +Fixing the HID report descriptor
> +--------------------------------
> +
> +Should you need to patch the HID report descriptor
> +the easiest way is to resort to eBPF, as described
> +in Documentation/output/hid/hid-bpf.rst.
> +
> +Basically, you can change any byte of the original report descriptor.
> +The examples in samples/hid should be relatively straightforward,
> +see e.g. samples/hid_mouse.bpf.c::
> +
> +  SEC("fmod_ret/hid_bpf_rdesc_fixup")
> +  int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
> +  {
> +    ....
> +       data[39] = 0x31;
> +       data[41] = 0x30;
> +    return 0;
> +  }

If you ever do that, please share your code on the LKML. The current
background work is to integrate those hid-bpf programs in the kernel
directly, so that we can share them with everyone without resorting to a
third party userspace program.

> +
> +Of course this can be also done within the kernel source
> +code, see e.g. drivers/hid/hid-aureal.c or
> +drivers/hid/hid-samsung.c for a slightly more complex file.
> +
> +
> +
> +Modifying on the fly the transmitted data
> +-----------------------------------------
> +
> +It is also possible, always using eBPF, to modify
> +on the fly the data exchanged with the device.
> +See, again, the examples is samples/hid.
> +
> +Writing a specialized driver
> +----------------------------
> +
> +This should really be your last resort.

YES, definitely YES :)

> +
> diff --git a/Documentation/hid/index.rst b/Documentation/hid/index.rst
> index b2028f382f11..af02cf7cfa82 100644
> --- a/Documentation/hid/index.rst
> +++ b/Documentation/hid/index.rst
> @@ -7,6 +7,7 @@ Human Interface Devices (HID)
>  .. toctree::
>     :maxdepth: 1
>  
> +   hidintro
>     hiddev
>     hidraw
>     hid-sensor
> -- 
> 2.41.0
> 
> 
> 

Cheers,
Benjamin

