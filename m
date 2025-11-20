Return-Path: <linux-input+bounces-16255-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B09BDC74804
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 560AF34C0E8
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDAA349B00;
	Thu, 20 Nov 2025 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ArlPmuW3"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D2349AE4
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648176; cv=none; b=PLdJCzDK7Gt2Tn4q67KXezADhfSQfIq2SRDgeCw7QMJ0S5YyL/dWlVOVqfTdHBKDpOqW+qgGvCdFdS98WeScY6v76STkoHZL5uSvMxW03DkWsQKL9jeUHWtd5aHpFnrlZgSFMbmqR8Bj+7SDkAftQIwFKzRTagzoA/qpyopfi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648176; c=relaxed/simple;
	bh=LcdmC8BWjSRfnP1JsZPnb1OcIizxXuDrfcT5q0q86oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRGAO8ym01wwH0AFSadUGgipZ2pM6HStHJDPK4hyCj3SDFgb6Hor9akVY8b8hvhiJ9ms4T8zjgR+0yiHOyQsdPIc5qRkyqeWPIO8feO6rlVTKAdy6UC5j6vvFqC6DYRg5jpc7+I0v53YTKQNlazYK3rJYH5+tj7a+5LANdPpdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ArlPmuW3; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id D500E3F760
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:16:11 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id E15D03F6D2
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:16:07 +0200 (EET)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 36F30200C4A
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:16:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763648167;
	bh=+3FlKU7kMhRhP7PLm69wTNV9J2vjBQaBUz9iKEsYq78=;
	h=Received:From:Subject:To;
	b=ArlPmuW3+ioEcBlFufl8llnld/+ouIQL/eDU5JOLz0HWGhrMYCDedeVPIo0koxHKx
	 wPPFlR/ubj0aCm4i0HC5pOPmnIN91fQNg/Yoeicd/k+1kiCKEPtY39rQI/PNHHXgdJ
	 ZMZHbOgMH43AWwiWd5Sk6A5Fm8J2XLQQLG70jfSRRtxPmKlhrQlo3ISx5wqyxWAQsl
	 FkVo+kp4uovh4DQxGPKhhVlWc6RxKskNubLKjtuyKv/mflkJttx4D/2WUP+MrTt+pT
	 7t1EpXdeU6tg3czpFgEk3A57HACTDcUxCM4KaL/Su06x57G70rjjIJ1m76EAMXv/m0
	 FzCy89Eekp5KQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso8415671fa.0
        for <linux-input@vger.kernel.org>;
 Thu, 20 Nov 2025 06:16:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUEg6sxgggz97Y3YTk9c3Z4AuoESBZ2C3oTjUvI9kDj68RkLUR7CRsmNT4J3BqW7pT1o6b3ssjRdCI44A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDZzW6OZc95IR5np791Lmq5C1RXsqLTMHX9kFulEe40kVXor4
	hid7sAzrujsb290HInuRAxugNdXNsviJXATqXM2WKZJx3VHkmysedJvrz7hj3I7I6nwNxJ4X5LA
	0u9qE1sT4FHJHZqqsATceCAy68EWG/Zc=
X-Google-Smtp-Source: 
 AGHT+IFzbbgguDckno7DAED1XLqfHcvCwYp7aaETheTG7gNlPneDY5E5gil3V5Dj8g2V/HLmUuzVlCtvJaN0fxgf5ps=
X-Received: by 2002:a2e:8645:0:b0:375:ffc2:1b40 with SMTP id
 38308e7fff4ca-37cc68ca9a9mr9575291fa.35.1763648166743; Thu, 20 Nov 2025
 06:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-7-lkml@antheas.dev>
 <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
In-Reply-To: <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 15:15:54 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
X-Gm-Features: AWmQ_bnuY39r4tTrRYDKH82bP8pVnBKMWQargzD1tTa0iYJIlpKxzhc199bI7pk
Message-ID: 
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] HID: asus: early return for ROG devices
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176364816744.2642192.5311640841647849574@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 14:29, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > Some ROG devices have a new dynamic backlight interface for control by
> > Windows. This interface does not create an ->input device, causing the
> > kernel to print an error message and to eject it. In addition, ROG
> > devices have proper HID names in their descriptors so renaming them is
> > not necessary.
> Is this patchset supposed to work without the renaming, correct?
>
> If so consider dropping the drop of renames, taking required time
> to organize with Derek and resubmit when things are ready:
> there is no point for the rename to stall the rest and quit renaming
> is not urgent at all.

I feel like two months is enough of a timeframe for a simple rename
fix to go in.

I do not want to have to reorder the checks just so the rename can
stay in _for now_. Skipping the ->input check is important for both
Xbox Ally/Z13 as it causes errors and the device to stay partially
uninitialized.

> > Therefore, if a device is identified as ROG, early return from probe to
> > skip renaming and ->input checks.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 3047bc54bf2e..6193c9483bec 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >           asus_kbd_register_leds(hdev))
> >               hid_warn(hdev, "Failed to initialize backlight.\n");
> >
> > +     /*
> > +      * For ROG keyboards, skip rename for consistency and ->input check as
> > +      * some devices do not have inputs.
> > +      */
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> > +             return 0;
> > +
> >       /*
> >        * Check that input registration succeeded. Checking that
> >        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> Just for clarity is this supposed to fix this: https://gitlab.com/asus-linux/asusctl/-/issues/700 ?
> This model works once in windows users disable  that new feature.
>
> Note: that kernel the person submitting the bug is using contains your v8
> and asus-armoury.
>

No. This user has a laptop that has at least a WMI implementation of
RGB controls (this is why you can see rgb settings). Since you did not
ask for logs, it is not clear if it also has a HID implementation that
is skipped due to e.g., a missing product ID. Very likely it is a bug
on the WMI implementation that is out of scope for this series.


