Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0ED72EF6D0
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 18:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbhAHRyf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 12:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60659 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728480AbhAHRyV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 12:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610128374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ApjdY65NLh4ukaTTHH8c86uuWfyLWMuFPHofhf/ZJ0I=;
        b=Nxr3VzAzurwoTMb1LnSfU2p9AzdQ++owVF1puBJ8HmLvjEjSmP+sSOmDpchUSAwwt2i99M
        YIBSTm7yYT+uX/+5pdXAeJAV9Pm1XxLHyz0eKRcnw+xMhLjnIGpRMzjI8IRkq/1Ljab01p
        5dxOVMzGemAgacpX8P9hjThluZK3D3Q=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-_9anQMtHNPGLFayQ_bFz6Q-1; Fri, 08 Jan 2021 12:52:53 -0500
X-MC-Unique: _9anQMtHNPGLFayQ_bFz6Q-1
Received: by mail-pg1-f199.google.com with SMTP id 26so7948336pgl.2
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 09:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApjdY65NLh4ukaTTHH8c86uuWfyLWMuFPHofhf/ZJ0I=;
        b=pWH3IG755we99wAQmt1krSYjSwqQ9Kt0iBeRnRWCqMvPa7ZLFkxnoo1imJzeLo4eOL
         uNMa2ZAyhNyJd8Dp08GvOPEJDtkugpR2SoOGhKHHxCoL5x/Myl6B22RDXkkWsiWV7wNS
         JyF12NpK6i67caQUNrrpuA8CjJZt6je9qWwIU0e1gZErGKXC8I36fLmO1meitB5aXtQ2
         YVCFdfFIfWSbaBCd8b9qxGQg9n157ltrQ61eig8Ik4lbPa1xFN4mdOyuf1DyEmlumRny
         Zl0EZgkc5mCtjjE2fbzUJeGbM/lU/nIXpHd+KdRbrMtantyBLvpm2gQOnnv4xtW0BreG
         MWYA==
X-Gm-Message-State: AOAM533Sr6E9dlzEbOB/gMQJWSBgRq5mcrdQ7tB83yomc1/alCvD0QIG
        a/mLrgdhDhL8YQa6xWkyD0+DnCHhc0VtlzezgCQ5PH0xQNXtBxcY47WsoXRFi+R4gWYnfBswNVj
        uKERjq/jzsTm/RIs+XB3p60a7wLHpyD5W3Yu1z08=
X-Received: by 2002:aa7:8641:0:b029:1a1:e2f5:23de with SMTP id a1-20020aa786410000b02901a1e2f523demr4697929pfo.35.1610128372063;
        Fri, 08 Jan 2021 09:52:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9ULWofreNDD91DUrkxShVGr1ZmP4TBmQxtimlVwbZObVFp63Ht0t6i8P+fj0Epj5Me2AF1+DolTtFy7YXtb4=
X-Received: by 2002:aa7:8641:0:b029:1a1:e2f5:23de with SMTP id
 a1-20020aa786410000b02901a1e2f523demr4697894pfo.35.1610128371787; Fri, 08 Jan
 2021 09:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20201211222448.2115188-1-dianders@chromium.org> <CAD=FV=Ve4wGJ=KxQjraYsiAQZHG_5qEeFW0ZhmBBkRmtdm7Gwg@mail.gmail.com>
In-Reply-To: <CAD=FV=Ve4wGJ=KxQjraYsiAQZHG_5qEeFW0ZhmBBkRmtdm7Gwg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 8 Jan 2021 18:52:40 +0100
Message-ID: <CAO-hwJK+=537C-EbgNXPY3=m5LvM8SVKCDB5X145BfSMHgUMdw@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] HID: i2c-hid: Reorganize to allow supporting goodix,gt7375p
To:     Doug Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Jiri Kosina <jikos@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Max Krummenacher <max.oss.09@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Pavel Balan <admin@kryma.net>, Shawn Guo <shawnguo@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Doug,

On Wed, Jan 6, 2021 at 2:35 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Benjamin,
>
> On Fri, Dec 11, 2020 at 2:24 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The goal of this series is to support the Goodix GT7375P touchscreen.
> > This touchscreen is special because it has power sequencing
> > requirements that necessitate driving a reset GPIO.
> >
> > To do this, we totally rejigger the way i2c-hid is organized so that
> > it's easier to jam the Goodix support in there.
> >
> > This series was:
> > - Tested on a device that uses normal i2c-hid.
> > - Tested on a device that has a Goodix i2c-hid device.
> > - Tested on an ACPI device, but an earlier version of the series.
> >
> > I believe the plan is for Benjamin to land the whole series.  Will
> > said this about the arm64 defconfig change (and provided his Ack):
> > > ...there are a few things I really care about
> > > in defconfig (e.g. things like page size!), generally speaking we don't
> > > need to Ack everything that changes in there.
> > >
> > > That said, might be worth checking whether arm-soc have any defconfig
> > > changes queued in -next so you don't end up with conflicts.
> >
> > Changes in v8:
> > - Mark suspend/resume as static as per patches robot.
> >
> > Changes in v7:
> > - Rebase atop commit afdd34c5fa40 ("HID: i2c-hid: show the error ...")
> >
> > Changes in v6:
> > - ACPI probe function should have been "static"
> > - Don't export suspend/resume, just export dev_pm_ops from core.
> > - Fixed crash in ACPI module (missing init of "client")
> > - No need for regulator include in the core.
> > - Removed i2c_device_id table from ACPI module.
> > - Suspend/resume are no longer exported from the core.
> >
> > Changes in v5:
> > - Add shutdown_tail op and use it in ACPI.
> > - Added mention of i2c-hid in the yaml itself as per Rob.
> > - Adjusted subject as per Rob.
> > - i2chid_subclass_data => i2chid_ops.
> > - power_up_device => power_up (same with power_down).
> > - subclass => ops.
> >
> > Changes in v4:
> > - ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.
> > - Fully rejigger so ACPI and OF are full subclasses.
> > - Totally redid based on the new subclass system.
> >
> > Changes in v3:
> > - Fixed compatible in example.
> > - Removed Benjamin as a maintainer.
> > - Rework to use subclassing.
> > - Updated description.
> >
> > Changes in v2:
> > - ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.
> > - Get timings based on the compatible string.
> > - Use a separate compatible string for this new touchscreen.
> >
> > Douglas Anderson (4):
> >   HID: i2c-hid: Reorganize so ACPI and OF are separate modules
> >   arm64: defconfig: Update config names for i2c-hid rejigger
> >   dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix
> >     GT7375P
> >   HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core
>
> I think this series is ready to land.  The "defconfig" has a trivial
> conflict with commit 74b87103b3d0 ("arm64: defconfig: Enable HID
> multitouch") against linuxnext, but it's so simple that hopefully
> folks will be OK with that when it lands.
>
> Please let me know if there's anything else you need me to do.  :-)
>

I wanted to apply the series yesterday, but for these kinds of changes
I like giving it a spin on actual hardware. Turns out that my XPS-13
can not boot to v5.11-rc2, which makes testing the new branch slightly
more difficult.

I'll give it a spin next week, but I think I should be able to land it for 5.12.

Regarding the defconfig conflict, no worries, we can handle it with
Stephen and Linus.

Cheers,
Benjamin

