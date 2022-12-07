Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6925645AE3
	for <lists+linux-input@lfdr.de>; Wed,  7 Dec 2022 14:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiLGN0z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Dec 2022 08:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbiLGN0d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Dec 2022 08:26:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A61D5B5AA
        for <linux-input@vger.kernel.org>; Wed,  7 Dec 2022 05:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670419508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kCotRP+p4aRtgAlGIY3Q4W2JamDUfpxY8dqSo3+FJ5c=;
        b=c0YlaGNetY/vYJRv+O3iGy95QdYb201rxNPA7F0b8UxHiFnnV0A1jd4iSo/vtsG37FX1Wf
        tg4AwyYdJlwgDLq132uv90+PB8Q4NrLFhGEGVnlgelrfVQl5jOZM86HigiiYP1H22Q6IBa
        X9oOnuipIt8T5+umPj6B0lTfgKOIC3E=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-9BCD3Sz8OXS64sHVZFgzjA-1; Wed, 07 Dec 2022 08:25:07 -0500
X-MC-Unique: 9BCD3Sz8OXS64sHVZFgzjA-1
Received: by mail-il1-f198.google.com with SMTP id w15-20020a056e021a6f00b00303520bff1dso9198285ilv.20
        for <linux-input@vger.kernel.org>; Wed, 07 Dec 2022 05:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCotRP+p4aRtgAlGIY3Q4W2JamDUfpxY8dqSo3+FJ5c=;
        b=Gz2MPNk2QPrZQYeHReh/9ixehAS7BX2QqKtOiXOBnWedaweNp4mH/kpBI3wJ2JPJxh
         hEAiHuvd0HKyOuf8wrqtHT8pdUC/pE75CyWD2e/mBe3NsG/raVRbKUFEjZP3tO4h+rmQ
         4ocEwbORQ0AQyFdcoZOIcldoPxFxwFlwJrLJWteTWgVGjzjGWLnrfdgesTqyslz/R+2T
         iCaHAqqimco9sq37SeVOndiPIhIOdWqfd+11LQQrIrpeiut4XJNFUwbqJFd2IqcloIuJ
         7pYDQOQSlMuF5seSR/zXJGmTyeIGurjnCjIlzm+gC+dmtuBzpO8i9kC1GBPlG2EzWuc9
         kqWw==
X-Gm-Message-State: ANoB5pmeAAKQDevZjupyrRYhklaCP5U+FMUUaHesbbDXWR00R8+s2o0n
        wlWN/DySujCVxfVEqVQ0aiDZ98y3Tc6R3n7b6DflP+vBo5fNWEg7XzhGiQs32nFp4wopy/tWn97
        b5i0mFgxzE+rv7a0FnzFykjNtxwAlGMmfoL/9HSg=
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id h23-20020a02c737000000b003751c5f3127mr33947921jao.251.1670419506666;
        Wed, 07 Dec 2022 05:25:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ObJyw9BrClBrO0ARlsu1cIu7j2QCokaz8TTlg2NRS2PmqhY/MqLqpdexdcJdrXNSR5fW93Nu4WbKyKUR7d8w=
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id
 h23-20020a02c737000000b003751c5f3127mr33947906jao.251.1670419506424; Wed, 07
 Dec 2022 05:25:06 -0800 (PST)
MIME-Version: 1.0
References: <2262737.ElGaqSPkdT@kreacher> <5647715.DvuYhMxLoT@kreacher>
 <2283816.ElGaqSPkdT@kreacher> <e7eb0e0c9aea30c0e3205b2f3d96b74a52283b40.camel@hadess.net>
 <CAJZ5v0ibpzoBLXKiqzciYv1Htks0=4+4_XGLvpH7MCyFoYJiDg@mail.gmail.com>
 <CAO-hwJL7n7HFk4MTKvLcvBPSLDwm9pHqLaZvmuwvSNDVWUF76g@mail.gmail.com>
 <nycvar.YFH.7.76.2212071117420.6045@cbobk.fhfr.pm> <f0ccee0d2f85099c146ee682b25d30c832155fa3.camel@hadess.net>
 <CAJZ5v0iwEKtLVzzJw+XG5-w=qr86ec0yKpAWCU-KLwYmFnt5Zg@mail.gmail.com>
In-Reply-To: <CAJZ5v0iwEKtLVzzJw+XG5-w=qr86ec0yKpAWCU-KLwYmFnt5Zg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 7 Dec 2022 14:24:55 +0100
Message-ID: <CAO-hwJLXPKwvFPHFq=y12p41Sx2Ab69sAY9Co7i0=iL1HzdXOg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] HID: logitech-hidpp: Add Bluetooth Mouse
 M336/M337/M535 to unhandled_hidpp_devices[]
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 7, 2022 at 2:01 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Dec 7, 2022 at 1:43 PM Bastien Nocera <hadess@hadess.net> wrote:
> >
> > On Wed, 2022-12-07 at 11:19 +0100, Jiri Kosina wrote:
> > > On Wed, 7 Dec 2022, Benjamin Tissoires wrote:
> > >
> > > > Agree, but OTOH, Rafael, your mouse is not brand new AFAICT, so I
> > > > am
> > > > worried that you won't be the only one complaining we just killed
> > > > their
> > > > mouse. So I think the even wiser solution would be to delay (and so
> > > > revert in 6.1 or 6.2) the 2 patches that enable hid++ on all
> > > > logitech
> > > > mice (8544c812e43ab7bdf40458411b83987b8cba924d and
> > > > 532223c8ac57605a10e46dc0ab23dcf01c9acb43).
> > >
> > > If we were not at -rc8 timeframe, I'd be in favor to coming up with
> > > proper
> > > fix still for 6.1. But as things currently are, let's just revert
> > > those
> > > and reschedule them with proper fix for 6.2+.
> >
> > Has anyone seen any other reports?

It's not so much about how many reports, but *what* the end result is.
If the device were working-ish, that would have been OK. But here the
device is completely ignored by the kernel which basically enters the
"no regression rule".

> >
> > Because, honestly, seeing work that adds support for dozens of devices
> > getting tossed out at the last minute based on a single report with no
> > opportunity to fix the problem is really frustrating.

I know, and I feel your pain as I was about to have the same last week
for HID-BPF. But as much as I hate dropping patches from the queue,
not being able to have at least a week to fix it properly ends up with
"fixes" that are broken and that might break other devices. Talking
from experience as my first fix from last week was exactly in that
category.

>
> Well, that's why I sent patches to address this particular case
> without possibly breaking anything else.

My concern is more that we now have a data point were the series broke
a device (pretty badly) and if (when) this happens shortly after 6.1
is getting released, we would have to say, oh yes, we know, so we need
to patch the kernel because our driver is buggy, and we knew it. This
is not acceptable, and I am sure that if Linus reads that thread he
would revert the 2 patches or maybe more.

>
> Improvements can be made on top of them and the blocklist entry added
> by patch [2/2] need not stay there forever, FWIW.
>

I need to check with Jiri, but there is a chance we can re-introduce
this in 6.2. This way we will have slightly more time to fix it in a
proper way.

Cheers,
Benjamin

