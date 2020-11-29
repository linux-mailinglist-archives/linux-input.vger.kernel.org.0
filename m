Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EBE2C7B53
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 22:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgK2VOB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 16:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgK2VOA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 16:14:00 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399A6C0613D3
        for <linux-input@vger.kernel.org>; Sun, 29 Nov 2020 13:13:20 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y10so13949350ljc.7
        for <linux-input@vger.kernel.org>; Sun, 29 Nov 2020 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xwiVG3tVEBGHeUjQEfo2Oq/3+t5as5wCCQ13zXVEmrk=;
        b=RMJtgA1b8UH/WWfuof27DvHP4SbEz9n0vdt9RRJoiRE3ZFsK5EGsTa1pHTJXq1aUw9
         5JJLWVyDfMowuGK1q80BG5cpnFn74kor1Q+X2Nzd10JlL5IDa1ToOprJ3n4VNUsuwIIw
         pbSiLZaABsmjgelpeWgGAoTT7cuc9qTiOSVyGSqdm+T5EwJ/HwOHjXxAt5Qu7G1GoGc+
         /jqhpq3Hx+gW3pKLdwSX62lpfd8N5AFZbLN5XMueufntbWBb213KXtrGKw/2f0dYZI6n
         joeESxMeR1kh1aX/T/OdIcpxMYchQ6cI+YR6Taox5Yjn3rleZAjUUFOiMKhxS/EqPlDr
         O5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwiVG3tVEBGHeUjQEfo2Oq/3+t5as5wCCQ13zXVEmrk=;
        b=kzIaFIBXl84cq8Fx9YUrU0bPbNBgx0wxrEU0kJdQOPV+buLmEDnuAfmbunRRAAWYeR
         Fqr29gBDdNFWNo8FHz7xE1WaYQKqVe1cNQWZskTy2y95SKkcagGTRmhRmcXdt8R/W4tn
         8BVychrooVEb494d/Qc1z8Ae/GNpCqq7JKfr0FgbegWx9A+YWA/0cUw+Lu8mqVBcF0k9
         PyQAMCyZ08LMRVjVSa78PcBsEjZ5GD2XY/OPq63ukXDAXMEPOQrjIg7hh2mH9+1YqE+N
         cPOcmJLROnEJ+OmG3Zu2V422TqriI3aYjas1p4X1A7/6A8IfkrV2/3Wmrp9pEt6+tNtt
         Ledw==
X-Gm-Message-State: AOAM530kin3jGeBuldhpCy7DW8ZbloFKhzjuLiwE80yINpHAOhBrWI5R
        sAP+mxv5ydG+cFLyLMKMaPYUddbNNC5m5v+vOIglow==
X-Google-Smtp-Source: ABdhPJzGLYiMckhQIgt9ToZ4TGowXYvdlCbUgmt+wG1pH4LgtxRpCYDJGVfCXdP5TeMwJtnSTSlVfvDd/lhIW84gMxw=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr8782872lji.100.1606684398696;
 Sun, 29 Nov 2020 13:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20201128123720.929948-1-linus.walleij@linaro.org> <20201129025328.GH2034289@dtor-ws>
In-Reply-To: <20201129025328.GH2034289@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 29 Nov 2020 22:13:06 +0100
Message-ID: <CACRpkdY8r5_EYAtWLL2vZQ8ULf6rG-VfgDe=7oveJQwiRXxTNg@mail.gmail.com>
Subject: Re: [PATCH] Input: atmel_mxt_ts - Fix lost interrupts
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Andre <andre.muller@web.de>, Nick Dyer <nick.dyer@itdev.co.uk>,
        Jiada Wang <jiada_wang@mentor.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 29, 2020 at 3:53 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Sat, Nov 28, 2020 at 01:37:20PM +0100, Linus Walleij wrote:

> > @@ -1297,8 +1297,6 @@ static int mxt_check_retrigen(struct mxt_data *data)
> >       int val;is
> >       struct irq_data *irqd;
> >
> > -     data->use_retrigen_workaround = false;
> > -
>
> So this will result in data->use_retrigen_workaround staying "true" for
> level interrupts, which is not needed, as with those we will never lose
> an edge. So I think your patch can be reduced to simply setting
> data->use_retrigen_workaround to true in mxt_probe() and leaving
> mxt_check_retrigen() without any changes.

I did that first but then I realized that since there is an
errorpath in mxt_check_retrigen() and it starts by disabling
the workaround so in an error occurs in
__mxt_read_reg() it will be left disabled.

But I see that I fail to account for the level-trigging
case where it should disable the workaround and
bail out so I anyway need to revise the patch.

> However I wonder if it would not be better to simply call
> mxt_check_retrigen() before calling mxt_acquire_irq() in mxt_probe()
> instead of after.

I don't fully understand this driver, but it seems the information
whether retrigen is available only appears after talking to the
device a bit, checking firmware and "objects" available on the
device and then it may already be too late.

Someone who knows the device better might be able to
contribute here :/

> By the way, does your touchscreen work if you change interrupt trigger
> to level in DTS?

Nope. This happens:
[    1.824610] atmel_mxt_ts 3-004a: Failed to register interrupt
[    1.830583] atmel_mxt_ts: probe of 3-004a failed with error -22

And that in turn is because this connected to a Nomadik
GPIO controller which is one of those GPIO controllers
that only support edge triggered interrupts and does not
support level interrupts. So it needs to be edge triggered on
this platform.

Yours,
Linus Walleij
