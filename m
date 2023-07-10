Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C262974C9CD
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 04:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjGJCKs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jul 2023 22:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGJCKs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jul 2023 22:10:48 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFEA106;
        Sun,  9 Jul 2023 19:10:44 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id DBEC3320077A;
        Sun,  9 Jul 2023 22:10:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 09 Jul 2023 22:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1688955043; x=1689041443; bh=k6
        OOHZBavDwJUtYPN2tHl33InYgHWzxe8wbJRAex+ZM=; b=Rws6k66E9mS6slDcW9
        V1yM5lyDPXwfDpAc5D1DJweCPhExZE/aaJjGLalD9mo10P1p6p0yV8EwisMIGhNM
        5VRXlshdM3o+1rpHGiX4eA5O9gXl5YCAd7PRPOQy6P8VCDWHFiKVqntvn7SSLYAr
        OBaQVxw31hgUW8KZYjjPsPoX5sNwLHq8nOIzmrv0o/SsEhteOWhZjILd44ueL5rr
        9QsfFEIif3/3eYi7IDFjDGNfxWwY93Z4YxbzcsxX3iRcY0Wa4DQB+Rc5oGPiE8pr
        BxVX7cMLrNAvrbZjXsTNFLQZ2BhA+GxFzyQjXcsD7lt/68RY+f95+RAJtGBDdglD
        yvXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688955043; x=1689041443; bh=k6OOHZBavDwJU
        tYPN2tHl33InYgHWzxe8wbJRAex+ZM=; b=A03EQ/oUoPNSyoihzuQx/BBltAJqn
        V/jn5Id3jhDvc1/+Ve19LHJPjjOR6izARZsO/exkOaFSf3aJoRqGr8ozlwrnCpAY
        qzg/W+NkjJThg0bGhuBJ8p5A4m/++mFcvq7YAHEfZs87hfd64glhq49Tu+H2iEfX
        cTtPXcHUkNT/FqgJKisz0k1s+7iCLWxzqlOzHlAgdbHCh9SVwr7XQ81KbqPyRpyt
        E4GZtXkxZMFK1CC2oucZ5XzwTGRcGITY+t+SajHz3RPH7cm+tUryAE9BAf5dedFb
        ILmOUtDrBwyzWUQ7MFbBQ+WtD7rTheebATBkt9xRe5pVZMF0es7Xtlj1A==
X-ME-Sender: <xms:omirZIXO41-dQ92_F19WbyZDCCSz0Cmy2HXDCJl4qqHbEXdPXbs2cA>
    <xme:omirZMmIHICdBcisEiy28lv5xMSnTvJi86qlRuVKhNp94ZCi7msmPiKWWaTAKkg0K
    ZY4ocr6XKVz_Pd4G7o>
X-ME-Received: <xmr:omirZMYrt43WXRkC2Q8_xPkyP9nIW1Fe-rMrSTW_39zEUuuGDDiZK2vE-QSZ--WQUCf0K8sIkL7p6xJR9voaovSqJnPzCBsBl5v8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdeigdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggj
    sehttdertddttddvnecuhfhrohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvghtvg
    hrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhepfeef
    hfelgeeghffgtedthfekhefhvedtleetjeejuedtueevueeuheelkeehgfejnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghdpuhhssgdrohhrghdpvghlvggttggvlhgvrhgrthho
    rhdrtghomhdpghhithhhuhgsrdgtohhmpdhfrhgvvgguvghskhhtohhprdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdr
    hhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:omirZHXzvDtlVgHOXMDds5lZ0E43vDFp94jPlUnB5E50ke_PUMBHAw>
    <xmx:omirZCmLTlSxsOUCCvsSyk17qapxuP8pG0NgNwzJYX0IYBW4p9xLjA>
    <xmx:omirZMeyKs-jlJ8Mkj-6kgPeCa3qkEXkelCuP8eIBRubWHKU3mLHjg>
    <xmx:o2irZDCw8q7TwcxpqXu9Rd-01_sQb3D5y3Q5Ln53a1P7_pX73xQJ3g>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jul 2023 22:10:39 -0400 (EDT)
Date:   Mon, 10 Jul 2023 12:10:34 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <20230710021034.GA600582@quokka>
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
 <20230627060437.GA726439@quokka>
 <dc79f50c-0539-0d7c-129a-d02d5bbee4d5@polimi.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc79f50c-0539-0d7c-129a-d02d5bbee4d5@polimi.it>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 28, 2023 at 03:37:44PM +0200, Marco Morandini wrote:
> On 6/27/23 08:04, Peter Hutterer wrote:
> > On Thu, Jun 22, 2023 at 10:39:15PM +0200, Marco Morandini wrote:
> >> Add an introduction about HID
> >> meant for the casual programmers that is trying
> >> either to fix his device or to understand what
> >> is going wrong.
> >>
> >> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> >> ---
> >> v1: https://lore.kernel.org/linux-input/3mbw67akm2xzd2kgzb6sdfh4dly6im5jrz5umuvczjvrgxtf46@q5ooib3zkmfq/T/#m00b625a4d2c605dd7f62a866df7bf97ef2921d63
> > 
> > Thanks for all the fixes, much easier to read and follow already. A few
> > nitpicks like last time but this is coming together!
> 
> :)
> 
> Unfortunately while reading hidreport-parsing.rst I found it not very clear, at least for me.
> I tried to rearrange things there, but I fear we'll need v4 for that file :/
> 
> It would be great if you could double-check it, especially the reference to the
> spec; for example, I think one should look into HID spec 6.2.2.2 (and not HID spec 6.2.2.7 as written in v2) 
> for inferring the Type of the item (Global in this case). From there you jump to HID spec 6.2.2.7 
> that defines the different Global items; without looking into HID spec 6.2.2.2 you
> all you can do is to browse the spec until you find the bit sequence "0000 01 nn" in HID spec 6.2.2.7.
> I've also finished "parsing" the fourth byte at the end of the document.

See my other email but this largely comes down to where you want the
cut-off to be. You can link to each individual section but anyone
actually attempting this would have to read the spec anyway.

So IMO it would be perfectly acceptable to just state "Report descriptor
parsing is detailed in the Hid spec section 6.2.2" and not linking each
item separately. For me personally it is generally more important to
know that "those bits are that" because that's where the early errors
are being made. I can usually find what "that" means myself :)

> 
> I'm going to wait a few more days for Banjamin's comments, if any,
> then will send v3. At any rate, I'm attaching the current diff at the bottom of this email
> (what I would send, right now, as v3).
> 
> On a side note: after sending v2 I've realized that _lot_ of sentences
> now come from you. Thus, for v3, I think it would be better to send something like
> 
> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> Co-developed-by: Peter Hutterer <peter.hutterer@who-t.net>
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> 
> Ok for you?
> 
> If yes: I don't have clear whether I should send
> 
> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> Co-developed-by: Peter Hutterer <peter.hutterer@who-t.net>
> 
> and you should reply with
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> 
> or I should simply write the Signed-off-by on your behalf.

that's the only bit you cannot do. But honestly, I don't care too much
in this case, it's just text so don't worry about the extra tags,
If you really want to (so the blame for bug splits between us :) feel
free to use Co-authored-by if you want though, I think that's both
common enough and appropriate.

> =================================
> From: Marco Morandini <marco.morandini@polimi.it>
> 
> Add an introduction about HID
> meant for the casual programmers that is trying
> either to fix his device or to understand what
> is going wrong.
> 
> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> Co-developed-by: Peter Hutterer <peter.hutterer@who-t.net>
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> ---
> v2: https://lore.kernel.org/linux-input/20230627060437.GA726439@quokka/T/#t
> 
> changes: 
>   - corrections suggested in https://lore.kernel.org/linux-input/20230627060437.GA726439@quokka/T/#m21b0a280e2ce2b21332ca31cfafaddf44a1b5fb1
>   - corrections suggested in https://lore.kernel.org/linux-input/20230627060437.GA726439@quokka/T/#mafb91d69de2d56e6a1eeff5ba4ed88a764cf559e
>   - some rewording of Documentation/hid/hidreport-parsing.rst
> 
> --- /dev/null	2023-06-28 09:46:06.188159532 +0200
> +++ Documentation/hid/hidintro.rst	2023-06-28 15:26:31.543904010 +0200
> @@ -0,0 +1,510 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================
> +Introduction to HID report descriptors
> +======================================
> +
> +This chapter is meant to give a broad overview of what HID report
> +descriptors are, and of how a casual (non-kernel) programmer can deal
> +with HID devices that are not working well with Linux.
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
> +HID stands for Human Interface Device, and can be whatever device you
> +are using to interact with a computer, be it a mouse, a touchpad, a
> +tablet, a microphone.
> +
> +Many HID devices work out the box, even if their hardware is different.
> +For example, mice can have any number of buttons; they may have a
> +wheel; movement sensitivity differs between different models, and so
> +on. Nonetheless, most of the time everything just works, without the
> +need to have specialized code in the kernel for every mouse model
> +developed since 1970.
> +
> +This is because modern HID devices do advertise their capabilities
> +through the *HID report descriptor*, a fixed set of bytes describing
> +exactly what *HID reports* may be sent between the device and the host
> +and the meaning of each individual bit in those reports. For example,
> +a HID Report Descriptor may specify that "in a report with ID 3 the
> +bits from 8 to 15 is the delta x coordinate of a mouse".
> +
> +The HID report itself then merely carries the actual data values
> +without any extra meta information. Note that HID reports may be sent
> +from the device ("Input Reports", i.e. input events), to the device
> +("Output Reports" to e.g. change LEDs) or used for device configuration
> +("Feature reports"). A device may support one or more HID reports.
> +
> +The HID subsystem is in charge of parsing the HID report descriptors,
> +and converts HID events into normal input device interfaces (see
> +Documentation/hid/hid-transport.rst). Devices may misbehave because the
> +HID report descriptor provided by the device is wrong, or because it
> +needs to be dealt with in a special way, or because some special
> +device or interaction mode is not handled by the default code.
> +
> +The format of HID report descriptors is described by two documents,
> +available from the `USB Implementers Forum <https://www.usb.org/>`_
> +`HID web page <https://www.usb.org/hid>`_ address:
> +
> + * the `HID USB Device Class Definition
> +   <https://www.usb.org/document-library/device-class-definition-hid-111>`_ (HID Spec from now on)
> + * the `HID Usage Tables <https://usb.org/document-library/hid-usage-tables-14>`_ (HUT from now on)
> +
> +The HID subsystem can deal with different transport drivers
> +(USB, I2C, Bluetooth, etc.). See Documentation/hid/hid-transport.rst.
> +
> +Parsing HID report descriptors
> +==============================
> +
> +The current list of HID devices can be found at ``/sys/bus/hid/devices/``.
> +For each device, say ``/sys/bus/hid/devices/0003\:093A\:2510.0002/``,
> +one can read the corresponding report descriptor::
> +
> +  $ hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
> +  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
> +  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
> +  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
> +  00000030  81 06 c0 c0                                       |....|
> +  00000034
> +
> +Optional stuff: the HID report descriptor can be read also by

s/Optional stuff: //
unless you're talking about cooking poultry, "stuff" should
generally be avoided :)

> +directly accessing the hidraw driver [#hidraw]_.
> +
> +The basic structure of HID report descriptors is defined in the HID
> +spec, while HUT "defines constants that can be interpreted by an
> +application to identify the purpose and meaning of a data field in a
> +HID report". Each entry is defined by at least two bytes, where the
> +first one defines what type of value is following and is described in
> +the HID spec, while the second one carries the actual value and is
> +described in the HUT.
> +
> +HID report descriptors can, in principle, be painstakingly parsed by
> +hand, byte by byte.
> +
> +A short introduction on how to do this is sketched in
> +Documentation/hid/hidreport-parsing.rst; you only need to understand it
> +if you need to patch HID report descriptors.
> +
> +In practice you should not parse HID report descriptors by hand; rather,
> +you should use an existing parser. Among all the available ones
> +
> +  * the online `USB Descriptor and Request Parser
> +    <http://eleccelerator.com/usbdescreqparser/>`_;
> +  * `hidrdd <https://github.com/abend0c1/hidrdd>`_,
> +    that provides very detailed and somewhat verbose descriptions
> +    (verbosity can be useful if you are not familiar with HID report
> +    descriptors);
> +  * `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_,
> +    a complete utility set that allows, among other things,
> +    to record and replay the raw HID reports and to debug
> +    and replay HID devices.
> +    It is being actively developed by the Linux HID subsystem maintainers.
> +
> +Parsing the mouse HID report descriptor with `hid-tools
> +<https://gitlab.freedesktop.org/libevdev/hid-tools>`_ leads to
> +(explanations interposed)::
> +
> +    $ ./hid-decode /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
> +    # device 0:0
> +    # 0x05, 0x01,		     // Usage Page (Generic Desktop)	    0
> +    # 0x09, 0x02,		     // Usage (Mouse)			    2
> +    # 0xa1, 0x01,		     // Collection (Application)	    4
> +    # 0x09, 0x01,		     // Usage (Pointer)		    	    6
> +    # 0xa1, 0x00,		     // Collection (Physical)  	    	    8
> +    # 0x05, 0x09, 		     //	Usage Page (Button)		   10
> + what follows is a button

btw, did you check the proper rendering of this page? IIRC in RST
documents you need an empty line after a code block.

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
> + and there are three of those bits (matching the three buttons)
> +
> +    # 0x81, 0x02, 		     //	Input (Data,Var,Abs)		   24
> + it's actual Data (not constant padding), they represent
> + a single variable (Var) and their values are Absolute (not relative);
> + See HID spec Sec. 6.2.2.5 "Input, Output, and Feature Items

missing closing quotes

> +
> +    # 0x75, 0x05, 		     //	Report Size (5) 		   26
> + five additional padding bits, needed to reach a byte
> +
> +    # 0x95, 0x01, 		     //	Report Count (1)		   28
> + those five bits are repeated only once
> +
> +    # 0x81, 0x01, 		     //	Input (Cnst,Arr,Abs)		   30
> + and take Constant (Cnst) values i.e. they can be ignored

full stop at the end, since you start a new sentence below.

> +
> +    # 0x05, 0x01,		     // Usage Page (Generic Desktop)       32
> +    # 0x09, 0x30,		     // Usage (X)			   34
> +    # 0x09, 0x31,		     // Usage (Y)			   36
> +    # 0x09, 0x38,		     // Usage (Wheel) 		    	   38
> + The mouse has also two physical positions (Usage (X), Usage (Y))
> + and a wheel (Usage (Wheel))
> +
> +    # 0x15, 0x81, 		     //	Logical Minimum (-127)  	   40
> +    # 0x25, 0x7f, 		     //	Logical Maximum (127)		   42
> + each of them can send values ranging from -127 up to including 127
> +
> +    # 0x75, 0x08, 		     //	Report Size (8) 		   44
> + is represented by eight bits

"which is..."

> +
> +    # 0x95, 0x03, 		     //	Report Count (3)		   46
> + and there are three of those eight bits, matching X, Y and Wheel

full stop at the end, since you start a new sentence below.

> +
> +    # 0x81, 0x06,		     // Input (Data,Var,Rel)  	    	   48
> + This time the data values are Relative (Rel), i.e. they represent
> + the change from the previously sent report (event)
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
> +transmitted using four bytes: the first one for the buttons (three
> +bits used, five for padding), the last three for the mouse X, Y and
> +wheel changes, respectively.

I wonder if here we should mention something like:
"This particular device only has one HID report so it may (and does)
omit the Report ID. Devices that can send multiple different HID reports
must send the Report ID as the first byte of each report."

> +
> +Indeed, for any event, the mouse will send a *report* of four bytes.
> +We can check the values sent by resorting e.g. to the `hid-recorder`
> +tool, from `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_:
> +The sequence of bytes sent by clicking and releasing button 1, then button 2, then button 3 is::
> +
> +  $ sudo ./hid-recorder /dev/hidraw1
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
> +event (``00 00 00 00``) is the release of button 2 (no buttons are
> +pressed, remember that the data values are *absolute*).
> +
> +If instead one clicks and holds button 1, then clicks and holds button
> +2, releases button 1, and finally releases button 2, the reports are::
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
> +HID devices can have Input Reports, like in the mouse example, Output
> +Reports, and Feature Reports. "Output" means that the information is
> +sent to the device. For example, a joystick with force feedback will
> +have some output; the led of a keyboard would need an output as well.
> +"Input" means that data come from the device.
> +
> +"Feature"s are not meant to be consumed by the end user and define
> +configuration options for the device. They can be queried from the host;
> +when declared as *Volatile* they should be changed by the host.
> +
> +
> +Collections, Report IDs and Evdev events
> +========================================
> +
> +A single device can logically group data into different, independent

superfluous comma

> +sets, called a *Collection*. Collections can be nested, and there are

superfluous commas

> +different types of collections (see the HID spec 6.2.2.6
> +"Collection, End Collection Items" for details).


Going with what I mentioned above: you provide the exact location for
the collection spec here but I don't think it'll be very useful - anyone
needing to know that detail needs to read through most of 6.2.2 anyway
and the Collection subsection is easy enough to find.

This isn't to say you need to remove the reference, just that providing
that level of detail probably has little benefit to most readers.

> +
> +Different reports are identified by means of different *Report ID*
> +fields, i.e. a number identifying the structure of the immediately
> +following report.
> +Whenever a Report ID is needed it is transmitted as the first byte of
> +any report. A device with only one supported HID report (like the mouse
> +example above) may omit the report ID.
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
> +After parsing it (try to parse it on your own using the suggested
> +tools!) one can see that the device presents two ``Mouse`` Application
> +Collections (with reports identified by Reports IDs 1 and 2,
> +respectively), a ``Keypad`` Application Collection (whose report is
> +identified by the Report ID 5) and two ``Consumer Controls`` Application
> +Collections, (with Report IDs 6 and 3, respectively). Note, however,
> +that you can have different Report IDs for the same Application

s/you/a device/

> +Collection.
> +
> +The data sent will begin with the Report ID byte, and will be followed
> +by the corresponding information. For example, the data transmitted for
> +the last consumer control::
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
> +(``Report Size (8)``), each ranging from 0 (``Logical Minimum (0)``)
> +to 255 (``Logical Maximum (255)``).
> +
> +All the Input data sent by the device should be translated into
> +corresponding Evdev events, so that the remaining part of the stack can
> +know what is going on, e.g. the bit for the first button translates into
> +the ``EV_KEY/BTN_LEFT`` evdev event and relative X movement translates
> +into the ``EV_REL/REL_X`` evdev event".
> +
> +Events
> +======
> +
> +In Linux, one ``/dev/input/event*`` is created for each ``Application
> +Collection``. Going back to the mouse example, and repeating the
> +sequence where one clicks and holds button 1, then clicks and holds
> +button 2, releases button 1, and finally releases button 2, one gets::
> +
> +  $ sudo libinput record /dev/input/event1
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
> +Note: if ``libinput`` is not available on your system try using
> +``evemu-record``.

this should probably read "If ``libinput record`` is not avaiable..."
because it's often in a seprate package (libinput-utils on Fedora for
example).

Cheers,
  Peter

> +
> +When something does not work
> +============================
> +
> +There can be a number of reasons why a device does not behave
> +correctly. For example
> +
> +* The HID report descriptor provided by the HID device may be wrong
> +  because e.g.
> +
> +  * it does not follow the standard, so that the kernel
> +    will not able to make sense of the HID report descriptor;
> +  * the HID report descriptor *does not match* what is actually
> +    sent by the device (this can be verified by reading the raw HID
> +    data);
> +* the HID report descriptor may need some "quirks" (see later on).
> +
> +As a consequence, a ``/dev/input/event*`` may not be created
> +for each Application Collection, and/or the events
> +there may not match what you would expect.
> +
> +
> +Quirks
> +------
> +
> +There are some known peculiarities of HID devices that the kernel
> +knows how to fix - these are called the HID quirks and a list of those
> +is available in `include/linux/hid.h`.
> +
> +Should this be the case, it should be enough to add the required quirk
> +in the kernel, for the HID device at hand. This can be done in the file
> +`drivers/hid/hid-quirks.c`. How to do it should be relatively
> +straightforward after looking into the file.
> +
> +The list of currently defined quirks, from `include/linux/hid.h`, is
> +
> +.. kernel-doc:: include/linux/hid.h
> +   :doc: HID quirks
> +
> +Quirks for USB devices can be specified while loading the usbhid module,
> +see ``modinfo usbhid``, although the proper fix should go into
> +hid-quirks.c and **be submitted upstream**.
> +See Documentation/process/submitting-patches.rst for guidelines on how
> +to submit a patch. Quirks for other busses need to go into hid-quirks.c.
> +
> +Fixing HID report descriptors
> +-----------------------------
> +
> +Should you need to patch HID report descriptors the easiest way is to
> +resort to eBPF, as described in Documentation/hid/hid-bpf.rst.
> +
> +Basically, you can change any byte of the original HID report
> +descriptor. The examples in samples/hid should be a good starting point
> +for your code, see e.g. `samples/hid/hid_mouse.bpf.c`::
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
> +Of course this can be also done within the kernel source code, see e.g.
> +`drivers/hid/hid-aureal.c` or `drivers/hid/hid-samsung.c` for a slightly
> +more complex file.
> +
> +Check Documentation/hid/hidreport-parsing.rst if you need any help
> +navigating the HID manuals and understanding the exact meaning of
> +the HID report descriptor hex numbers.
> +
> +Whatever solution you come up with, please remember to **submit the
> +fix to the HID maintainers**, so that it can be directly integrated in
> +the kernel and that particular HID device will start working for
> +everyone else. See Documentation/process/submitting-patches.rst for
> +guidelines on how to do this.
> +
> +
> +Modifying the transmitted data on the fly
> +-----------------------------------------
> +
> +Using eBPF it is also possible to modify the data exchanged with the
> +device. See again the examples in `samples/hid`.
> +
> +Again, **please post your fix**, so that it can be integrated in the
> +kernel!
> +
> +Writing a specialized driver
> +----------------------------
> +
> +This should really be your last resort.
> +
> +
> +.. rubric:: Footnotes
> +
> +.. [#hidraw] read hidraw: see Documentation/hid/hidraw.rst and
> +  file `samples/hidraw/hid-example.c` for an example.
> +  The output of ``hid-example`` would be, for the same mouse::
> +
> +    $ sudo ./hid-example
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
> --- /dev/null	2023-06-28 09:46:06.188159532 +0200
> +++ Documentation/hid/hidreport-parsing.rst	2023-06-27 22:56:18.886315875 +0200
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================================
> +Manual parsing of HID report descriptors
> +========================================
> +
> +Consider again the mouse HID report descriptor
> +introduced in Documentation/hid/hidintro.rst::
> +
> +  $ hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
> +  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
> +  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
> +  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
> +  00000030  81 06 c0 c0                                       |....|
> +  00000034
> +
> +and try to parse it by hand.
> +
> +Start with the first number, 0x05: it carries 2 bits for the
> +length of the item, 2 bits for the type of the item and 4 bits for the
> +function::
> +
> +  +----------+
> +  | 00000101 |
> +  +----------+
> +          ^^
> +          ---- Length of data (see HID spec 6.2.2.2)
> +        ^^
> +        ------ Type of the item (see HID spec 6.2.2.2, then jump to 6.2.2.7)
> +    ^^^^
> +    --------- Function of the item (see HID spec 6.2.2.7, then HUT Sec 3)
> +
> +In our case, the length is 1 byte, the type is ``Global`` and the
> +function is ``Usage Page``, thus for parsing the value 0x01 in the second byte
> +we need to refer to HUT Sec 3.
> +
> +The second number is the actual data, and its meaning can be found in
> +the HUT. We have a ``Usage Page``, thus we need to refer to HUT
> +Sec. 3, "Usage Pages"; from there, one sees that ``0x01`` stands for
> +``Generic Desktop Page``.
> +
> +Moving now to the second two bytes, and following the same scheme,
> +``0x09`` (i.e. ``00001001``) will be followed by one byte (``01``)
> +and is a ``Local`` item (``10``). Thus, the meaning of the remaining four bits
> +(``0000``) is given in the HID spec Sec. 6.2.2.8 "Local Items", so that
> +we have a ``Usage``. From HUT, Sec. 4, "Generic Desktop Page",  we see that
> +0x02 stands for ``Mouse``.
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
> index 7f2e8ba7d783..8d1699f355ec 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -341,6 +341,29 @@ struct hid_item {
>   */
>  #define MAX_USBHID_BOOT_QUIRKS 4
>  
> +/**
> + * DOC: HID quirks
> + * | @HID_QUIRK_NOTOUCH:
> + * | @HID_QUIRK_IGNORE: ignore this device
> + * | @HID_QUIRK_NOGET:
> + * | @HID_QUIRK_HIDDEV_FORCE:
> + * | @HID_QUIRK_BADPAD:
> + * | @HID_QUIRK_MULTI_INPUT:
> + * | @HID_QUIRK_HIDINPUT_FORCE:
> + * | @HID_QUIRK_ALWAYS_POLL:
> + * | @HID_QUIRK_INPUT_PER_APP:
> + * | @HID_QUIRK_X_INVERT:
> + * | @HID_QUIRK_Y_INVERT:
> + * | @HID_QUIRK_SKIP_OUTPUT_REPORTS:
> + * | @HID_QUIRK_SKIP_OUTPUT_REPORT_ID:
> + * | @HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP:
> + * | @HID_QUIRK_HAVE_SPECIAL_DRIVER:
> + * | @HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE:
> + * | @HID_QUIRK_FULLSPEED_INTERVAL:
> + * | @HID_QUIRK_NO_INIT_REPORTS:
> + * | @HID_QUIRK_NO_IGNORE:
> + * | @HID_QUIRK_NO_INPUT_SYNC:
> + */
>  /* BIT(0) reserved for backward compatibility, was HID_QUIRK_INVERT */
>  #define HID_QUIRK_NOTOUCH			BIT(1)
>  #define HID_QUIRK_IGNORE			BIT(2)
