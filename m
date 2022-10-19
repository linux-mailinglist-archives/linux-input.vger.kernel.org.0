Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBEE604B3C
	for <lists+linux-input@lfdr.de>; Wed, 19 Oct 2022 17:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiJSPZ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Oct 2022 11:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbiJSPZG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Oct 2022 11:25:06 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 664961CC767
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 08:18:34 -0700 (PDT)
Received: (qmail 1253247 invoked by uid 1000); 19 Oct 2022 11:17:33 -0400
Date:   Wed, 19 Oct 2022 11:17:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     linux-input@vger.kernel.org
Cc:     Andreas Bergmeier <abergmeier@gmx.net>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Litra Glow on Linux
Message-ID: <Y1AVDck5sQf8+QFX@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Forwarding this message to the linux-input mailing list, since it 
concerns the input layer and not the USB layer.

Alan Stern

PS: Note that problem 1 below is easily solved with a udev script.

----- Forwarded message from Andreas Bergmeier <abergmeier@gmx.net> -----

Date: Mon, 17 Oct 2022 18:45:30 +0200
From: Andreas Bergmeier <abergmeier@gmx.net>
To: linux-usb@vger.kernel.org
Subject: Litra Glow on Linux

On my Ubuntu machine i am running 5.15.0. Now when I plugin in my
Logitech Litra Glow, it gets detected and the following shows up in my
dmesg:

```
input: Logi Litra Glow Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4.2/3-4.2:1.0/0003:046D:C900.000B/input/input75
hid-generic 0003:046D:C900.000B: input,hiddev0,hidraw2: USB HID v1.11
Device [Logi Litra Glow] on usb-0000:00:14.0-4.2/input0
```

Via (hardware) buttons you can switch the device on, regulate the
color temperature as well as the brightness.
I know of no way to fully control the device from my computer and
would like to change that.

It seems to me like I need to solve 4 problems (in userspace and maybe
kernelspace):
1. Handle plugging in and off
2. Listen to events (button pressed) from the device
3. Get the current state of the device
4. Send events to the device


The device seems to provide a pretty bare HID Report interface with no
alternate configurations:
https://github.com/abergmeier/litra_glow_linux/blob/main/lsusb
The HID seems to define 3 Reports:
https://github.com/abergmeier/litra_glow_linux/blob/main/parsed_descriptor

Ignoring 1. for now.

Trying to solve 2. I wrote a basic HIDDEV application. Using `read` I
only see events from Report 17 (0x11). For all my experimenting with
the device I have never seen a Report 1 or 2.
So I get events, but it seems like the provided
`hiddev_usage_ref.value` is sometimes wrong (seems to be 0 and 1 for
most of the time even if I adjust the brightness).
Doing a recording (turning on, adjusting brightness, turning off) of
the raw HID events seems like the "correct" events are sent from the
device: https://github.com/abergmeier/litra_glow_linux/blob/main/hid-recorder.
So it seems to me like maybe the values get mixed up somewhere in the HID code.
Alternatively I did a `evtest` run on the /dev/input/event* for the
`Logi Litra Glow Consumer Control`:
https://github.com/abergmeier/litra_glow_linux/blob/main/evtest
When pressing (hardware) buttons no events showed up in `evtest´.
Probably not surprising since these would be from Report 1 and 2 IIUC.
Now I am not sure whether the USB interface is sketchy or whether one
needs to activate the _Consumer Control_ somehow.

Trying to solve 3. from what I understand with HID there usually is no
way of reading the current state of the device?

Trying to solve 4. there are userspace libraries in Python and Go
which send events to the device bypassing HID. So there may be some
quirks handling necessary in HID but I would defer that until 2. is
done.

With all that I am pretty much at my wits end and would appreciate any
input how to further analyze the device situation.

Cheers

----- End forwarded message -----
