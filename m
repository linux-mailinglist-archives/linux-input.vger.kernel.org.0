Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1EB67398D2
	for <lists+linux-input@lfdr.de>; Thu, 22 Jun 2023 10:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjFVIAJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jun 2023 04:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjFVH7s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jun 2023 03:59:48 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454631BF9;
        Thu, 22 Jun 2023 00:59:21 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id DFD1E5C00D9;
        Thu, 22 Jun 2023 03:59:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 22 Jun 2023 03:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1687420753; x=1687507153; bh=X4
        w+HVLtUCUi0l5KXI666LkSVYnIw2DS7ex/Aq9NL2Y=; b=iV88W0ztIGfHghze/o
        rMbyYFpFFnzmMtPzar/pYyrSiQRoalmV6s1mBfi/7v7vDmxiCBXzmhCkCyd2nx3M
        Va1lzxphhD9E2pEzwG+/guUSFMo0AvGr1rbrNsINKsI0iMXOKo3i4wxQa8ZdmzXe
        dbm+WsnUraAqDx8wb1EAWHUDPt2AtNu9FrqJLeKkEt4DtMUxIH/cfdziyGZh6BSd
        ++N9xvvPOOY6GitJAXi6m7cNmhZ6K9Gw4xZZJ3Gnni799TNJbrA+Ddw0Frp7eVcx
        zoXsudsB6fikmYcJmhB8hQPwHDXTCHw1G3XwegT5MQT5ebbnFffzrHTIEuNcfEaF
        g23Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687420753; x=1687507153; bh=X4w+HVLtUCUi0
        l5KXI666LkSVYnIw2DS7ex/Aq9NL2Y=; b=Kk6MsOF1z+aKIA0ltkxtpp7+yO9Me
        egR1uc6aESYHdn6FTjMW531y0FdNC3PG/RunLRL6JuVCY3YWTR+Glf1s1NlWMqOT
        RuxSG8CgL8rR0unC5JIrdGu0hRjxXtmuHJzVX0s4k8nik5QNHDggie0zXN2U06Vf
        kjHVdMwEyZznLNcuF0wME63XYA09txGkdIEjgc2hWOoAbbXZPu79sTM/wifqWHv7
        kbPabIKIWy5s3TwVNUDYcsJS4yiaMhLG9u235IFXy9w9xGogqHniLw+eIBBQe2Wz
        sKsW6UzCSMuNDqzqits/6/n0tXZsjhAez7N6i0IceiaG4rzTrRrXfujzg==
X-ME-Sender: <xms:Uf-TZDFgGjinGpc9buaVgKu9BfBrA55kDnHACZ6aTA6c0l-Oefg6Mw>
    <xme:Uf-TZAUXyQhse4tSx0SrdypprLrtZ_QE_yfJaIcCpRvPzq4IY2Uf6RT0FFtk05Kyc
    S5mWVd73Nb7-TuqmZQ>
X-ME-Received: <xmr:Uf-TZFKjSe5yyzkrhTmKS2-MOgMudVqLhVIZILLAaId9N8JGauf9uIlBsJGR1Kgk_jcDItIvFrOLcQ1to9IsV6Fhu55oQWQ9xNkS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegtddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggt
    uggjsehttdertddttddvnecuhfhrohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvg
    htvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhep
    ueffgedukeetuedufeeljefgkeegleevtdeggeekleevffevudeftdelfffgjeeunecuff
    homhgrihhnpegslhhoghhsphhothdrtghomhdpuhhssgdrohhrghdpvghlvggttggvlhgv
    rhgrthhorhdrtghomhdpghhithhhuhgsrdgtohhmpdhfrhgvvgguvghskhhtohhprdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgv
    thgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:Uf-TZBGikY44LBF_xd53BFgirvBL8qhdttOhVmH8BXTOHxSbvjyOwg>
    <xmx:Uf-TZJULje3tXmm2a0-dZrUb33zmaYDtKTVQSGUdJZr8e47n5SMT4Q>
    <xmx:Uf-TZMNouEFaqhsHRE8wfeILPsUe3jfbmJbcqPzFll38w-oAVlGZ_g>
    <xmx:Uf-TZPxRvfLX-zP9fIH2rXAVs8X91RL5Wwn4nxSzBSFOH125haKS2g>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jun 2023 03:59:10 -0400 (EDT)
Date:   Thu, 22 Jun 2023 17:59:05 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <20230622075905.GA35108@quokka>
References: <d6d16821-2592-8210-475a-5388d7a79e82@polimi.it>
 <99a679e8-6b01-6805-1e33-ce02485e0063@polimi.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99a679e8-6b01-6805-1e33-ce02485e0063@polimi.it>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

First: standing ovations for adding better documentation to the kernel.
Second: my condolences that you had to learn how hid report descriptors
work :)

A few typos and suggested rewordings below, feel free to take those as
you see fit. For a more high-level comment: it's a very fine (and
blurry) line that you are treading here because we really shouldn't
provide too much information and instead refer readers to the official
spec. The doc here should ideally provide just enough high-level
overview that the reader roughly understands what report descriptors and
reports are, and why the parsers (and quirks) are necessary.

I think for that particular purpose, the examples are probably the most
useful parts anyway because they provide a tangible association of bits
to functionality. Try to avoid getting stuck in the minutes of the HID
specs, it just doesn't matter for the scope of this document.

On Tue, Jun 20, 2023 at 02:33:55PM +0200, Marco Morandini wrote:
> This patch adds an introduction about HID
> meant for the casual programmers that is trying
> either to fix his device or to understand what
> is going wrong
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

shameless plug! :) I wrote this post a few years ago, feel free to
incorporate bits from there into here
https://who-t.blogspot.com/2018/12/understanding-hid-report-descriptors.html

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

See Benjamin's comment too, I think it's better to use "HID device"
here, primarily because we have the "HID protocol", "HID parser", "HID
quirks", so it's more a qualifier than what the acronym actually stands
for.

> +For example, mouses can have a different number of buttons; they

s/a different/any/ - otherwise it's "different to what?"

> +can have (or not) a wheel; their movement sensitivity can be

I'd use "may have a wheel" but it's correct this way too

> +significantly different, and so on. Nonetheless,

maybe something like "movement sensitivity differs between different
models"

> +most of the time everything just works, without the need
> +to have specialized code in the kernel for any mouse model

s/any/every/

> +developed since 1970.
> +
> +This is because most (if not all) of the modern HIDs do advertise
> +the number and type of signal that can be exchanged, and
> +describe how such signal are exchanged with the computer
> +by means of *HID events*.
> +This is done through the *HID report descriptor*, basically a bunch of numbers
> +that allow the operating system to understand that the mouse at hand
> +has (say) five rather than three buttons.

I think the above lines are at risk of confusing newbies, how about
something like this:

	This is because modern HID devices do advertise
	their capabilities through the *HID report descriptor*, a
	fixed set of bytes describing exactly what *HID reports*
	may be sent between the device and the host and the meaning of each
  individual bit in those reports. For example, a HID Report Descriptor
	may specify that "in a report with ID 3 the second byte is the delta x
  coordinate of a mouse".

  The HID report itself then merely carries the actual data values
	without any extra meta information. Note that HID reports may be sent
  from the device ("Input Reports", i.e. input events), to the device
  ("Output Reports" to e.g. change LEDs) or used for device
  configuration ("Feature reports"). A device may support one or more
  HID reports.

> +The HID subsystem is in charge of parsing the HID report descriptors,
> +and of converts HID events into normal input

s/of//

> +device interfaces (see Documentation/hid/hiddev.rst).
> +Whenever something does not work as it should this can be
> +because the HID report descriptor provided by the device is wrong,

"Devices may misbehave because the HID report descriptor ..."

> +or because it needs to be dealt with in a special way,
> +or because the some special device or interaction mode
> +is not handled by the default code.
> +
> +The format of HID report descriptors is described by two documents,
> +available from the `USB Implementers Forum <https://www.usb.org/>`_
> +at `this <https://www.usb.org/hid>`_ addresses:
> +
> + * the `HID USB Device Class Definition <https://www.usb.org/document-library/device-class-definition-hid-111>`_ (HIDUDC from now on)

Benjamin may have more opinion on that but to me this was only ever "the
HID spec" :) The term "HIDUDC" also doesn't provide anything useful in
the search engines so anyone reading over this bit and skipping ahead
will be punished for it.

> + * the `HID Usage Tables <https://usb.org/document-library/hid-usage-tables-14>`_ (HIDUT from now on)

can we name this "HUT" please? because that's the only term I've ever
seen referred it to other than as HID Usage Tables.

> +
> +This does not means that the HID subsystem can deal with USB devices only;

s/means/mean/

> +rather, different transport drivers, such as I2C or Bluetooth, can be dealt
> +with, see Documentation/hid/hid-transport.rst.
> +
> +Parsing an HID descriptor
> +=========================

I'm pretty sure that most people just say "hid" like a word rather than
spelling out H-I-D, so this would mean it would be "a HID descriptor".
In practise, this particular nasty corner of the english language can be
avoided by always calling them the plural HID report descriptors and
thus avoiding the windmill battles of "a" vs "an".

Also, I'd rather you alway use "report descriptor" over "descriptor"
since that is the full term and non-ambiguous.

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

typo: accessing

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

I don't think you need to include the error messages.
Also: you now already have 2 tools to look at hid and then you use two
more later (hidrrd and hid-tools). I'd say it's best to just stick to
one tool to reduce the mental load of having to map different tool
outputs to what is the same base data.

> +
> +The basic structure of a HID report descriptor is defined in the HIDUDC manual, while
> +HIDUT "defines constants that can be interpreted by an application to
> +identify the purpose and meaning of a data
> +field in a HID report". Each entry is defined by at least two bytes,
> +where the first one defines what type of value is following,
> +and is described in the HIDUDC manual,
> +and the second one carries the actual value,
> +and is described in the HIDUT manual.
> +
> +Let consider the first number, 0x05: according to

s/let/let's/

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

typo with "HIDUC"

> +The bits are ``0000``, thus we have a ``Usage Page``.

I'm guessing you *don't* want to explain the full "how bit's being parsed"
so a simpler approach would be a basic byte diagram with references
to the official spec:

Then you get something like:

"""
Let's consider the first number, 0x05 which carries 2 bits for the
length of the item, 2 bits for the type of the item and 4 bits for the
function:

	+----------+
	| 00000101 |
	+----------+
					^^
					 ---- Length of data (see UDC 6.2.2.2)
				^^
				 ------ Type of the item (see UDC 6.2.2.7)
		^^^^
			--------- Function of the item (see HUT Sec 3)

In our case, the length is 1 byte, the type a "Global" and the function
is "Usage Page", thus we need to refer to HUT Sec 3 which indicates that
the value 0x01 in the second byte stands for ``Generic Desktop Page``.
"""

> +
> +
> +The second number is the actual data, and its meaning can
> +be found in the HICUT manual.
> +We have an ``Usage Page``, thus we need to refer to HICUT Sec. 3,
> +"Usage Pages"; from there, it is clear that the ``0x01``
> +stands for a ``Generic Desktop Page``.

note "Generic Desktop Page", you can skip the "a" here

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

I would be harsher here: "In practice you should not do this, use an
existing parser" because the people who first learn about HID here
should probably not immediately write a parser (mostly fo their own
sanity :)

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

Benjamin already said this but: pick one tool and use its output, there
is no need to show different tools being different. Since Benjamin is
both the kernel maintainer and the hid-tools maintainer, that one should
be the favourite ;)

> +
> +From it we undesratnd that

typo

> +
> + * the mouse has three (from ``Usage Minimum (1)`` to
> +   ``Usage Maximum (3)``) buttons (``Usage Page (Button)``);
> + * buttons can take values ranging from ``0`` to ``1``;
> +   (from ``Logical Minimum (0)`` to ``Logical Maximum (1)``);

so, remembering my early HID learnings - if you just throw out "Usage
Minimum" and "Maximum" that is mostly meaningless unless one also reads
the definition of what those mean. For me it took me a while to wrap my
head around the term "Usage" to begin with, it not really being an
english word that you'd encounter every day.

I think it'll be more understandable annotating the button line by line
with layperson's terms - anything specific needs to be externally looked
up anyway. So you get something like this:

"""
> +  # 0x05, 0x09, 		   //	Usage Page (Button)		  10

what follows is a button

> +  # 0x19, 0x01, 		   //	Usage Minimum (1)		  12
> +  # 0x29, 0x03, 		   //	Usage Maximum (3)		  14

first button is button number 1, last button is button number 3

> +  # 0x15, 0x00, 		   //	Logical Minimum (0)		  16
> +  # 0x25, 0x01, 		   //	Logical Maximum (1)		  18

each button can send values from 0 up to including 1 (i.e. they're
binary buttons)

> +  # 0x75, 0x01, 		   //	Report Size (1) 		  20

each button is sent as exactly one bit

> +  # 0x95, 0x03, 		   //	Report Count (3)		  22

and there are three of those bits (matching our three buttons)

> +  # 0x81, 0x02, 		   //	Input (Data,Var,Abs)		  24

it's actual Data (not constant padding), they represent a single
variable (Var) and the value are Absolute (not relative).
See HIDUDC Sec. 6.2.2.5 "Input, Output, and Feature Items.
"""


> + * information is encoded into three bits: one bit has
> +   ``Report Size (1)``,
> +   but there are three of them since ``Report Count (3)``;
> + * the value of these bits can change
> +   (``Data`` in ``Input (Data,Var,Abs)``);
> + * each field represents data from a physical control;
> + * the number of bits reserved for each field is determined
> +   by the preceding ``Report Size``/``Report Count``
> +   items (``Var`` in ``Input (Data,Var,Abs)``);

tbh, I think that's a mischaracterization of Var vs Arr (and tbh the
exact detail what those mean doesn't really matter here anyway).

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

I would say "the Report Descriptor tells us that mouse input will be..."
because I think that makes it a bit more obvious

> +the first one for the buttons (three bits used, five for padding),
> +the last three for the mouse X, Y and wheel changes, respectively.
> +
> +Indeed, for any event, the mouse will send a *report* of four bytes.
> +We can easily check the values sent by resorting e.g.

s/easily// because it may not be for some users

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

"where it's clear" can be problematic for readers for whom it's not
clear at all :) In this case you can write
"this example shows that when button 2 is clicked..." to avoid
that issue. I think there are a few uses of that phrase or similar in
this document.

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

I would refer to those as "Input Reports" and "Output Reports", simply
because for me it was much easier to adjust my head to accept that you
can send something to the mouse than that the mouse "has an output".

> +in the mouse example, and outputs.
> +"Output" means that the information is fed
> +from the device to the human; for examples,
> +a joystick with force feedback will have
> +some output.
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

This is a bit ambiguous since it's the collections and applications that
split the device into different sets, the reports are just different
ways of reporting data that belongs to one (or more? not 100% sure) of
those sets then.

And the example below works because you have different collections on
your device here but that's largely orthogonal to the use of reports.


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
> +Report IDs. 

as Benjamin already mentioned, this is incorrect given how the kernel
works, so definitely needs rewording.

> Going back to the mouse example, and repeating the sequence where
> +one clicks and holds button 1, then clicks and holds button 2,
> +releases button 1, and finally releases button 2, one gets::
> +
> +  marco@sun:~> sudo evtest /dev/input/event4
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
> +* It is possible to verify, by reading the raw hid data, that
> +  the HID report descriptor *does  match* what is sent by the device;
> +* The HID report descriptor does not need any "quirk"s (see later on)

"quirks", can have that inside the quotes

> +* For any Report ID a corresponding ``/dev/input/event*`` is created,
> +  and the events there match what you would expect
> +
> +When something does not work
> +============================

you can fold the "everything works" section into here with some prelude
of "There can be a number of reasons for why a device does not behave
correctly, for example..."

> +
> +Sometimes not everything does work as it should.


> +
> +Quirks
> +------
> +
> +A possible reason is that the HID
> +has some common quirk. Should this be the case,
> +it sould be enough to add the required quirk,
> +in the kernel, for the device at hand.

this phrasing is a bit ambiguous, because in the first sentence the
quirks is the bug in the device, but in the second sentence the quirk
is something the kernel provides. You can rephrase this less ambiguously
with something like:

	There are some known peculiarities of HID devices that the kernel
  knows how to fix - these are called the HID quirks and a list of those
  are available in `include/linux/hid.h`.


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

You *definitely* don't want to include this here because it will get out
of sync (and the actual bit value just doesn't matter anyway). Use one
or two as example just so a reader gets familiar with the
HID_QUIRK_FOOBAR notation and can use grep to find where quirks are
used and go from there.

> +
> +
> +FIXME: ADD A SHORT EXPLANATION FOR EACH QUIRK

as Benjamin already mentioned, this should be documented in situ and
linked to from here rather than split across multiple files.

> +
> +Quirks for USB devices can be specified run-time,

"at runtime" 

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
> +
> +Of course this can be also done within the kernel source
> +code, see e.g. drivers/hid/hid-aureal.c or
> +drivers/hid/hid-samsung.c for a slightly more complex file.
> +
> +
> +
> +Modifying on the fly the transmitted data
> +-----------------------------------------

"Modifying the transmitted data on the fly"

> +
> +It is also possible, always using eBPF, to modify


> +on the fly the data exchanged with the device.
> +See, again, the examples is samples/hid.

Using eBPF it is also possible to modify the data exchanged
with the device. See again the examples in samples/hid

Cheers,
  Peter

> +
> +Writing a specialized driver
> +----------------------------
> +
> +This should really be your last resort.
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
