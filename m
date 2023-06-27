Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A87B73F431
	for <lists+linux-input@lfdr.de>; Tue, 27 Jun 2023 08:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjF0GEu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Jun 2023 02:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjF0GEt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Jun 2023 02:04:49 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E611BEB;
        Mon, 26 Jun 2023 23:04:45 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D8B9C5C0211;
        Tue, 27 Jun 2023 02:04:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 27 Jun 2023 02:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1687845884; x=1687932284; bh=0G
        cLZQNv5EVerMOgOn438ZdvfaiwtS6W8EoDrKeEJfc=; b=AgN1x2Ro2L0P8c2BjI
        PhgmnHSFCFyQ/1+b4r0/qUBKYuf1EfGKxbzOiNxa60qj/YGGiTL6RIH6SDuKYKcG
        jMHBIPkHbMVKncAChhMLRqRFE6xOW1uZo4IX99Xa0O3/tn35nZmI9WOi/91eRFbo
        +GIRDELPW33pMh9PPtbDE8dbG0H68eZZvJX+4jlkxi0BU6YsvBXM62wicN4yc7f1
        2MqorON/cVgXI9CVWvk13EzQlFl4Wo+a2DmORX13PIY0Q0bxzxOreIY/Cyv9FHaG
        Szxe8btgmJIdBlR3EhzCXPD54NSxrOU9b+OfxBkMg/cGLNK/EZAcVLFgexzsNqcV
        MR5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687845884; x=1687932284; bh=0GcLZQNv5EVer
        MOgOn438ZdvfaiwtS6W8EoDrKeEJfc=; b=MB2rsjZpZI96QJgW4Zuv4xMPpCvEX
        ns8ggPEFqhIVoIFNCX760QbO3xsNhDgMViMn52FL91RXQF3sEguF5xR9dpQz/mj6
        gLz9+Dgm3OgzydJxTj4/HEQAsHZZvLCFygui94XAlCsH6kxlgW+4plCQe7BxgzVV
        u5C70d1mvsF7CPnMKhxJSw/6bilLu0AsC1eCzKKoIYSXq+WPZxzdZKww59IE1Bi+
        O+m8skPPrsMbDR2T/NLkLJYyHitwcrS/St7deNHMYLxakfh6a1TcTM0YnRaWNFYT
        70Rx6etps6b7fWKuw+KfIjiaQuRWPfwdmFa0M9iAm1kI8hivJSOTe8FZQ==
X-ME-Sender: <xms:_HuaZCBsA7phmj9rI6zUwgWgD55bkXompCavraL4qpmNzvOal8rtkQ>
    <xme:_HuaZMjlD_wSFWnWdXVZhpmsN_iDtZavYlT3iHJreCrPdazppaDnOws7IZ7kacL7Y
    cr_GRR5wvMdEILG10Y>
X-ME-Received: <xmr:_HuaZFne9tZagBZjVtnLACSRyeZOWP06xkwcHPIpxC-JvS4f_OPCy8m5rprAZokQXOjDATelWz133IX-y3JgOPsmBq0ngA1exZ7u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehgedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggt
    uggjsehttdertddttddvnecuhfhrohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvg
    htvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhep
    feefhfelgeeghffgtedthfekhefhvedtleetjeejuedtueevueeuheelkeehgfejnecuff
    homhgrihhnpehkvghrnhgvlhdrohhrghdpuhhssgdrohhrghdpvghlvggttggvlhgvrhgr
    thhorhdrtghomhdpghhithhhuhgsrdgtohhmpdhfrhgvvgguvghskhhtohhprdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgv
    rhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:_HuaZAwO0L_YjIToenSKhI-x1bBY5Y6YX0b27nkn68HQVrqNx0qxjA>
    <xmx:_HuaZHSHiC_XAM6T2L9oVdLHdvlnejcH9-21-QxOR1igYo7px404JQ>
    <xmx:_HuaZLaAqt4hW3TQUj1b-QBcuxls5pxLBOQNbUeDC-FMAuoLA7tMmw>
    <xmx:_HuaZFNOY63BmDMvL4xWliy5EryfqdNWYoHTlDyjYfUWQIifQH4YQA>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jun 2023 02:04:41 -0400 (EDT)
Date:   Tue, 27 Jun 2023 16:04:37 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <20230627060437.GA726439@quokka>
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 22, 2023 at 10:39:15PM +0200, Marco Morandini wrote:
> Add an introduction about HID
> meant for the casual programmers that is trying
> either to fix his device or to understand what
> is going wrong.
> 
> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> ---
> v1: https://lore.kernel.org/linux-input/3mbw67akm2xzd2kgzb6sdfh4dly6im5jrz5umuvczjvrgxtf46@q5ooib3zkmfq/T/#m00b625a4d2c605dd7f62a866df7bf97ef2921d63

Thanks for all the fixes, much easier to read and follow already. A few
nitpicks like last time but this is coming together!

>  Documentation/hid/hidintro.rst          | 543 ++++++++++++++++++++++++
>  Documentation/hid/hidreport-parsing.rst |  52 +++
>  Documentation/hid/index.rst             |   1 +
>  include/linux/hid.h                     |  23 +
>  4 files changed, 619 insertions(+)
>  create mode 100644 Documentation/hid/hidintro.rst
>  create mode 100644 Documentation/hid/hidreport-parsing.rst
> 
> diff --git a/Documentation/hid/hidintro.rst b/Documentation/hid/hidintro.rst
> new file mode 100644
> index 000000000000..cdaa09479147
> --- /dev/null
> +++ b/Documentation/hid/hidintro.rst
> @@ -0,0 +1,543 @@
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
> +.. toctree::
> +   :maxdepth: 2
> +   
> +   hidreport-parsing
> +
> +
> +Introduction
> +============
> +
> +HID stands for Human Interface Device, and can be whatever device
> +you are using to interact with a computer, be it a mouse,
> +a touchpad, a tablet, a microphone.
> +
> +Many HID devices work out the box, even if their hardware is different.
> +For example, mice can have any number of buttons; they
> +may a wheel; movement sensitivity differs between different
> +models, and so on. Nonetheless,
> +most of the time everything just works, without the need
> +to have specialized code in the kernel for every mouse model
> +developed since 1970.

A general request - can you reformat the paragraphs please to be roughly
the max (or just the same-ish) line lengths. Some of these paragraphs 
read more like a poem
with superfluous
linebreaks
sprinkled all over it.

> +
> +This is because modern HID devices do advertise
> +their capabilities through the *HID report descriptor*, a
> +fixed set of bytes describing exactly what *HID reports*
> +may be sent between the device and the host and the meaning of each
> +individual bit in those reports. For example, a HID Report Descriptor
> +may specify that "in a report with ID 3 the second byte is the delta x
> +coordinate of a mouse".

staring at this and if you're doing a v3 anyway, I'd say "bits 8 to 15"
instead of "second byte" to emphasise that HID reports are usually more
bit-y than byte-y. But that's a minor nitpick that doesn't matter too
much.


> + 
> +The HID report itself then merely carries the actual data values
> +without any extra meta information. Note that HID reports may be sent
> +from the device ("Input Reports", i.e. input events), to the device
> +("Output Reports" to e.g. change LEDs) or used for device
> +configuration ("Feature reports"). A device may support one or more
> +HID reports.
> +
> +The HID subsystem is in charge of parsing the HID report descriptors,
> +and converts HID events into normal input
> +device interfaces (see Documentation/hid/hid-transport.rst).
> +Devices may misbehave because the HID report descriptor
> +provided by the device is wrong,
> +or because it needs to be dealt with in a special way,
> +or because some special device or interaction mode
> +is not handled by the default code.
> +
> +The format of HID report descriptors is described by two documents,
> +available from the `USB Implementers Forum <https://www.usb.org/>`_
> +at `this <https://www.usb.org/hid>`_ addresses:
> +
> + * the `HID USB Device Class Definition 
> +   <https://www.usb.org/document-library/device-class-definition-hid-111>`_ (HID Spec from now on)
> + * the `HID Usage Tables <https://usb.org/document-library/hid-usage-tables-14>`_ (HUT from now on)
> +
> +This does not mean that the HID subsystem can deal with USB devices only;
> +rather, different transport drivers, such as I2C or Bluetooth, can be dealt
> +with, see Documentation/hid/hid-transport.rst.

Simpler wording: "The HID subsystem can deal with different transport drivers
(USB, I2C, Bluetooth, etc.). See Documentation/hid/hid-transport.rst."

> +
> +Parsing HID report descriptors
> +==============================
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
> +Optional stuff: the HID report descriptor can be read also by 
> +directly accessing the hidraw driver [#hidraw]_.
> +
> +The basic structure of HID report descriptors is defined in the HID spec, while
> +HUT "defines constants that can be interpreted by an application to
> +identify the purpose and meaning of a data
> +field in a HID report". Each entry is defined by at least two bytes,
> +where the first one defines what type of value is following,
> +and is described in the HID spec,

no comma before "and" in this case

> +while the second one carries the actual value,

superfluous comma-man to the rescue! :)

> +and is described in the HUT.
> +
> +HID report descriptors can, in principle, be painstakingly
> +parsed by hand, byte by byte. 
> +
> +A short introduction
> +on how to do this is sketched in Documentation/hid/hidreport-parsing.rst;
> +you need to understand it only if you need to patch HID report descriptors.

I think this should be "you only need to ..." (but I'm ESL too)

> +
> +In practice you should not do parse HID report descriptors by hand; 
> +rather, you should use an existing parser. 
> +Among all the available ones
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
> +Parsing the mouse HID report descriptor with `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_ leads to
> +(explanations interposed)::
> +
> +    marco@sun:~/Programmi/linux/hid-tools (master =)> ./hid-decode /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor

shorten the prompt to just "$ hid-decode ..." and it'll fit better on a
single line


> +    # device 0:0
> +    # 0x05, 0x01,		     // Usage Page (Generic Desktop)	    0
> +    # 0x09, 0x02,		     // Usage (Mouse)			    2
> +    # 0xa1, 0x01,		     // Collection (Application)	    4
> +    # 0x09, 0x01,		     // Usage (Pointer)		    	    6
> +    # 0xa1, 0x00,		     // Collection (Physical)  	    	    8
> +    # 0x05, 0x09, 		     //	Usage Page (Button)		   10
> + what follows is a button
> +
> +    # 0x19, 0x01, 		     //	Usage Minimum (1)		   12
> +    # 0x29, 0x03, 		     //	Usage Maximum (3)		   14
> + first button is button number 1, last button is button number 3
> +
> +    # 0x15, 0x00, 		     //	Logical Minimum (0)		   16
> +    # 0x25, 0x01, 		     //	Logical Maximum (1)		   18
> + each button can send values from 0 up to including 1
> + (i.e. they are binary buttons)
> +
> +    # 0x75, 0x01, 		     //	Report Size (1) 		   20
> + each button is sent as exactly one bit
> +
> +    # 0x95, 0x03, 		     //	Report Count (3)		   22
> + and there are three of those bits 
> + (matching the three buttons)
> +
> +    # 0x81, 0x02, 		     //	Input (Data,Var,Abs)		   24
> + it's actual Data (not constant padding), they represent 
> + a single variable (Var) and the value are Absolute (not relative); 
> + See HID spec Sec. 6.2.2.5 "Input, Output, and Feature Items
> +
> +    # 0x75, 0x05, 		     //	Report Size (5) 		   26
> + five additional padding bits, needed to reach a byte
> +
> +    # 0x95, 0x01, 		     //	Report Count (1)		   28
> + those five bits are repeated only once
> +
> +    # 0x81, 0x01, 		     //	Input (Cnst,Arr,Abs)		   30
> + and take Constant (Cnst) values

"i.e. they can be ignored"

> +
> +    # 0x05, 0x01,		     // Usage Page (Generic Desktop)       32
> +    # 0x09, 0x30,		     // Usage (X)			   34
> +    # 0x09, 0x31,		     // Usage (Y)			   36
> +    # 0x09, 0x38,		     // Usage (Wheel) 		    	   38
> + The mouse has also two physical positions   (``Usage (X)``, ``Usage (Y)``) 

too many spaces here

> + and a wheel (Usage (Wheel))
> +
> +    # 0x15, 0x81, 		     //	Logical Minimum (-127)  	   40
> +    # 0x25, 0x7f, 		     //	Logical Maximum (127)		   42
> + each of them can send values ranging from -127 up to including 127
> +
> +    # 0x75, 0x08, 		     //	Report Size (8) 		   44
> + is represented by eight bits
> +
> +    # 0x95, 0x03, 		     //	Report Count (3)		   46
> + and there are three of those eight bits, matching X, Y and Wheel
> +
> +    # 0x81, 0x06,		     // Input (Data,Var,Rel)  	    	   48
> + This time the data is Relative (Rel), i.e. it represent 
> + the change from the previous configuration

"the previously sent report (event)"

> +
> +    # 0xc0,			     // End Collection 		    	   50
> +    # 0xc0,			     // End Collection  		   51
> +    #
> +    R: 52 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 03 15 00 25 01 75 01 95 03 81 02 75 05 95 01 81 01 05 01 09 30 09 31 09 38 15 81 25 7f 75 08 95 03 81 06 c0 c0
> +    N: device 0:0
> +    I: 3 0001 0001
> +
> +
> +This Report Descriptor tells us that the mouse input will be
> +transmitted using four bytes:
> +the first one for the buttons (three bits used, five for padding),
> +the last three for the mouse X, Y and wheel changes, respectively.
> +
> +Indeed, for any event, the mouse will send a *report* of four bytes.
> +We can check the values sent by resorting e.g.
> +to the `hid-recorder` tool, from `hid-tools
> +<https://gitlab.freedesktop.org/libevdev/hid-tools>`_:
> +The sequence of bytes sent by clicking and releasing
> +button 1, then button 2, then button 3 is::
> +
> +  marco@sun:~/> sudo ./hid-recorder /dev/hidraw1

for consistency please change the prompt here to `$` as well

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
> +This example shows that when button 2 is clicked, 
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
> +Output, Input and Feature Reports
> +---------------------------------
> +
> +An HID devices can have Input Reports, like
> +in the mouse example, Output Reports, and Features Reports.

s/Features/Feature/

> +"Output" means that the information is fed

s/fed/sent/

> +to the device. For example,
> +a joystick with force feedback will have
> +some output; the led of a keyboard would 
> +need an output as well.
> +"Input" means that data
> +come from the device.

s/come/comes/ 
Not sure, never got the hang of singular vs plural data, whatever
is used in the rest of the documentation.

> +
> +"Feature"s are not meant to be consumed by the end user
> +and define configuration options for the device.
> +They can be queried from the host;
> +when declared as *Volatile* 
> +they should be changed by the host.
> +
> +
> +Collections, Report IDs and Evdev events
> +========================================
> +
> +A single device can logically group
> +data into different, independent sets,
> +called *Collection*.

"called a *Collection*"

> +Collections can be nested, and there 
> +are different types of collections
> +(see the HID spec 6.2.2.6 
> +"Collection, End Collection Items" for details).
> +
> +Different reports are identified by means
> +of different *Report ID* fields, i.e. a number identifying
> +the structure of the immediately following report. 
> +Whenever a Report ID
> +is needed it is transmitted as the first byte of any report.

"A device with only one supported HID report (like the mouse example above)
 may omit the report ID."

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
> +one can see that the device presents two ``Mouse`` 
> +Application Collections
> +(with reports identified by Reports IDs 1 and 2, respectively),
> +a ``Keypad`` Application Collection (whose report is identified
> +by the Report ID 5) and two ``Consumer Controls``
> +Application Collections,
> +(with Report IDs 6 and 3, respectively).
> +Note that, however, that you can have different Report IDs
> +for the same Application Collection.
> +
> +The data sent will begin with the Report ID byte, and will be followed
> +by the corresponding information. For example, the
> +data transmitted for the last consumer
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
> +will be of three bytes: the first for the Report ID (3), the next two
> +for the headphone, with two (``Report Count (2)``) bytes
> +(``Report Size (8)``), each ranging from 0 (``Logical Minimum (0)`` to 255
> +(``Logical Maximum (255)``).
> +
> +All the Input data sent by the device should be translated into corresponding
> +Evdev events, so that the remaining part of the stack can know what is going on,
> +e.g. that a mouse button was pressed, rather 
> +than a mouse has been moved in the X direction.

This example is so obvious that it's actually confusing, a better
example may be: "e.g. the bit for the first button translates into the
EV_KEY/BTN_LEFT  evdev event and relative x movement translates into the
EV_REL/REL_X evdev event".


> +
> +Events
> +======
> +
> +In Linux, one ``/dev/input/event*`` is created for each
> +``Application Collection``.
> +Going back to the mouse example, and repeating the sequence where
> +one clicks and holds button 1, then clicks and holds button 2,
> +releases button 1, and finally releases button 2, one gets::
> +
> +  marco@sun:~> sudo libinput record /dev/input/event1

$ prompt reminder

> +  # libinput record
> +  version: 1
> +  ndevices: 1
> +  libinput:
> +    version: "1.23.0"
> +    git: "unknown"
> +  system:
> +    os: "opensuse-tumbleweed:20230619"
> +    kernel: "6.3.7-1-default"
> +    dmi: "dmi:bvnHP:bvrU77Ver.01.05.00:bd03/24/2022:br5.0:efr20.29:svnHP:pnHPEliteBook64514inchG9NotebookPC:pvr:rvnHP:rn89D2:rvrKBCVersion14.1D.00:cvnHP:ct10:cvr:sku5Y3J1EA#ABZ:"
> +  devices:
> +  - node: /dev/input/event1
> +    evdev:
> +      # Name: PixArt HP USB Optical Mouse
> +      # ID: bus 0x3 vendor 0x3f0 product 0x94a version 0x111
> +      # Supported Events:
> +      # Event type 0 (EV_SYN)
> +      # Event type 1 (EV_KEY)
> +      #   Event code 272 (BTN_LEFT)
> +      #   Event code 273 (BTN_RIGHT)
> +      #   Event code 274 (BTN_MIDDLE)
> +      # Event type 2 (EV_REL)
> +      #   Event code 0 (REL_X)
> +      #   Event code 1 (REL_Y)
> +      #   Event code 8 (REL_WHEEL)
> +      #   Event code 11 (REL_WHEEL_HI_RES)
> +      # Event type 4 (EV_MSC)
> +      #   Event code 4 (MSC_SCAN)
> +      # Properties:
> +      name: "PixArt HP USB Optical Mouse"
> +      id: [3, 1008, 2378, 273]
> +      codes:
> +  	0: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] # EV_SYN
> +  	1: [272, 273, 274] # EV_KEY
> +  	2: [0, 1, 8, 11] # EV_REL
> +  	4: [4] # EV_MSC
> +      properties: []
> +    hid: [
> +      0x05, 0x01, 0x09, 0x02, 0xa1, 0x01, 0x09, 0x01, 0xa1, 0x00, 0x05, 0x09, 0x19, 0x01, 0x29, 0x03, 
> +      0x15, 0x00, 0x25, 0x01, 0x95, 0x08, 0x75, 0x01, 0x81, 0x02, 0x05, 0x01, 0x09, 0x30, 0x09, 0x31, 
> +      0x09, 0x38, 0x15, 0x81, 0x25, 0x7f, 0x75, 0x08, 0x95, 0x03, 0x81, 0x06, 0xc0, 0xc0
> +    ]
> +    udev:
> +      properties:
> +      - ID_INPUT=1
> +      - ID_INPUT_MOUSE=1
> +      - LIBINPUT_DEVICE_GROUP=3/3f0/94a:usb-0000:05:00.3-2
> +    quirks:
> +    events:
> +    # Current time is 12:31:56
> +    - evdev:
> +      - [  0,	   0,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
> +      - [  0,	   0,	1, 272,       1] # EV_KEY / BTN_LEFT		      1
> +      - [  0,	   0,	0,   0,       0] # ------------ SYN_REPORT (0) ---------- +0ms
> +    - evdev:
> +      - [  1, 207892,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
> +      - [  1, 207892,	1, 273,       1] # EV_KEY / BTN_RIGHT		      1
> +      - [  1, 207892,	0,   0,       0] # ------------ SYN_REPORT (0) ---------- +1207ms
> +    - evdev:
> +      - [  2, 367823,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
> +      - [  2, 367823,	1, 272,       0] # EV_KEY / BTN_LEFT		      0
> +      - [  2, 367823,	0,   0,       0] # ------------ SYN_REPORT (0) ---------- +1160ms
> +    # Current time is 12:32:00
> +    - evdev:
> +      - [  3, 247617,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
> +      - [  3, 247617,	1, 273,       0] # EV_KEY / BTN_RIGHT		      0
> +      - [  3, 247617,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +880ms
> +
> +Note: if ``libinput`` is not available on your system try using ``evemu-record``.
> +
> +When something does not work
> +============================
> +
> +There can be a number of reasons for why a device does not behave
> +correctly. For example
> +
> +* The HID report descriptor provided by the HID device may be wrong
> +  because e.g.
> +
> +  * it does not follow the standard, so that the kernel 
> +    will not able to make sense of the HID report descriptor;
> +  * it is possible to verify, by reading the raw HID data, that
> +    the HID report descriptor *does not match* what is actually 
> +    sent by the device;

  * the HID report descriptor *does not match* what is actually 
		sent by the device (this can be verified by reading the raw HID
    data),

> +    
> +or
> +

skip the or, we're already in an enumeration anyway so this can be a
single list

> +* the HID report descriptor may need some "quirks" (see later on);
> +
> +As a consequence, a suitable ``/dev/input/event*`` will not created 

s/suitable//
s/will/may/

> +for each Application Collection, and/or the events 
> +there will match what you would expect.

s/will/may not/

> +
> +
> +Quirks
> +------
> +
> +There are some known peculiarities of HID devices that the kernel
> +knows how to fix - these are called the HID quirks and a list of those
> +are available in `include/linux/hid.h`.
> +
> +Should this be the case,
> +it should be enough to add the required quirk,
> +in the kernel, for the HID device at hand.
> +This can be done in file `drivers/hid/hid-quirks.c`.

s/file/the file/

> +How to do it should be relatively straightforward 
> +after looking into the file.
> +
> +The list of currently defined quirks, from
> +`include/linux/hid.h`, is
> +
> +.. kernel-doc:: include/linux/hid.h
> +   :doc: HID quirks
> +
> +Quirks for USB devices can be specified 
> +while loading the usbhid module,
> +see ``modinfo usbhid``, although the proper fix
> +should go into hid-quirks.c and **submitted upstream**.
> +See, again, Documentation/process/submitting-patches.rst

s/, again,// (sounds too patronising otherwise)

> +for guidelines on how to do submit a patch.
> +Quirks for other busses need to go into hid-quirks.c
> +
> +Fixing HID report descriptors
> +-----------------------------
> +
> +Should you need to patch HID report descriptors
> +the easiest way is to resort to eBPF, as described
> +in Documentation/hid/hid-bpf.rst.
> +
> +Basically, you can change any byte of the original HID report descriptor.
> +The examples in samples/hid should be a good starting point
> +for your code, see e.g. `samples/hid_mouse.bpf.c`::
> +
> +  SEC("fmod_ret/hid_bpf_rdesc_fixup")
> +  int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
> +  {
> +    ....
> +       data[39] = 0x31;
> +       data[41] = 0x30;
> +    return 0;
> +  }
> +
> +Of course this can be also done within the kernel source
> +code, see e.g. `drivers/hid/hid-aureal.c` or
> +`drivers/hid/hid-samsung.c` for a slightly more complex file.
> +
> +Check Documentation/hid/hidreport-parsing.rst
> +if you need an help navigating the HID manuals and
> +understanding the exact meaning of
> +the HID report descriptor hex numbers.
> +
> +Whatever solution you come up with, please remember to **submit the 
> +fix to the HID maintainers**, so that it can be directly 
> +integrated in the kernel
> +and that particular HID device will will start
> +working for everyone else.
> +See Documentation/process/submitting-patches.rst
> +for guidelines on how to do this.
> +
> +
> +Modifying the transmitted data on the fly
> +-----------------------------------------
> +
> +Using eBPF it is also possible to modify the data exchanged
> +with the device. See again the examples in `samples/hid`.
> +
> +Again, **please post your fix**, so that
> +it can be integrated in the kernel!
> +
> +Writing a specialized driver
> +----------------------------
> +
> +This should really be your last resort.
> +
> +
> +.. rubric:: Footnotes
> +
> +.. [#hidraw] reading hidraw: see Documentation/hid/hidraw.rst and
> +  file `samples/hidraw/hid-example.c` for an example.
> +  The output of ``hid-example`` would be, for the same mouse::
> +
> +    marco@sun:~> sudo ./hid-example

$ prompt reminder

> +    Report Descriptor Size: 52
> +    Report Descriptor:
> +    5 1 9 2 a1 1 9 1 a1 0 5 9 19 1 29 3 15 0 25 1 75 1 95 3 81 2 75 5 95 1 81 1 5 1 9 30 9 31 9 38 15 81 25 7f 75 8 95 3 81 6 c0 c0
> +
> +    Raw Name: PixArt USB Optical Mouse
> +    Raw Phys: usb-0000:05:00.4-2.3/input0
> +    Raw Info:
> +            bustype: 3 (USB)
> +            vendor: 0x093a
> +            product: 0x2510
> +    ...
> diff --git a/Documentation/hid/hidreport-parsing.rst b/Documentation/hid/hidreport-parsing.rst
> new file mode 100644
> index 000000000000..a31a7aec5947
> --- /dev/null
> +++ b/Documentation/hid/hidreport-parsing.rst
> @@ -0,0 +1,52 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================================
> +Manual parsing of HID report descriptors
> +========================================
> +
> +Consider again the mouse HID report descriptor
> +introduced in Documentation/hid/hidintro.rst::
> +
> +  marco@sun:~> hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
> +  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
> +  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
> +  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
> +  00000030  81 06 c0 c0                                       |....|
> +  00000034
> +
> +and try to parse it by hand.
> +
> +Start with the first number, 0x05: according to
> +the HID spec, Sec. 6.2.2.2, "Short Items"
> +
> +Start with the first number, 0x05 which carries 2 bits for the
> +length of the item, 2 bits for the type of the item and 4 bits for the
> +function::
> +
> +  +----------+
> +  | 00000101 |
> +  +----------+
> +  	  ^^
> +	  ---- Length of data (see HID spec 6.2.2.2)
> +	^^
> +	------ Type of the item (see HID spec 6.2.2.7)
> +   ^^^^
> +   --------- Function of the item (see HUT Sec 3)

this is misaligned

Cheers,
  Peter

> +
> +In our case, the length is 1 byte, the type is ``Global`` and the function
> +is ``Usage Page``, thus we need to refer to HUT Sec 3 which indicates that
> +the value 0x01 in the second byte stands for ``Generic Desktop Page``.
> +
> +The second number is the actual data, and its meaning can
> +be found in the HUT.
> +We have an ``Usage Page``, thus we need to refer to HUT Sec. 3,
> +"Usage Pages"; from there, one sees that the ``0x01``
> +stands for ``Generic Desktop Page``.
> +
> +Moving now to the second two bytes, and following the same scheme, ``0x09``
> +(i.e. ``00001001``) will be followed by one byte (``01``)
> +and is a ``Local`` item.
> +Thus, the meaning of the remaining four bits (``0000``)
> +is given in the HID spec Sec. 6.2.2.8 "Local Items", so that we have an ``Usage``.
> +
> +The following numbers can be parsed in the same way.
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
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 7f2e8ba7d783..ad12a36d9993 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -341,6 +341,29 @@ struct hid_item {
>   */
>  #define MAX_USBHID_BOOT_QUIRKS 4
>  
> +/** 
> +* DOC: HID quirks
> +* | @HID_QUIRK_NOTOUCH:
> +* | @HID_QUIRK_IGNORE: ignore this device
> +* | @HID_QUIRK_NOGET:
> +* | @HID_QUIRK_HIDDEV_FORCE:
> +* | @HID_QUIRK_BADPAD:
> +* | @HID_QUIRK_MULTI_INPUT:
> +* | @HID_QUIRK_HIDINPUT_FORCE:
> +* | @HID_QUIRK_ALWAYS_POLL:
> +* | @HID_QUIRK_INPUT_PER_APP:
> +* | @HID_QUIRK_X_INVERT:
> +* | @HID_QUIRK_Y_INVERT:
> +* | @HID_QUIRK_SKIP_OUTPUT_REPORTS:
> +* | @HID_QUIRK_SKIP_OUTPUT_REPORT_ID:
> +* | @HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP:
> +* | @HID_QUIRK_HAVE_SPECIAL_DRIVER:
> +* | @HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE:
> +* | @HID_QUIRK_FULLSPEED_INTERVAL:
> +* | @HID_QUIRK_NO_INIT_REPORTS:
> +* | @HID_QUIRK_NO_IGNORE:
> +* | @HID_QUIRK_NO_INPUT_SYNC:
> +*/
>  /* BIT(0) reserved for backward compatibility, was HID_QUIRK_INVERT */
>  #define HID_QUIRK_NOTOUCH			BIT(1)
>  #define HID_QUIRK_IGNORE			BIT(2)
> -- 
> 2.41.0
> 
