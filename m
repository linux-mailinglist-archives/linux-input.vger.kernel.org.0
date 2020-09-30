Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FE327F590
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 00:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731870AbgI3W4L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 18:56:11 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:56121 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731925AbgI3W4K (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 18:56:10 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8aa5cbe1
        for <linux-input@vger.kernel.org>;
        Wed, 30 Sep 2020 22:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=NaQIiOhcJeyaTv29bE4+TAtG/Zs=; b=s+Tz4l
        POXPa2okYYZv6G/uffGZuUnmVAzkX6llYwZfnmyxGgMHq60gTJWkfVxp5CtZge2B
        gYUNyr1JNGPyM2HOW/3dJbI67cUnP5B0YgiQZRvV72jwjZAMV68M5NeXw4WZQTQl
        ZL/QpBkBMzZDuXatLNbQbRhCZEVm8I8yzPA2gPDMLanpKU+ybYOyHRTnE6zTUar7
        UIpErkTyj+E3LMIerWXvXnNJsapJWwiGYEuPYJrdaJ4cU9rBVC0mwvVQ2HKgABdw
        7r0VDeyglj9/OK4Do3Jp5LuRS3Uozcwmjk9ZUCsILbRl030jx/uZ1sENg0KhbLGJ
        xx2T200LyBwcvZhA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb33c388 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-input@vger.kernel.org>;
        Wed, 30 Sep 2020 22:24:22 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e5so4089253ils.10
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 15:56:09 -0700 (PDT)
X-Gm-Message-State: AOAM53033T/8eUqClpPfWj+podqMHah6tZqGITjle/RGCWZoB1VHyZ0D
        XBDkK+r/TJXmt0wy6wa/06iPUc1g2Gfn4DTsPEI=
X-Google-Smtp-Source: ABdhPJwCw1D2QqzZmqb8SNlMTwOpm5YxVan6UEd8rp9wlhend3YZ00JiFENuaHuQ+xGE2R09jgbBEMPEIxgQX9H1H3U=
X-Received: by 2002:a92:3408:: with SMTP id b8mr139625ila.231.1601506568720;
 Wed, 30 Sep 2020 15:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
 <20200930112437.13705-1-Jason@zx2c4.com> <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <CAHmME9rY6RkJ7JHN=-=e=QaN=FZtqbhMJ8NqTwBtwDCw7K1bEA@mail.gmail.com> <1f233aeab705d9dae33c0d3fc910a94420ddb5a7.camel@redhat.com>
In-Reply-To: <1f233aeab705d9dae33c0d3fc910a94420ddb5a7.camel@redhat.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 1 Oct 2020 00:55:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9qAjoavbwtqOxmJ=QWqt6+jufUsoikMnWwWpppzMXASyg@mail.gmail.com>
Message-ID: <CAHmME9qAjoavbwtqOxmJ=QWqt6+jufUsoikMnWwWpppzMXASyg@mail.gmail.com>
Subject: Re: [PATCH v2] Input: synaptics - enable InterTouch for ThinkPad
 X1E/P1 2nd gen
To:     Lyude Paul <lyude@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 30, 2020 at 9:55 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Wed, 2020-09-30 at 18:18 +0200, Jason A. Donenfeld wrote:
> > On Wed, Sep 30, 2020 at 6:05 PM Lyude Paul <lyude@redhat.com> wrote:
> > > Maybe correct the comment in smbus_pnp_ids to reflect this handles both the
> > > X1
> > > Extreme and P2 2nd Gen. Then I'd probably split the bootloader change into a
> > > commit that comes before adding the new PnP IDs.
> >
> > Okay, I'll submit a v3.
> >
> > One thing I should note is that the sensitivity sysfs entry doesn't
> > seem to do anything at all. push_to_click works, but not sensitivity.
> > I don't know if this has bitrotted over the years and I shouldn't
> > expect it to work, as it rarely does or something, but thought I
> > should mention this.
>
> Interesting-it's entirely possible that maybe the firmware on this trackpoint is
> different from the previous ones (only mention this possibility since it looks
> like at some point in time they switched over from using the legitimate IBM
> trackpoint modules to getting other manufacturers to make them).

Yea, a bummer. The P1 gen 2 has an ELAN. Far cry from all the nice
features supported by the IBM ones.

> I know the
> sensitivity setting works on my laptop with PS/2 through RMI4 though.

Right. My prior P50 worked fine with it.


>
> Could you maybe enable rmi4 debugging by passing rmi_core.debug_flags=0xff when
> you boot your machine and get me the dmesg output from that after you've tried
> changing the sensitivity value? Not sure I could fix it, but it'd be interesting
> to see what's happening on the ps/2 side here

Sure. Writing 200 into sensitivity gives:

[28653.834012] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Wrote f5 to
PS/2 passthrough address
[28653.834989] rmi4_smbus 0-002c: wrote 1 bytes at 0x02: 0 (f5)
[28653.848217] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received fa
from PS2 guest T: N P: N
[28653.848301] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Wrote e2 to
PS/2 passthrough address
[28653.849079] rmi4_smbus 0-002c: wrote 1 bytes at 0x02: 0 (e2)
[28653.857787] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received fa
from PS2 guest T: N P: N
[28653.857868] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Wrote 81 to
PS/2 passthrough address
[28653.858643] rmi4_smbus 0-002c: wrote 1 bytes at 0x02: 0 (81)
[28653.865220] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received fa
from PS2 guest T: N P: N
[28653.865285] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Wrote 4a to
PS/2 passthrough address
[28653.866053] rmi4_smbus 0-002c: wrote 1 bytes at 0x02: 0 (4a)
[28653.872889] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received fa
from PS2 guest T: N P: N
[28653.872952] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Wrote c8 to
PS/2 passthrough address
[28653.873927] rmi4_smbus 0-002c: wrote 1 bytes at 0x02: 0 (c8)
[28653.880331] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received fa
from PS2 guest T: N P: N
[28653.880397] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Wrote f4 to
PS/2 passthrough address
[28653.881156] rmi4_smbus 0-002c: wrote 1 bytes at 0x02: 0 (f4)
[28653.888285] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received fa
from PS2 guest T: N P: N

Subsequently, moving the trackpoint around gives the usual output:

[28765.017676] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 05
from PS2 guest T: N P: N
[28765.017677] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received ff
from PS2 guest T: N P: N
[28765.025214] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 28
from PS2 guest T: N P: N
[28765.025216] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 06
from PS2 guest T: N P: N
[28765.025216] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received ff
from PS2 guest T: N P: N
[28765.050927] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 28
from PS2 guest T: N P: N
[28765.050929] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 05
from PS2 guest T: N P: N
[28765.050951] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received ff
from PS2 guest T: N P: N
[28765.050958] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 08
from PS2 guest T: N P: N
[28765.050959] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 04
from PS2 guest T: N P: N
[28765.050959] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 00
from PS2 guest T: N P: N
[28765.099642] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 18
from PS2 guest T: N P: N
[28765.099644] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received ff
from PS2 guest T: N P: N
[28765.099644] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 00
from PS2 guest T: N P: N
[28765.099651] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 18
from PS2 guest T: N P: N
[28765.099652] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received ff
from PS2 guest T: N P: N
[28765.099652] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 00
from PS2 guest T: N P: N
[28765.230269] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 08
from PS2 guest T: N P: N
[28765.230276] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 00
from PS2 guest T: N P: N
[28765.230279] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 01
from PS2 guest T: N P: N
[28765.270171] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 08
from PS2 guest T: N P: N
[28765.270178] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 00
from PS2 guest T: N P: N
[28765.270181] rmi4_f03 rmi4-00.fn03: rmi_f03_attention: Received 01
from PS2 guest T: N P: N
