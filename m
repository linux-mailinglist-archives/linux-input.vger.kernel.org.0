Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E179F31CFB9
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 18:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhBPR4s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 12:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhBPR4q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 12:56:46 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2E4C061574;
        Tue, 16 Feb 2021 09:56:05 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 43F95140BAA;
        Tue, 16 Feb 2021 18:56:03 +0100 (CET)
Date:   Tue, 16 Feb 2021 18:56:02 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
Message-ID: <20210216185602.48a980f6@nic.cz>
In-Reply-To: <CAO-hwJ+=_fjHgenXvHv45sHgzwiG2z9vGeq7fmMqj2=BeYCF1Q@mail.gmail.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-2-roderick@gaikai.com>
        <20210215143144.060fdbe6@nic.cz>
        <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
        <20210215165518.16033bb6@nic.cz>
        <CANndSKkVAFJzf58CNYw_j0QY7hd4umOMn5Cs6U3JnK6TozWdEQ@mail.gmail.com>
        <20210215192124.7a6c8c9d@nic.cz>
        <CAO-hwJ+=_fjHgenXvHv45sHgzwiG2z9vGeq7fmMqj2=BeYCF1Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Feb 2021 18:29:46 +0100
Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:

> > So all HIDs can be uniqely determined via this atomic_inc_return(&id),
> > but it is only stored in string form as part of device name.  
> 
> Yes and no. This atomic_inc is only used to allow a sysfs tree,
> because you can have several HID devices below the same USB, I2C or
> UHID physical device. From the userspace, no-one cares about that ID,
> because all HID devices are exported as input, IIO or hidraw nodes.
> 
> So using this "id" would not allow for a direct mapping HID device ->
> sysfs entry because users will still have to walk through the tree to
> find out which is which.

So you are saying that the fact that userspace cannot take the number
from "hidN" string and simply do a lookup /sys/bus/hid/devices/hidN is
the problem here.

This is not a problem in my opinion, because userspace can simply
access the parent HID device via /sys/class/leds/hidN:color:func/parent.

In fact we did something similar for LEDs connected to ethernet PHYs.
To summarize:
  - ethernet PHYs are identified by long, sometimes crazy strings like
      d0032004.mdio-mii:01
    or even
      /soc/internal-regs@d0000000/mdio@32004/switch0@10/mdio:08
  - for the purposes of having a sane devicename part in LED names, I
    sent this patch
    https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2301470.html
    which adds a simple incrementing integer ID to each PHY device.
    (The code is not in upstream yet because there is other work needed
     and because I decided that some functionality has to be available
     via a different mechanism, but this part is complete and reviewed.)

> An actual one-to-one mapping would using 'hidrawX' because there is a
> one-to-one mapping between /dev/hidrawX for HID devices. However, this
> means that we consider the bus to be hidraw which is plain wrong too.
> 
> The unique ID of HID devices (in /sys/bus/hid/devices) is in the form
> `BUS:VID:PID.XXXX`. I understand the need to not have colons, so could
> we standardize LEDs on the HID subsystem to be named
> `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a mapping
> between the LED and the sysfs, and would also allow users to quickly
> filter out the playstation ones.

As I wrote in other e-mail some minutes ago, this just means that we
need to wait for other people's opinions. Please do not send this
pull-request with the LED patches until this is resolved.

Marek
