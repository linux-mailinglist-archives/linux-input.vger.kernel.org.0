Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641842CC199
	for <lists+linux-input@lfdr.de>; Wed,  2 Dec 2020 17:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgLBQCu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Dec 2020 11:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgLBQCu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Dec 2020 11:02:50 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0D1C0613CF
        for <linux-input@vger.kernel.org>; Wed,  2 Dec 2020 08:02:10 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id f16so2047879otl.11
        for <linux-input@vger.kernel.org>; Wed, 02 Dec 2020 08:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gdlHGZ1m/gBnsOqQicvFwR+hM/IvDfRRWs65PBxCfGA=;
        b=AKluyGF1uUnvLLuUgx0BqrWk9S60s575MRf+7eiOomEOpoTXd+WNtmVSRNIHRy89Oi
         wyK+wJO9oXlm6EuYz/wMDTJJGBj0utAhxcHOFY4AH+lkrxgEf1Xh/PbSkoMgx0egHPN2
         FuiP0zgA/EqFxQ/dYHPDY4qALk+MXohJ811jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gdlHGZ1m/gBnsOqQicvFwR+hM/IvDfRRWs65PBxCfGA=;
        b=iDD1pt6lgka/7jF0pQJ6IP8Ntf2z6WsGLTfizShP+qfwoEIYuWYjU8nonGGupnf10Y
         kFWdLJNxwZjiCEY4GzWjKdFYLt1EPnbG+in+sLdxluwzY5lVrtAyhMC13SIk6P3LmKKO
         Z79IzxGTdeMFtUpWcPU6RkrVcifWNOvRrz1OrDd59CYT8QTX0jZSCq+If4mKEBe6c3PV
         MIuHX8Ls8VYw7Cyj5XCsAciODuQ97BUGiunLCHD9oQqkb+6Vep6KOoMT4vPt5ls0ZNL1
         Fqh8uqBTRxc2B4KHi2ZEcaQKoLfH0T13UfzbGPqpjnPQ1+2WVzggwAfOaK1IudQBEWEG
         pnJQ==
X-Gm-Message-State: AOAM532rf+WfrjZRD/zuAaKbsyxDys/V2Sh4w7RJwFYdamcNlW3ZFtsK
        4Atj6UdGAiCVrsr+WpE57CWyQkU91KTJiQ==
X-Google-Smtp-Source: ABdhPJz9KcmCbEc+JiwilGH3kLkvMvUebB/Mk/VUEZELoYO8b5lgN/bFILj35FN4s5m3yk7UuP8yUA==
X-Received: by 2002:a05:6830:100a:: with SMTP id a10mr2363913otp.141.1606924929451;
        Wed, 02 Dec 2020 08:02:09 -0800 (PST)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id z10sm446813oom.3.2020.12.02.08.02.09
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 08:02:09 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id t142so467862oot.7
        for <linux-input@vger.kernel.org>; Wed, 02 Dec 2020 08:02:09 -0800 (PST)
X-Received: by 2002:ab0:35fa:: with SMTP id w26mr1655817uau.90.1606924491739;
 Wed, 02 Dec 2020 07:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20201112004130.17290-1-dianders@chromium.org> <CAD=FV=W122aWPbg7Fo=zg+QmK7DHBcYTQ6CjPawLhucd4Rtw9A@mail.gmail.com>
 <CAO-hwJ+amboty_wKzP3n11mHLfssGz8Npzdfu9QrcipEvu3VHA@mail.gmail.com>
In-Reply-To: <CAO-hwJ+amboty_wKzP3n11mHLfssGz8Npzdfu9QrcipEvu3VHA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Dec 2020 07:54:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VkyF8B9stozXv_Xt7a-Od4-1f2h6QS5DDekiZCQhXjgw@mail.gmail.com>
Message-ID: <CAD=FV=VkyF8B9stozXv_Xt7a-Od4-1f2h6QS5DDekiZCQhXjgw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] HID: i2c-hid: Reorganize to allow supporting goodix,gt7375p
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Rob Herring <robh+dt@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>, Pavel Balan <admin@kryma.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Dec 2, 2020 at 7:20 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Doug,
>
> On Tue, Dec 1, 2020 at 10:12 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Nov 11, 2020 at 4:41 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > The goal of this series is to support the Goodix GT7375P touchscreen.
> > > This touchscreen is special because it has power sequencing
> > > requirements that necessitate driving a reset GPIO.
> > >
> > > To do this, we totally rejigger the way i2c-hid is organized so that
> > > it's easier to jam the Goodix support in there.
> > >
> > > This series was:
> > > - Tested on a device that uses normal i2c-hid.
> > > - Tested on a device that has a Goodix i2c-hid device.
> > > - Tested on an ACPI device, but an earlier version of the series.
> > >
> > > Changes in v6:
> > > - ACPI probe function should have been "static"
> > > - Don't export suspend/resume, just export dev_pm_ops from core.
> > > - Fixed crash in ACPI module (missing init of "client")
> > > - No need for regulator include in the core.
> > > - Removed i2c_device_id table from ACPI module.
> > > - Suspend/resume are no longer exported from the core.
> > >
> > > Changes in v5:
> > > - Add shutdown_tail op and use it in ACPI.
> > > - Added mention of i2c-hid in the yaml itself as per Rob.
> > > - Adjusted subject as per Rob.
> > > - i2chid_subclass_data => i2chid_ops.
> > > - power_up_device => power_up (same with power_down).
> > > - subclass => ops.
> > >
> > > Changes in v4:
> > > - ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.
> > > - Fully rejigger so ACPI and OF are full subclasses.
> > > - Totally redid based on the new subclass system.
> > >
> > > Changes in v3:
> > > - Fixed compatible in example.
> > > - Removed Benjamin as a maintainer.
> > > - Rework to use subclassing.
> > > - Updated description.
> > >
> > > Changes in v2:
> > > - ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.
> > > - Get timings based on the compatible string.
> > > - Use a separate compatible string for this new touchscreen.
> > >
> > > Douglas Anderson (4):
> > >   HID: i2c-hid: Reorganize so ACPI and OF are separate modules
> > >   arm64: defconfig: Update config names for i2c-hid rejigger
> > >   dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix
> > >     GT7375P
> > >   HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core
> > >
> > >  .../bindings/input/goodix,gt7375p.yaml        |  65 +++++
> > >  arch/arm64/configs/defconfig                  |   3 +-
> > >  drivers/hid/Makefile                          |   2 +-
> > >  drivers/hid/i2c-hid/Kconfig                   |  47 +++-
> > >  drivers/hid/i2c-hid/Makefile                  |   6 +-
> > >  drivers/hid/i2c-hid/i2c-hid-acpi.c            | 159 +++++++++++
> > >  drivers/hid/i2c-hid/i2c-hid-core.c            | 254 +++---------------
> > >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 116 ++++++++
> > >  drivers/hid/i2c-hid/i2c-hid-of.c              | 143 ++++++++++
> > >  drivers/hid/i2c-hid/i2c-hid.h                 |  22 ++
> > >  include/linux/platform_data/i2c-hid.h         |  41 ---
> > >  11 files changed, 596 insertions(+), 262 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > >  create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
> > >  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > >  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
> > >  delete mode 100644 include/linux/platform_data/i2c-hid.h
> >
> > Are there any additional changes that folks would like with this
> > series?  It's not crazy urgent to get it in, but it touches enough
> > lines of code that it'd be nice to get it in before other patches land
> > and it gets merge conflicts.
>
> Sorry for the delay. I was having an internal deadline last week. I
> just re-read the code, and I am quite happy with it. I also just
> tested it on the i2c-hid w/ acpi machine I have here, and it seems OK.
>
> So other than that, do we need to have approvals for patch 2/4
> (arch/arm64/configs/defconfig)? I can easily take that in the HID
> tree, but I prefer having the approval from the maintainers first.
> Catalin, Will?

From my past knowledge of the arm64 defconfig, I think it's a bit of a
free-for-all, sort of like updates to the "MAINTAINERS" file.  Doing a
"git log" on it I see commits happen from every corner and very few of
them have Acks.  I think many (but not all) of the commits to this
file go through trees that feed into the SoC tree (Arnd and Olof)
because those maintainers care about enabling drivers for boards that
they're supporting, but changes come from elsewhere too.

Obviously an Ack wouldn't hurt, though.  Since get_maintainer points
at Will and Catalin I wouldn't say no if one of them wanted to Ack
patch #2 in the series.  ;-)


> > Hrm, I just checked and there actually is already one merge conflict
> > with commit afdd34c5fa40 ("HID: i2c-hid: show the error when failing
> > to fetch the HID descriptor") but that commit (and thus the
> > resolution) is trivial.  If there are no other comments I can re-post
> > atop that patch.  ...or I'm also happy if a maintainer is OK w/
> > resolving when landing my series.  Just let me know!
>
> If I can quickly get the approval from the arm64/config maintainers, I
> can try to apply it. Though, I wouldn't be against you sending a clean
> and conflict-free series :)

I'll hold tight at the moment to avoid fragmenting the discussion
while we figure out if we need an Ack on the defconfig.  If that gets
resolved and you're ready to land, do it.  Otherwise I'll spin out a
clean version once I think the Ack question is resolved.


> > ...or, if you want me to just shut up for a while and wait until your
> > tryptophan hangover wears off, that's fine too--just let me know.
> >
>
> Heh. Sorry, I have a tendency to have my inbox flooded, and some time
> gets distracted to do other important work I am paid for (too). I
> don't mind a gentle nudge from time to time, that helps figuring out
> the priorities :)

I get ya and I'm the same way, but everyone has a different workflow
and I try to make allowances if I can...


-Doug
