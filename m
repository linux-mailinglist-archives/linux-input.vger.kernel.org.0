Return-Path: <linux-input+bounces-11725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D74A84D6C
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 21:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7FE37B4CDF
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 19:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9294B28FFF0;
	Thu, 10 Apr 2025 19:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="P7XuaM/z"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2A81F12FB;
	Thu, 10 Apr 2025 19:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314313; cv=none; b=nInk7Lny3SZG9bFikScBi21wLTk4o4osR5KFgLsTrXOwAQ5gry32Y/h+Pre3IMS6PQMsM+O0tmv+kRGpg54tWyfx/z3ep2eFWB1yPxnwI4JYgsZsv6Q/dOAnzSlXYsL04Me1lQXVwMWeT0yb8uYZI7r4ljJWmHNvwBrxgwvz6/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314313; c=relaxed/simple;
	bh=nYuYtFWEsen9f2D7ItDfNNjWzV+yKZLxUypDQA+DWlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2S59ISvGr/658nCKLgNqoSkWTeiRGOu8+vE3wJcdNJPbS71nxImX26rjH/tR6yMFyduL3mNWo9wYqw+wtnQKNIGMNPskHEit9Q6U8cAmmKcdKGbRlx0Hm+GlQX2UYFHHbPyEBSV6P8uzMwRGoM+uPPV5/fuvi291qSKw/P0h8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=P7XuaM/z; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id A25F12E09463;
	Thu, 10 Apr 2025 22:39:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1744313963;
	bh=FOGdZqRgrRfjCXzxKmtyNviIBZYCEd5J8vC9FJL0iik=;
	h=Received:From:Subject:To;
	b=P7XuaM/zM6DP0rEWAXZcH2n1hCr3kvjNBcEgCE6nnOntDxpAE4leGK0lFuNfOeI/p
	 Yjuh/Uc/8BM5v1U8GMGwtHdhJ2rpEttLlhBlGHXg84vtKRb4KrXT5N3Im3OxbmYj6O
	 CCTTE4Rto/aVkjzNR41ZSyk6pLPunrQTSXO8Z8SA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30effbfaf4aso11471611fa.3;
        Thu, 10 Apr 2025 12:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU88GyfGnBKRBYviP7AWW10zoib5yT5F9OdTWm1TV6CEaCf+pfW2+yOPfqLGQY+z7uT94ksrxmBaQ5tCaNv@vger.kernel.org,
 AJvYcCXxp7K8KvuyELcnGgL3oEqp5lSoWMzSGUZIeo0m2BGHJkvx5tFzBOlAwi/4/QCQAhaHvob2Gekqn94d4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjpOb4PSvU6ayMLI0RWoQA63Bc3nrc18hHdigx7O8vkbc8NGD
	OS28ys2volO8Ybb4uBKd3kHiOEUWtRQQxeNoeU1WDS0iyGReRnXg1+jY2hi+dWg7EYJU24QtUyd
	UywPUst5W9zYqLMI3qN2WXVf8C2c=
X-Google-Smtp-Source: 
 AGHT+IEepTHsF241IzEilHxJsf/PKafP8ocYWw9ljd0ITH+/epE0kwn561dq9fLGrkwW9h8DsARHPA4q+CGzK5B2XLI=
X-Received: by 2002:a05:651c:12ca:b0:30b:9813:b00e with SMTP id
 38308e7fff4ca-30facc202a3mr12439491fa.24.1744313961756; Thu, 10 Apr 2025
 12:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184601.10990-1-lkml@antheas.dev>
 <20250325184601.10990-11-lkml@antheas.dev>
 <648a1d1f-a222-480a-aec9-ab3e0cf790a1@ljones.dev>
 <CAGwozwFrbspt+OfzaCR1B98Z=1GFS6nTdnVpWFeb71aLJLBUxQ@mail.gmail.com>
In-Reply-To: 
 <CAGwozwFrbspt+OfzaCR1B98Z=1GFS6nTdnVpWFeb71aLJLBUxQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 10 Apr 2025 21:39:08 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGqy344a_hr=2sKOiB3zUN36M12nOKp4_JpUuhW-pYBXA@mail.gmail.com>
X-Gm-Features: ATxdqUHqeB-knh3wXRj4IY16EpcxPgWnylWSLpRJ0qODGgQdGYA57RGvwYyQHxk
Message-ID: 
 <CAGwozwGqy344a_hr=2sKOiB3zUN36M12nOKp4_JpUuhW-pYBXA@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] HID: asus: add RGB support to the ROG Ally units
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174431396302.30498.17323684915039915382@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 31 Mar 2025 at 09:52, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Mon, 31 Mar 2025 at 00:11, Luke D. Jones <luke@ljones.dev> wrote:
> >
> > On 26/03/25 07:45, Antheas Kapenekakis wrote:
> > > Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> > >
> > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >   drivers/hid/hid-asus.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > index c135c9ff87b74..fa8ec237efe26 100644
> > > --- a/drivers/hid/hid-asus.c
> > > +++ b/drivers/hid/hid-asus.c
> > > @@ -1424,10 +1424,10 @@ static const struct hid_device_id asus_devices[] = {
> > >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> > >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> > > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> > >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> > > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> > >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > >           USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
> > >         QUIRK_ROG_CLAYMORE_II_KEYBOARD },
> >
> > Hi Antheas,
> >
> > I have some good news for you, ASUS got back to me, there *is* a way to
> > get the feature level of a keyboard.
> >
> > ## 2.2. Configuration command
> >
> > In order to confirm what functions are the USB device supported, host
> > retrieves the
> > configuration information by feature report method. Therefore, the
> > firmware has to
> > return the data (byte 0x06~) to the host.
> >
> > ### 2.2.1. Set feature
> >
> > | Byte 0    | Byte 1    | Byte 2   | Byte 3   | Byte 4     | Byte 5  |
> > |-----------|-----------|----------|----------|------------|---------|
> > | Report ID | OP code   | Addr_L   | Addr_H   | Read ROM   | Length  |
> > | Report ID | 0x05      | 0x20     | 0x31     | 0x00       | 0x08    |
> >
> > ### 2.2.2. Get feature
> >
> > | Byte 0    | Byte 1    | Byte 2   | Byte 3   | Byte 4     | Byte 5  |
> > |-----------|-----------|----------|----------|------------|---------|
> > | Report ID | 0x05      | 0x20     | 0x31     | 0x00       | 0x08    |
> >
> > **Byte 6**
> > - 0x00: KB, 1-zone with single color
>
> Nice find. The asus-hid driver already implements this and checks for
> 0x00 to bail the backlight.
>
> So that check should be removed as it does not work with single color
> keyboards and instead checked for 2,3,4 to enable RGB.
>
> This also means removing the RGB check and getting global support in one go.
>
> Antheas
>
> > - 0x01: KB, QWERASD-partition
> > - 0x02: KB, 4-zone with RGB
> > - 0x03: KB, Per-key with RGB
> > - 0x04: KB, 1-zone with RGB
> > - Other: reserved
> >
> > **Byte 7(keyboard language)**
> > - 0x01: US
> > - 0x02: UK
> > - 0x03: JP
> > - Other: reserved
> >
> > I've not done anything with this myself yet, circumstances last week
> > weren't great for me. If you implement this in driver I will ensure I
> > get it tested as I have both single colour and rgb laptops.
> >
> > What i *do* know is:
> >
> > - 0x00: KB, 1-zone with single color
> > - 0x01: KB, QWERASD-partition
> > These can be standard kb_backlight
> >
> > - 0x02: KB, 4-zone with RGB
> > - 0x03: KB, Per-key with RGB
> > - 0x04: KB, 1-zone with RGB
> > These work with the regular EC-mode RGB command for static/solid colour
> > and you don't need to worry about zone/per-key. It would be good to
> > document those as defines or enum or something for future.

Let's start slowly getting back into this.

Ok, the lightbar of the Z13 returns:
5a05203100080100010423000100060214020000000000000153550000000000

And the keyboard returns:
5a052031000801000004250501002e0000000000000000000000000000000000

That is 01 for both the lightbar and keyboard when it comes to zone
(QWERASD) and 00/undefined when it comes to keyboard?

Now, if they meant byte 6 _after_ the header:
5a0520310008 01 00 01 04 23 00 01 00060214020000000000000153550000000000
5a0520310008 01 00 00 04 25 05 01 002e0000000000000000000000000000000000

It is still inconclusive

So I am unsure what to make of this

Antheas

> > Hope this helps.
> >
> > Cheers,
> > Luke.

