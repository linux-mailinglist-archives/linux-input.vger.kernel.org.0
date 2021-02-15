Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA3931C10A
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 18:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhBORwW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 12:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbhBORwH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 12:52:07 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D23C061574
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 09:51:27 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id e11so5367333qtg.6
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYRCQT5vrlOPz6zIgVilggfOH58GkBaW5bWQddSpVEs=;
        b=ZdPo2nvtLqr0NDysJQUvvlqltiPLPS49EmxkUSpknMEd+1WzBtr5y9V3kdBvBqQvpO
         Bg4ClGb9dbTu/6COhTsqzWOdANHJzMBCnQoHGFDR5WqIbYZ9vcINTHVXAoQ/r9kcelY3
         wM4JBQUbsHWtKPhPWoT5anZH5R5Sul3GzDNlcugNcwYamzOsBSbnZcd3M92COm2bgqUU
         M2B8+GBoFOTVd+/5A3+SwKACP7j1t5iJPbaNLLAvJky4OpnFcjvFs/Vzx/E//SPlUg53
         uUGid+9r3/5szc3YeWUx9ruSOGHa+7lKhBVkYNAGPR3Wlam5Pr+xz4NGKNiCP1+AfAM9
         g5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYRCQT5vrlOPz6zIgVilggfOH58GkBaW5bWQddSpVEs=;
        b=i+hqnW04X/ZjHCIdydtbkd5tiwyZ9fZsob+vYbo+A9XCBNJZoTpd+Lac+OSq+/q1PS
         BndsSPcDplmWhRWWEJ1CR61CypqcUTUFPk2fkDLl1slp8ntivcvw1aUGnWbPbto/vXr3
         qbCjZk3zijsJMpTNhyiZWQbItcIEZ4z3UwcUePRQwZxMbJW1XODP7sWPiiPeFV80xsjm
         d10xAlffwqCmQ6rcXO1/VIraa6qnWJ0oE2SCGUWhrmpb3RPD4BTh8pET+/FjNqGkIxVu
         Qu2f8Zpo6ZJTOuDBggZmWY4XIOgf1x7HRNnasBMWXU0/Pa24jE/QqwyCzIvhkUncBX2q
         xUmw==
X-Gm-Message-State: AOAM530vSUH4J/bbxeeCTKLlEGqYMaogJp0pgqyk8gx03n3HRvfHqrMG
        8ebpL5wTt4F6ZNFF8/oUEmUMwObse9lVyOL7tLrfiw==
X-Google-Smtp-Source: ABdhPJzUYjg4vCBuF2BfWeZVxZr5QO0ggsDJYGrXMKXhbFHzV94glBuSq6P2MXVEY7i3BW1CAXDPk8a0C+8ww2PCbZ0=
X-Received: by 2002:ac8:764c:: with SMTP id i12mr14851425qtr.110.1613411486666;
 Mon, 15 Feb 2021 09:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-2-roderick@gaikai.com>
 <20210215143144.060fdbe6@nic.cz> <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
 <20210215165518.16033bb6@nic.cz>
In-Reply-To: <20210215165518.16033bb6@nic.cz>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 15 Feb 2021 09:51:15 -0800
Message-ID: <CANndSKkVAFJzf58CNYw_j0QY7hd4umOMn5Cs6U3JnK6TozWdEQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 15, 2021 at 7:55 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Mon, 15 Feb 2021 07:36:58 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > Hi Marek,
> >
> > On Mon, Feb 15, 2021 at 5:31 AM Marek Behun <marek.behun@nic.cz> wrote:
> > >
> > > On Sun, 14 Feb 2021 16:45:46 -0800
> > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > >
> > > > +     led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
> > > > +                     ps_dev->mac_address);
> > > ...
> > > > +     ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);
> > >
> > > The LED subsystem has a predefined schema by which LED names should
> > > look like:
> > >   devicename:color:function
> > > (Not all fields are required, but the order must be preserved. The ':'
> > >  character should be used only as separator of these fields, so not MAC
> > >  addresses in these names, it will confuse userspace parsers.)
> > > See Documentation/leds/leds-class.rst
> > >
> > > The devicename part should not be "playstation". It should be something
> > > otherwise recognizable from userspace. For example an mmc indicator has
> > > devicename "mmc0", keyboard capslock LED can have devicename "input0"...
> > >
> > > In your case the name should be something like:
> > >   input3:rgb:indicator
> >
> > Naming is a little bit tricky. The LEDs as well as other sysfs nodes
> > are added to the 'parent' HID device, not the input devices. In case
> > of DualSense it is actually implemented as a composite device with
> > mulitple input devices (gamepad, touchpad and motion sensors) per HID
> > device. The device name of HID devices seems to be something like:
> > <bus>:<vendor_id>:<product_id>:<some other id> e.g. for DualSense USB
> > 0003:054C:0CE6.0029 or Bluetooth 0005:054C:0CE6.002B
> >
> > This is I guess why many HID devices in general pick their own names
> > (and not all have need to have input devices I guess). Though Benjamin
> > and Jiri know better.
> >
> > I'm not sure what naming could make sense here. The previous Sony
> > driver for PlayStation devices used: HID_name "::red" for e.g. red LED
> > on DualShock 4.
>
> We have to find a reasonable devicename here. If each joystick registers
> multiple input devices, it cannot be "input%d". I suppose there isn't
> an API for grouping mulitple input devices toghether into inputgroups.
> Maybe it could be in the format "joystick%d".

Yeah, there is no inputgroups mechanism.  It could use some type of
joystick name if that's what desired. However, there is no common ID
code. Individual drivers are sometimes calculating their own IDs
(hid-nintendo, hid-sony, hid-playstation and xpad I think). At least
for hid-sony/hid-playstation the use case for tracking IDs is for a
part to prevent duplicate devices as you can connect your device using
both bluetooth and USB. So would be "ps-joystick0"

At the HID layer there does seem to be a unique ID, but it is only
exposed in the name string: This is how the name is constructed:
     dev_set_name(&hdev->dev, "%04X:%04X:%04X.%04X", hdev->bus,
             hdev->vendor, hdev->product, atomic_inc_return(&id));

This ID is HID specific, but not all input devices use HID.

I'm not entirely sure what makes sense...


> But I don't think it can be "playstation". Nor can MAC addresses be
> there if they contain ':'s.
>
> Marek
