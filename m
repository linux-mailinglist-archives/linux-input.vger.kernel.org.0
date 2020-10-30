Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA3C2A0F45
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 21:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgJ3UNZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 16:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgJ3UM0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 16:12:26 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C3AC0613D5;
        Fri, 30 Oct 2020 13:11:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f72so588377pfa.6;
        Fri, 30 Oct 2020 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2nVZWZO04zycBikJuA9X0V2AALdDHuFF2+u3DoIbK0M=;
        b=AZnpsS/q6KDXDlsiuU0SHiFvxOlQaSRQKYq9CfWi7JV5RckrWBG9o5XcXH3Zmi3qwJ
         1CFCRqVMYJatFzIg9EPfUFyQXrGykhxY8C/3Vv7ntTH3m0iRwun1kyUVqOElc/aZNnJ4
         4jmzuwqggwDA+Jl7iN4/p39rcASMe+2Gc4ryDRv89QgNKzR8d1y0pwjSqkXfGJWZFQuZ
         rjMaIhjOwbVYYrVkPxXDr3d9usyGwB7McEaG7UtbR1tUE5J1wCFeZrDo/olTckHVtGnt
         EBG6NKKzGSEzb+BfeLN2otf2ZPFMQhNtKpZzHc+R7PbO9VGkmPAtf372NU5b9lYfSQ5k
         ULXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2nVZWZO04zycBikJuA9X0V2AALdDHuFF2+u3DoIbK0M=;
        b=qzgrXmwsLjzg5ZBWSw7AYJZz9PsvWiYrSN8nwghqhJPs03JjxXAT1GLjEtuWdeIHN/
         7u7A7bKwmjoMXiFzW85UYhrWXxHxbvF9ILgMe4r9NbOf1Er0USqVkrgbuVqh592Xya2N
         cYN3FSu384+UGtW9fA+/rnK4GBHVR64aRwg0wpUouDGy9BYo6kgHXMxEtwAJm+50ickT
         S1nAYvyOSSNjT3G7eCPuqbH8KyHbNqbb1/CW1ej6fDQJA2Ibk0PAJ5sS+gBbqO1Y6pfv
         x6WxGlcL8a+Wh1dHz62fJid4PKZsZjPm3GKS2hdDhoZVuqPxh+OF4XtEn3CARn8I2ZGe
         KTPA==
X-Gm-Message-State: AOAM533618fUZMdzjJwt19WEgphePyIOvMuaYYvHiryiDtvMBVlIbpi2
        nAPidmKFHy2QcIUXRBAqxqY=
X-Google-Smtp-Source: ABdhPJxfQAHDYz1Rw9AjHNEdEvVxfry8WnbqLPpXQ488E9GE188OUSSrHa9ty/QEGdwjpW1P83coKg==
X-Received: by 2002:a63:de07:: with SMTP id f7mr1379407pgg.27.1604088688225;
        Fri, 30 Oct 2020 13:11:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g22sm6839219pfh.147.2020.10.30.13.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 13:11:27 -0700 (PDT)
Date:   Fri, 30 Oct 2020 13:11:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Rob Herring <robh@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        andrea@borgia.bo.it, Kai Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Hans De Goede <hdegoede@redhat.com>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as
 deprecated
Message-ID: <20201030201124.GG2547185@dtor-ws>
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <CAO-hwJLn5XKV+cp+fCRY395uBWuX=JrxgiGSHUnJXFpTzFWu4w@mail.gmail.com>
 <20201030180042.GB3967106@bogus>
 <CAO-hwJK8c+BrH3u5PMCndv6Jjj6K2z=4nyKMAojD09EcHjBROA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJK8c+BrH3u5PMCndv6Jjj6K2z=4nyKMAojD09EcHjBROA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 08:12:06PM +0100, Benjamin Tissoires wrote:
> On Fri, Oct 30, 2020 at 7:00 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Oct 30, 2020 at 11:51:53AM +0100, Benjamin Tissoires wrote:
> > > Hi Doug,
> > >
> > > Foreword: I was about to say "yeah, whatever" to please Rob for once.
> >
> > Read my other reply first... I think we mostly agree.
> >
> > > But after re-reading this and more specifically patch 3 of the series,
> > > that won't do. More comments inlined.
> > >
> > > On Sat, Oct 24, 2020 at 1:23 AM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > As pointed out by Rob Herring [1], we should have a device-specific
> > > > compatible string.  This means people shouldn't be using the
> > > > "i2c-over-hid" compatible string anymore, or at least not without a
> > > > more specific compatible string before it.  Specifically:
> > > >
> > > > 1. For newly added devices we should just have the device-specific
> > > >    device string (no "hid-over-i2c" fallback) and infer the timings
> > > >    and hid-descr-addr from there.
> > >
> > > And that's a big NACK from a maintainer point of view. I know in the
> > > device tree world these strings are important so that people can just
> > > say "I have a device compatible with X", and go on, but in the HID
> > > world that means we will have to implement one compatible struct per
> > > vendor/device, which is not something I want to do.
> >
> > It's not really any different than PCI and USB VID/PIDs.
> 
> Well, it is, because in the USB (HID) world, there is a specification
> that provides all of the entry points a device needs. In the i2c-hid
> case, the only entry point a device needs, in the ACPI world is one
> register address, and this is provided by ACPI itself. So in the ACPI
> world, for i2c-hid devices, we don't need to recompile the driver to
> support any current or new devices.
> 
> >
> > > You can think of it as if you are suddenly saying that because it
> > > would be easier for a few particular USB devices that need a quirk,
> > > you "just" need to add the list of *all* USB HID devices that are
> > > around. i2c-hid should be a driver that doesn't change unless 2 things
> > > happen:
> > > - there is a change in the spec
> > > - there is a specific quirk required for a device that doesn't follow the spec.
> >
> > Or does something outside of what the spec covers.
> 
> This is solved in the ACPI case by running ACPI callbacks, and I am
> more and more thinking we should mimic that for DT devices.

So this is the root of the problem. I2CHID spec was done for ACPI-based
systems, with very limited interface between hardware and the kernel and
all "unplesantness" such as powering up and down devices properly tucked
safely away into firmware. So there is still a lot of custom code, we
just do not see it and can pretend it does not exist.

So even in case of "standard" I2C one can not say they do not need to
recompile to use a new device, they just need to recompile different
thing (driver vs firmware).

I am still unsure if we want a flexible way of describing power up
sequence, or simply hard-code based on a given model. Given that here
are many I2C-HID compatible devices a flexible scheme would be nice IMO.

Thanks.

-- 
Dmitry
