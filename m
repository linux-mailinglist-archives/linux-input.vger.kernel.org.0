Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219216A59FB
	for <lists+linux-input@lfdr.de>; Tue, 28 Feb 2023 14:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjB1N1Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Feb 2023 08:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjB1N1X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Feb 2023 08:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69212A14F
        for <linux-input@vger.kernel.org>; Tue, 28 Feb 2023 05:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677590798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0nflL+RFyijy+MOrYN/ocNgDme0JSg3TrgUceQka/qA=;
        b=iwe2ynDD+3rCGMnUfHuZNXtrbqv80wXOSpPB2xgOdSxdLMVlcH7aF1WoJ9qTegwdvSLetR
        6QpK9hrCklFgCNHD5Eu5LEL2o/4OaCjZoWItGKqBIRWaZUTlAcOy5QyPdRprfs2qWT3n8v
        YAY8u9M1th5jd/BXUZjSB6mYBFuIzOw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-aTM4IqL8MPSmeMfaduGu8w-1; Tue, 28 Feb 2023 08:26:36 -0500
X-MC-Unique: aTM4IqL8MPSmeMfaduGu8w-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-536cad819c7so209540747b3.6
        for <linux-input@vger.kernel.org>; Tue, 28 Feb 2023 05:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nflL+RFyijy+MOrYN/ocNgDme0JSg3TrgUceQka/qA=;
        b=oWd/wRPQCCza82vkZm1QX3ik4gRaMJU+O2C75rAbMUkpLW4qhGyYoEtVCeuI31Z6Z+
         cgQUV30dKyWP8ixt/W4UeG4aDf16cXoq/tlnKBU29n+WyuPUIZOyyeKqs7Cy82Z/BuF1
         i0nSjIvR2v7b2aiMDd38uGc0mv1hFLiQldQhB3ktteKioCHkvQfs29UXr4sFd+edc+ND
         cA8KDlQxGyMxfi0Kag1uq4n4QqftoaulC9zzsYgh/yxGgphLALlGljpTUiwJ1iHrCgny
         MBIFB0K4bRifNhNM4OsidRcSGbCyfkUBwZWFGsGDxov/oXKXO+revxjwoyBTcvAnM505
         NXaQ==
X-Gm-Message-State: AO0yUKV5/sDgpVzYj7Mg6wi0t3fd2kdqq6egYFDMJOAMyt6N1Wfc5X1Z
        xRtKfcrhrK0FrZMTwyVZGoPtPLrpflGTuzP0abGPdak+//2kWjTqPrup63DED2JDwRbHf06gvYA
        58B6+DFmj/RZKht1nwRLlbDAZdetNgY5+40vVo8U=
X-Received: by 2002:a81:b705:0:b0:533:9252:32fa with SMTP id v5-20020a81b705000000b00533925232famr1578238ywh.4.1677590796197;
        Tue, 28 Feb 2023 05:26:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/3bX4Gi9ZZkPRvxv4eE2vCAWG/LKy0mNnDqFLbSl9TB9oMlrHOu7ukkN8cStIHo0bp2imE/jCHAgG4yhN9/PM=
X-Received: by 2002:a81:b705:0:b0:533:9252:32fa with SMTP id
 v5-20020a81b705000000b00533925232famr1578233ywh.4.1677590795935; Tue, 28 Feb
 2023 05:26:35 -0800 (PST)
MIME-Version: 1.0
References: <32a14a8a-9795-4c8c-7e00-da9012f548f8@leemhuis.info> <abb495f7-f973-4614-846b-d3922dc0fe25@leemhuis.info>
In-Reply-To: <abb495f7-f973-4614-846b-d3922dc0fe25@leemhuis.info>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 28 Feb 2023 14:26:24 +0100
Message-ID: <CAO-hwJJ2OMFgpmrXK_Z43z0ddujaS1fNjaAJSWwao4qQN+pJ6w@mail.gmail.com>
Subject: Re: [regression] Bug 216946 - Toshiba satellite click mini l9w-b:
 touchscreen: no touch events with kernel 6.1.4
To:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Hans De Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?R8OpIEtvZXJrYW1w?= <ge.koerkamp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 28, 2023 at 12:32=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 19.01.23 16:06, Linux kernel regression tracking (Thorsten Leemhuis)
> wrote:
> > Hi, this is your Linux kernel regression tracker.
> >
> > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > kernel developer don't keep an eye on it, I decided to forward it by
> > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D216946=
 :
>
> The reporter recently confirmed in the ticket that the issue still
> happens with 6.2.
>
> There wasn't any reply from any of the input developers here or in
> bugzilla afaics. :-/ Hmmm. Could someone from that camp maybe please
> take a minute and at least briefly look into this as answer something
> like "that might be due to a problem in subsystem 'foo'", "maybe ask bar
> for an option", or "we have no idea what might cause this, this needs to
> be bisected"? That would help a lot.

The working dmesg shows a line with:
hid-generic 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00 Device
[SIS0817:00 0457:10FB] on i2c-SIS0817:00
and then
hid-multitouch 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00
Device [SIS0817:00 0457:10FB] on i2c-SIS0817:00

But these 2 lines do not appear on the 6.1.4 logs.

So the device is not properly enumerated by ACPI or I2C. Hans might
have an idea on how to debug/solve that issue.

Also there were no changes between v5.15 and v5.16 in i2c-hid.ko, so
it's unlikely to be an issue there (unless '5.16' means '5.16.x').

Cheers,
Benjamin

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
> >>  G=C3=A9 Koerkamp 2023-01-17 20:21:51 UTC
> >>
> >> Created attachment 303619 [details]
> >> Kernel configuration for v6.1.4/ journalctl (dmesg)/ ACPIdump/lsmod
> >>
> >> Overview:
> >> The touchscreen does not react on touch events.
> >> Touchscreen display and touchpad are working.
> >>
> >> Step to reproduce:
> >> Open any UI page
> >> Try to use touch on relevant UI controls (buttons etc.)
> >>
> >> Result:
> >> No reaction on screen touches
> >>
> >> Expected result:
> >> Reaction on touched control, same as when using the touch pad or conne=
cted mouse (which do work).
> >>
> >> Build information:
> >> The error happens with kernel version 6.1.4
> >> After rebuilding with different kernel versions, it appears that it fi=
rst fails with kernel 5.16
> >>
> >> Additional builds:
> >> The click mini l9w-b still works with kernel 5.10.y LTS and 5.15.y LTS=
.
> >>
> >> Important remark:
> >> Touchscreen still works fine with kernel 6.1.4 using
> >> - an HP x2 detachable 10-p0xx or
> >> - a Lenovo yoga 520-14ikb
> >>
> >> So it could be a hardware dependent issue
> >
> > See the ticket for more details.
> >
> >
> > [TLDR for the rest of this mail: I'm adding this report to the list of
> > tracked Linux kernel regressions; the text you find below is based on a
> > few templates paragraphs you might have encountered already in similar
> > form.]
> >
> > BTW, let me use this mail to also add the report to the list of tracked
> > regressions to ensure it's doesn't fall through the cracks:
> >
> > #regzbot introduced: v5.15..v5.16
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D216946
> > #regzbot title: hid: touchscreen broken with Toshiba satellite click
> > mini l9w-b
> > #regzbot ignore-activity
> >
> > This isn't a regression? This issue or a fix for it are already
> > discussed somewhere else? It was fixed already? You want to clarify whe=
n
> > the regression started to happen? Or point out I got the title or
> > something else totally wrong? Then just reply and tell me -- ideally
> > while also telling regzbot about it, as explained by the page listed in
> > the footer of this mail.
> >
> > Developers: When fixing the issue, remember to add 'Link:' tags pointin=
g
> > to the report (e.g. the buzgzilla ticket and maybe this mail as well, i=
f
> > this thread sees some discussion). See page linked in footer for detail=
s.
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
>

