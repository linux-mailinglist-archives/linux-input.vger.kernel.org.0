Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11773B9A59
	for <lists+linux-input@lfdr.de>; Fri,  2 Jul 2021 03:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbhGBBEw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Jul 2021 21:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234564AbhGBBEv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Jul 2021 21:04:51 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F93C061762;
        Thu,  1 Jul 2021 18:02:20 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id a7so7989604pga.1;
        Thu, 01 Jul 2021 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UlRaziJx7TG6nALXj+SGSTTIDO8Ah1AeLcJr/4yfTEo=;
        b=N3qrbUbrbXvO6UBNyPwxKENi27xaa+ZyNXM6j73mX+vTKc0YdsY4jGFhtweBmuMATQ
         wI4SCSn0a5BdNPya0Dwgm7o9kQtFFnV++aH6kKD85edHCKUEYetEE0aTxXBOxwkVZPIg
         HYE5VSWDvHZIyrOkMQQJkcK0uoOgAp2WgHEqc5nIq6xDHz+dPrhz/18F3G2/gdDYunYD
         bOgAL//p2u8UIjb3wpHy758dWgiGxy1AJlfTKOjc+xHxHnhZ80/eu86gVAgRIZYfOv1D
         I5E1IP1+SlC2g80gBnnvB6kDWcW5yPNBRP2MOhZ7CKdZVpW1kLKKTQvE3KIO4GKAzqQh
         hnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UlRaziJx7TG6nALXj+SGSTTIDO8Ah1AeLcJr/4yfTEo=;
        b=So0n1wedMIU2ribzFeah8w+Hddui1QiB6+BSTVUZP/VNB63wFhIITPMY6WpuytgF3k
         OKSPCudfKijsW3cxNYTiY5mDUmRZRFY2cg1RkOR/UdjHjf7/I8LT6dF21mtHGVg8nlTL
         YARBir763MMusFtcWJqnq8U1hcQQ6BgqZkKWha3nDSgb3qsf+O/EfBSFxcjH9+yU4Fxl
         9awma79QaA4JBt0pOtz4lygNe8l3I/YXfoZs6d/1iDthqJYXcgiL8bTBaq0NjMb+ITl+
         smXjCrTsMqGN/7a1vjzuwAr/5G5hAYvsJdmVKLPatz9wpTeD4rHlUBQh/f6FH+9wtbam
         jJnQ==
X-Gm-Message-State: AOAM532DvinaoOaDB+t7uQD1BRMYgq5OTd7qcTljpaDoMrHHRK/VSnx0
        FbIJEmLRO1FF3lJ01FO0jSc=
X-Google-Smtp-Source: ABdhPJzTREkZp9dUcvTZuI7IztdsabYQPAgtglkvGMlzzhr3yxSAhWflfuZ9WeDF7GXmlSkPcE5zYw==
X-Received: by 2002:a62:844d:0:b029:308:230c:fe3a with SMTP id k74-20020a62844d0000b0290308230cfe3amr2759538pfd.34.1625187739384;
        Thu, 01 Jul 2021 18:02:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5027:e508:7678:5df6])
        by smtp.gmail.com with ESMTPSA id y9sm1244254pfa.197.2021.07.01.18.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 18:02:18 -0700 (PDT)
Date:   Thu, 1 Jul 2021 18:02:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Kenneth Albanowski <kenalba@google.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: input: do not report stylus battery state as "full"
Message-ID: <YN5llwVfb0abPJZU@google.com>
References: <YNtlrrKZVQY4byVa@google.com>
 <CAO-hwJJ-VyKBohETJabxmgjZ8RtmZHWWOBr2kZNC=feOxHgTtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJ-VyKBohETJabxmgjZ8RtmZHWWOBr2kZNC=feOxHgTtQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Wed, Jun 30, 2021 at 09:09:27AM +0200, Benjamin Tissoires wrote:
> Hi Dmitry,
> 
> On Tue, Jun 29, 2021 at 8:26 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > The power supply states of discharging, charging, full, etc, represent
> > state of charging, not the capacity level of the battery (for which
> > we have a separate property). Current HID usage tables to not allow
> > for expressing charging state of the batteries found in generic
> > styli, so we should simply assume that the battery is discharging
> > even if current capacity is at 100% when battery strength reporting
> > is done via HID interface. In fact, we were doing just that before
> > commit 581c4484769e.
> 
> This commit is 4 year old already, so I'd like to have the opinion of
> Bastien on the matter for the upower side (or at least notify him).
> 
> >
> > This change helps UIs to not mis-represent fully charged batteries in
> > styli as being charging/topping-off.
> >
> > Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
> > Reported-by: Kenneth Albanowski <kenalba@google.com>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/hid-input.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index e982d8173c9c..e85a1a34ff39 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -417,8 +417,6 @@ static int hidinput_get_battery_property(struct power_supply *psy,
> >
> >                 if (dev->battery_status == HID_BATTERY_UNKNOWN)
> >                         val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
> 
> What's the point of keeping the HID_BATTERY_UNKNOWN code path? AFAICT,
> before 581c4484769e, we were just returning
> POWER_SUPPLY_STATUS_DISCHARGING. If we don't need to check for the
> capacity, I think we could also drop the hunk just before where we do
> the query of the capacity.

I believe it is beneficial to keep this check: prior to 581c4484769e we
were only handling batteries reported via generic device control -
HID_DC_BATTERYSTRENGTH - essentially UPS batteries that normally can be
queried at will. Stylus batteries are typically only reported when
stylus is in contact with the digitzer, so until user actually engages
stylus we do not have idea about its level/capacity. For this reason I
think we should keep reporting POWER_SUPPLY_STATUS_UNKNOWN.

Thanks.

-- 
Dmitry
